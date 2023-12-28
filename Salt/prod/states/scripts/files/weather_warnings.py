import json
import pprint
import feedparser
import time
import sys, getopt
import configparser
import argparse
import os
workingdir  = '/opt/scripts/'
newfilesdir  = '/opt/scripts/newjson/'
oldfilesdir  = '/opt/scripts/oldjson/'
newfiles    = os.listdir('/opt/scripts/newjson')
oldfiles     = os.listdir('/opt/scripts/oldjson')
parseconfig = configparser.ConfigParser()
parseconfig.read("/opt/scripts/weather.config")
password    = parseconfig.get("configuration","password")
account     = parseconfig.get("configuration","account")
from pushover import Client
client = Client(account, api_token=password)

#this opens the config we created earlier and parses it with a for loop into c
#I do this three times so i can get one message out when i start the script
#another two for when I want to compare the data on the feeds, and send out when it changes. 
def dailyrun():
#this opens up the feeds.json file
  with open(workingdir +'feeds.json') as fd:
    config = json.load(fd)
    for id, details in config.items():
        c = feedparser.parse(details['url'])
        time.sleep(1)
        for allpost in c.entries:
          if 'title' in c.feed:
            if 'title' in allpost:
              if 'summary' in allpost:
                messagelist = [allpost.title, allpost.summary, c.feed.title, c.feed.id]
                message= '\n'.join(messagelist)
                client.send_message(message)
                pprint.pprint(c.feed.title)
                pprint.pprint(c.feed.id)
                pprint.pprint(allpost.title)
                pprint.pprint(allpost.summary)
              else:
                messagelist = [allpost.title, c.feed.title, c.feed.id]
                message= '\n'.join(messagelist)
                client.send_message(message)
                pprint.pprint(c.feed.title)
                pprint.pprint(c.feed.id)
                pprint.pprint(allpost.title)
          with open(oldfilesdir + id + ".json", "w") as write_file:
            json.dump(c, write_file)
def compare(): 
  #This is comparing each number.json file of old data and new data.   
  #checks to see if the titles are the same for entries, this is usually where the no watch stuff comes in
  newchanges = 0
	#compare portion of the script
	#open the config file again for the feeds
  with open(workingdir + 'feeds.json') as fd:
      config = json.load(fd)
  #loop through them and create the new .json files
  #these will be compared with id.json files.
  for id, details in config.items():
    e = feedparser.parse(details['url'])
    for newpost in e.entries:         
      with open(newfilesdir + id + ".json", "w") as write_file:
        json.dump(e, write_file)
  # this loads the old file from dailyrun, and the new files we just created above
  loaded_oldfiles = []
  loaded_newfiles = []
  for i in oldfiles:   
    with open( oldfilesdir + i, "r") as olddata:
      oldload =json.load(olddata)
    loaded_oldfiles.append(oldload)
  for k in newfiles:   
    with open( newfilesdir + k, "r") as newdata:
      newload =json.load(newdata)
    loaded_newfiles.append(newload)
  #This zips over the old files and new files 
  #twice because there are multiple entries in these dictionaries
  #Then it checked if there is a new title, if yes it checks for summaries, 
  #and if there is a new summary it will send out a push over email to my phones
  #if there is a new title but not a new summary, this ually means there is no longer a warning going on
  # send it out without a summary.
  for m,j in zip(loaded_oldfiles, loaded_newfiles): 
    for old,new in zip(m['entries'], j['entries'] ):
      if old['title'] != new['title']:
        if 'summary' in old:
          if 'summary' in new:
            if old['summary'] != new['summary']:
              pprint.pprint(j['feed']['title'])
              pprint.pprint(old['title'])
              pprint.pprint(old['summary'])
              pprint.pprint(new['title'])
              pprint.pprint(new['summary'])
              messagelist = [new['title'], new['summary'], j['feed']['title'], new['id']]
              message= '\n'.join(messagelist)
              client.send_message(message)
              newchanges = 1
        else:
              pprint.pprint(j['feed']['title'])
              pprint.pprint(new['title'])
              messagelist = [j['feed']['title'], new['title'], new['id']]
              message= '\n'.join(messagelist)
              client.send_message(message)
              newchanges = 1
  #this checks if the new changes variable has been set,
  #if so then it creates the old files again, so it can be checked at next run. 
  if newchanges == 1:
    for id, details in config.items():
      c = feedparser.parse(details['url'])  
      for allpost in c.entries:
          with open(oldfilesdir + id + ".json", "w") as write_file:
           json.dump(c, write_file)
           pprint.pprint("updating old json")  

  #d.clear()
  #e.clear()
parser = argparse.ArgumentParser()
FUNCTION_MAP = {'dailyrun' : dailyrun,
                'compare' : compare }

parser.add_argument('command', choices=FUNCTION_MAP.keys())

args = parser.parse_args()

func = FUNCTION_MAP[args.command]
func()
