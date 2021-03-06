#!/usr/bin/env bash
export HOSTNAME=razor

hostname $HOSTNAME

rpm -q git; if [ $? -ne 0 ]; then yum install git -y; fi
rpm -q mlocate; if [ $? -ne 0 ]; then yum install mlocate -y; fi
rpm -q make; if [ $? -ne 0 ]; then yum install make -y; fi
rpm -q gcc; if [ $? -ne 0 ]; then yum install gcc -y; fi
rpm -q ruby-devel; if [ $? -ne 0 ]; then yum install ruby-devel -y; fi
rpm -q rubygems; if [ $? -ne 0 ]; then yum install rubygems -y; fi


grep $HOSTNAME /etc/hosts; if [ $? -ne 0 ]; then echo "$(ifconfig eth0 | grep -Eo 'addr:[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2)    $HOSTNAME" >> /etc/hosts ; fi




