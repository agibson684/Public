ums:
   type: simple 
   descp: "UMS Media Server"
   docu: "https://www.thrace-lan.info"
   wantedby: "multi-user.target"
   after:  "network.target"
   execstart: "/bin/sh -c '/usr/local/sbin/ums/UMS.sh'"
   restart: on-failure
   restartsec: 5
   timeout: 30
   folders: ['/media/files_moves/', '/media/tv', '/media/files_music/', '/media/sync_movies/', '/media/sync_music/', '/media/sync_tv/' ] 
