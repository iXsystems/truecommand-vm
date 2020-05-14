# truecommand-vm
VM Image setup routine for TrueCommand

## Steps to use:
1. Install Debian into a VM (VirtualBox, VMWare, etc..)
   * Set the username/password both to "truecomand"
   * Install the minimal system + SSH
2. Boot the VM
3. Run: `wget https://raw.githubusercontent.com/iXsystems/truecommand-vm/master/setup.sh` to fetch the install script
4. Run: `chmod 755 setup.sh`
5. Run: `sudo ./setup.sh` and follow the prompts (Yes to everything if asked)
6. Run: `rm setup.sh`
7. Run: `sudo /usr/sbin/poweroff` to turn off the VM
8. Export the VM image in whatever formats are needed.
