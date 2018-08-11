#!/bin/bash
# Author   :    AlicFeng
# Email    :    a@samego.com
# Github   :    https://github.com/alicfeng/sshAutoLogin


if [ ${UID} != 0 ]; then
    echo -e "Hei ${USER} Please run install with administrator"
    exit 0
fi

echo -e "The script is installing the program,Please wating ..."

# create configure dir | default in current user .ssha
configureDir=~/.ssha
if [ ! -d $configureDir ];then
    mkdir ~/.ssha
    echo -e "Index=0\nName=localhost\tHost=127.0.0.1\tport=22\tUser=root\tPasswordOrKey=password" >> ~/.ssha/0_localhost.ini
fi

# install dependence
type expect >/dev/null 2>&1 || apt-get install expect -y >/dev/null 2>&1
type toilet >/dev/null 2>&1 || apt-get install toilet -y >/dev/null 2>&1
type toilet >/dev/null 2>&1 || apt-get install wget -y >/dev/null 2>&1

wget -O /usr/local/bin/ssha https://raw.githubusercontent.com/alicfeng/sshAutoLogin/master/ssha && {
    chmod a+x /usr/local/bin/ssha
    ssha -h
    toilet -f mono12 -F gay "enjoy ssha"  -t
    rm $0   
}
