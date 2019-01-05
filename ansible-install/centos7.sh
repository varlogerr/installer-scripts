#!/usr/bin/env bash

if which ansible >/dev/null; then
    echo "Upgrading ansible"
    yum update -y ansible
    exit 0
fi

echo "Installing ansible"
yum install -y epel-release \
&& yum install -y ansible
