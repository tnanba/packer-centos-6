#!/bin/sh

yum -y clean all
rm -rf VBoxGuestAdditions_*.iso

rm -f /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -f /lib/udev/rules.d/75-persistent-net-generator.rules

cat > /etc/sysconfig/network-scripts/ifcfg-eth0 << __END__
DEVICE=eth0
BOOTPROTO=dhcp
ONBOOT=yes
TYPE=Ethernet
__END__

yum -y remove gcc cpp libmpc mpfr kernel-devel kernel-headers perl
yum -y clean all

rm -f /core*
rm -rf /tmp/*
rpmdb --rebuilddb
rm -f /var/lib/rpm/__db*
