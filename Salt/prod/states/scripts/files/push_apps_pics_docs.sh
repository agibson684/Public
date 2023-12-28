#!/bin/bash 
app_dir=/pool/APPS/
misc_dir=/pool/MISC/
music_dir=/pool/MUSIC/

      function push_apps_pictures_documents {
      downloads=("$complete"/*)
         find  $downloads   -iname  *.zip "$app_dir"
         find  $downloads   -iname  *.jpg "$misc_dir"
         find  $downloads   -iname  *.jpeg "$misc_dir"
         find  $downloads   -iname  *.gif "$misc_dir"
         find  $downloads   -iname  *.tiff "$misc_dir"
         find  $downloads   -iname  *.pdf "$misc_dir"
         find  $downloads   -iname  *.raw "$misc_dir"
         find  $downloads   -iname  *.deb "$app_dir"
         find  $downloads   -iname  *.exe "$app_dir"
         find  $downloads   -iname  *.mp3 "$music_dir"
         find  $downloads   -iname  *.ogg "$music_dir"
         find  $downloads   -iname  *.tar "$app_dir"
         find  $downloads   -iname  *.gz "$app_dir"
      }  
