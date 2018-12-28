#!/usr/bin/env bash

# can be used for:
# * ubuntu 16.04
# * linux mint 18.*
# * debian 9.*

if which git >/dev/null; then
    echo "Upgrading git"
    apt-get --only-upgrade install -y git
    exit 0
fi

echo "Installing git"
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E1DD270288B4E6030699E45FA1715D88E1DF1F24 \
&& echo "deb http://ppa.launchpad.net/git-core/ppa/ubuntu xenial main" > /etc/apt/sources.list.d/git.list \
&& echo "deb-src http://ppa.launchpad.net/git-core/ppa/ubuntu xenial main" >> /etc/apt/sources.list.d/git.list \
&& apt-get update \
&& apt-get install -y -f git
