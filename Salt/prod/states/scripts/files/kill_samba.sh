#!/bin/bash 
sudo kill -9 $(pidof smbd)
sudo kill -9 $(pidof nmbd)

