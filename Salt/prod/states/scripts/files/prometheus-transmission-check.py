import subprocess, sys, getopt, json, pprint, time, configparser, argparse, os, shutil, glob, shlex

bittorrent  = '/pool/BITTORRENT/completed/'
incomplete  = '/pool/BITTORRENT/incomplete/'
from benedict import benedict
d = benedict.from_yaml('/opt/scripts/shows.yaml')
bittorrent_files = glob.glob(bittorrent + '*')
parseconfig = configparser.ConfigParser()
parseconfig.read("/opt/scripts/weather.config")
password    = parseconfig.get("configuration","password")
account     = parseconfig.get("configuration","account")
from pushover import Client 
client = Client(account, api_token=password)
def lock():
  if os.path.isfile("/tmp/lock_push_tv_show"):
    print("cant lock file")
    exit(1)
  else:
    f = open("/tmp/lock_push_tv_show", "w")
    f.write("create lockfile")
    f.close()

def  sync_box():
  lock()
#pprint.pprint(d['shows'])
#pprint.pprint(d['shows'][1][0])
#pprint.pprint(d['shows'][1][1])
####this cleans up the complete files on transmissions on xena
  p1 = subprocess.run([
          "/usr/bin/transmission-remote",
          "xena.thrace.lan:9091",
          "--auth",
          "erin:password",
          "-l",
      ],
      stdout=subprocess.PIPE,
      text=True
    )
  for line in p1.stdout.splitlines():
        if '100%' not in line:
          continue
        line_strip = line.strip()  
        ready = line_strip.partition(' ')[0]
        print(repr(line))
        print(ready)
        s = subprocess.run(
            [
                "/usr/bin/transmission-remote",
		"xena.thrace.lan:9091", 
                "--auth",
                "erin:password",
                "-t",
                ready,
                "--remove",
            ]
        )
        print(s)
#####this moved the files from completed bittorrent directory to incomplete directory on gabrielle
  for torrent in bittorrent_files:
      try: 
        print('moving torrents', torrent)
        shutil.move(torrent, incomplete)
        message = ("new Torrent\n" + torrent)
        client.send_message(message)
      except:
        print('failure to move')
        message = ("failure to move, something is wrong with bittorent moves\n" + torrent)
        client.send_message(message)
  incomplete_files = glob.glob(incomplete + '*')
  for file in incomplete_files:
      base = os.path.basename(file)
      lower_base = base.lower()
      lower_complete = os.path.join(complete + lower_base)
      try: 
        print('moving to complete', incomplete_files)
        shutil.move(file, lower_complete)
        message_new = ("New Torrents Moved to Downloads\n" + file)
        client.send_message(message_new)
      except:
        print('move failed, running rsync now')
        message_new = ("New Torrents Synced  to Downloads\n" + file)
        client.send_message(message_new)
        r = subprocess.run(["rsync", "--remove-source-files", "-avc", file, lower_complete])
        print(r)
    ##this removes the lock file
  os.remove("/tmp/lock_push_tv_show")

#######this moved the files from upper case to lower case into their final destination
def main():
  lock()
  for key, value  in d.items():
          to = os.path.join(destination, value)
          froms = glob.glob(complete + key)
          for file in froms: 
            try:
              print(key, '->', value)
              print(file, '->', to)
              shutil.move(file, to)
            except Exception as error: 
              print(file, 'and', to, 'can not move', error)
              pass
              p = subprocess.run(["rsync", "--remove-source-files", "-avc", file, to])
              q = subprocess.run(["rmdir", file])               
              print(p)
              print(q)
  os.remove("/tmp/lock_push_tv_show")

main()

parser = argparse.ArgumentParser()
FUNCTION_MAP = {'sync_box' : sync_box,
                'main' : main }
 
parser.add_argument('command', choices=FUNCTION_MAP.keys())
 
args = parser.parse_args()
  
func = FUNCTION_MAP[args.command]
func()

