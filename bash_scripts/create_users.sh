#!/bin/bash

# Create ansible user on Instance A
if [ "$1" == "ansible" ]; then
  useradd ansible
  echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
  echo "User 'ansible' created with sudo privileges."
fi

# Create jenkins user on Instance B
if [ "$1" == "jenkins" ]; then
  useradd jenkins
  echo 'jenkins ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
  echo "User 'jenkins' created with sudo privileges."
fi
