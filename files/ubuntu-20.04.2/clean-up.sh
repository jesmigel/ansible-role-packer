#!/bin/bash
echo '> Cleaning all audit logs ...'
if [ -f /var/log/audit/audit.log ]; then
cat /dev/null > /var/log/audit/audit.log
fi
if [ -f /var/log/wtmp ]; then
cat /dev/null > /var/log/wtmp
fi
if [ -f /var/log/lastlog ]; then
cat /dev/null > /var/log/lastlog
fi

# Cleans SSH keys.
echo '> Cleaning SSH keys ...'
rm -f /etc/ssh/ssh_host_*

# Sets hostname to localhost.
echo '> Setting hostname to localhost ...'
cat /dev/null > /etc/hostname
hostnamectl set-hostname localhost
# Cleans apt-get.
echo '> Cleaning apt-get ...'
apt-get clean

# Reset Machine-ID
# http://manpages.ubuntu.com/manpages/bionic/man5/machine-id.5.html
# This is the equivalent of the SID in Windows
# Netplan also uses this as DHCP Identifier, causing multiple VMs from the same Image
# to get the same IP Address
rm -f /etc/machine-id

# Reset Cloud-init state (https://stackoverflow.com/questions/57564641/openstack-Packer-cloud-init)
# systemctl stop cloud-init
# rm -rf /var/lib/cloud/
cloud-init clean -s -l