#!/usr/bin/env bash

# can be used with:
# * ubuntu 16.04
# * linux mint 18.*
# * debian 9.*

if ansible --version >/dev/null 2>&1; then
    echo "Upgrading ansible"
    apt-get --only-upgrade install -y ansible
    exit 0
fi

source_list_path="/etc/apt/sources.list.d/ansible.list"

echo "Installing software-properties-common and dirmngr"
apt-get install -y software-properties-common dirmngr

echo "Installing ansible"
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367 \
&& echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu xenial main" | tee "${source_list_path}" \
&& echo "deb-src http://ppa.launchpad.net/ansible/ansible/ubuntu xenial main" | tee -a "${source_list_path}" \
&& apt-get update \
&& apt-get install -y ansible
