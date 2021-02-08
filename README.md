# truecommand-vm
VM Image setup routine for TrueCommand

## Steps to use:
1. Install Debian into a VM (VirtualBox, VMWare, etc..)
   * Set the username/password both to "truecommand"
   * Install the minimal system + SSH
2. Boot the VM
3. Run: `wget https://raw.githubusercontent.com/iXsystems/truecommand-vm/master/setup.sh` to fetch the install script
4. Run: `chmod 755 setup.sh`
5. Run: `sudo ./setup.sh` and follow the prompts (Yes to everything if asked)
6. Run: `rm setup.sh`
7. Run: `sudo /usr/sbin/poweroff` to turn off the VM
8. Export the VM image in whatever formats are needed.

**WARNING**
Do NOT bootup the VM before exporting the VM images! This will startup the TrueCommand docker instance and provision the system ID's and such within the VM and result in everybody using the VM to get the same ID's!

If you do boot the instance, make sure to stop the service and delete the data directory (/data) before powering off the VM so everything is wiped before export.
