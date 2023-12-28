#!/bin/bash
uname -a > /tmp/systeminfo.txt
echo "##############################################################################################################################" >> /tmp/systeminfo.txt
lsmod  >> /tmp/systeminfo.txt  2>&1
echo "##############################################################################################################################" >> /tmp/systeminfo.txt
apt list --installed >> /tmp/systeminfo.txt  2>&1

echo "##############################################################################################################################" >> /tmp/systeminfo.txt
dmesg >> /tmp/systeminfo.txt  2>&1 
echo "##############################################################################################################################" >> /tmp/systeminfo.txt
xrandr >> /tmp/systeminfo.txt 2>&1 
echo "##############################################################################################################################" >> /tmp/systeminfo.txt
lspci >> /tmp/systeminfo.txt 2>&1 
echo "##############################################################################################################################" >> /tmp/systeminfo.txt
cat /etc/apt/sources.list /etc/apt/sources.list.d/* >> /tmp/systeminfo.txt
echo "##############################################################################################################################" >> /tmp/systeminfo.txt
sudo insmod /lib/modules/5.10.0-18-amd64/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko >> /tmp/systeminfo.txt  2>&1 
































