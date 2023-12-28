#!/bin/bash 
echo "Use command show or movie. Then a directory"
case "$1" in
"show" )	
  ln -s "/pool/TV_SHOWS/$2"  /pool/TV_SHOWS/Jess/
  ;;
"movie" )
  ln -s "/pool/MOVIES/$2"    /pool/MOVIES/Jess/
  ;;
"--help" )
  echo "for movies:"
  echo "movie_name movie_directory"
  echo "for tvshows:"
  echo "show show_directory"
  ;;
*)
  echo "for movies:"
  echo "movie_name movie_directory"
  echo "for tvshows:"
  echo "show show_directory"
  ;;
esac

