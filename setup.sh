#!/bin/bash
#Post-install script to run after debian installation to set it up for TrueCommand

if [ $(id -u) -ne 0 ] ; then
  echo "This script needs to run with root permissions on the Debian VM"
  exit 1
fi

#Grab the current directory where this script is living
curdir=$(dirname $0)

# Step 1: Install files from this repo
filelist="files/start-truecommand:/usr/local/bin/start-truecommand files/truecommand.service:/etc/systemd/system/truecommand.service"
for _file in ${filelist}
do
  relpath=$(echo ${_file} | cut -d : -f 1)
  instpath=$(echo ${_file} | cut -d : -f 2)
  if [ -e "${curdir}/${relpath}" ] ; then
    #Have the whole repo checked out - just copy the files
    cp "${curdir}/${relpath}" "${instpath}"
  else
    #Fetch the latest version of the file directly from Github
    wget https://raw.githubusercontent.com/iXsystems/truecommand-vm/master/${relpath} -O "${instpath}"
    chmod 770 "${instpath}" #ensure it is executable by root/group
  fi
done

# Step 2 : Install docker
apt-get install docker.io
if [ $? -ne 0 ] ; then
  echo "Error Installing docker package!!"
  exit 1
fi

# Step 3 : Adjust services
systemctl daemon-reload
systemctl enable docker
systemctl enable truecommand.service
systemctl start docker
# Note - do not start the truecommand service itself. That needs to run for the first time on the deployed system
# If this does need to happen, make sure to delete the /data directory before exiting - so it starts fresh next time

# Step 4 : Adjust firewall

# Step 5 : Pull the current latest version of the TrueCommand container (for offline VM deployments)
docker pull ixsystems/truecommand:latest
