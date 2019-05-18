#!/usr/bin/env bash

if ansible --version >/dev/null 2>&1; then
    echo "Upgrading ansible"
    yum update -y ansible
    exit 0
fi

echo "Installing ansible"
yum install -y epel-release \
&& yum install -y ansible
