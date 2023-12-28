#!/bin/bash
cd ~/vagrant_guests/centos1_apache/
vagrant up
cd ~/vagrant_guests/centos2_apache/
vagrant up
cd ~/vagrant_guests/centos1_mysql/
vagrant up
cd ~/vagrant_guests/centos2_mysql/
vagrant up
cd ~/vagrant_guests/centos1_zabbix/
vagrant up
cd ~/vagrant_guests/centos2_zabbix/
vagrant up


