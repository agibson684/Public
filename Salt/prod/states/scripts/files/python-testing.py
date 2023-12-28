import feedparser
import json
#python testing
#multiple rss feeds in json file, i want to put one in d variable then do the for loop below and write a .json file for each entry with their contents
#def warnings():
#    for entry in d.entries:
#        entryname = entry.title + ".json"
#        with open(entryname, 'w') as outfile:
#            json.dump(entry.title, outfile)
#            json.dump(entry.description,outfile)

with open("feeds.json", "r") as f:
  data = json.load(f)

#for feeddata in d:
#       d = feedparser.parse(feeddata.url)
#       print (feeddata)
       