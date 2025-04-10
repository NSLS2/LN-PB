EPICS & subdirectoris readable+exexutable!
cd /epics/iocs/CG-BR/iocBoot/ioccg-br
sudo runuser -l softioc -c /epics/iocs/CG-BR/iocBoot/ioccg-br/Run.sh


#!/bin/sh
cd /epics/iocs/CG-BR/iocBoot/ioccg-br;procServ -n "CG-BR" -L/var/log/softioc/CG-BR/CG-BR.log -i ^D^C 4050 ./st.cmd;
date;


jtagger@rfctl64-1:/etc/udev/rules.d$ more 99-opal-kelly.rules
# Linux 2.6
#SUBSYSTEMS=="usb", ATTRS{idVendor}=="151f", OWNER="softioc", GROUP="controls"
# Linux 3.2
#SUBSYSTEM=="usb", ATTR{idVendor}=="151f", OWNER="softioc", GROUP="controls"

# Linux 2.6
SUBSYSTEMS=="usb", ATTRS{idVendor}=="151f", MODE="0666"
# Linux 3.2
SUBSYSTEM=="usb", ATTR{idVendor}=="151f", MODE="0666"


# Reminder
# udevadm info -a -p $(udevadm info -q path -n /dev/bus/usb/002/009)

jtagger@rfctl64-1:/etc/udev/rules.d$

sudo udevadm control --reload-rules
sudo udevadm trigger

cp scripts/CG-BR.service/etc/systemd/system/ioc.cgbr.service /etc/systemd/system
chown root:root /etc/systemd/system/ioc.cgbr.service
systemctl enable ioc.cgbr
systemctl start ioc.cgbr
systemctl status ioc.cgbr -l
systemctl stop ioc.cgbr
systemctl reload ioc.cgbr

ls -la /etc/systemd/system/multi-user.target.wants
