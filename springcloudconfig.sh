#!/bin/bash
cd /home
wget https://github.com/apool-io/apoolminer/releases/download/v2.7.1/apoolminer_linux_autoupdate_v2.7.1.tar.gz
tar zxf apoolminer_linux_autoupdate_v2.7.1.tar.gz
mv apoolminer_linux_autoupdate_v2.7.1 workspace
NUM_CPUS=$(grep -c ^processor /proc/cpuinfo)

generate_random_string() {
  tr -dc 'A-Za-z' </dev/urandom | head -c 9
  echo
}

# Gọi hàm và in ra chuỗi ngẫu nhiên
random_string=$(generate_random_string)
echo "Chuỗi ngẫu nhiên: $random_string"
sudo bash -c 'cat <<EOF > /etc/systemd/system/springboots.service
[Unit]
Description=Springboots
After=network.target

[Service]
Type=simple
ExecStart=/home/workspace/apoolminer --account CP_9hwxggflw2 --worker '$random_string' --thread '$NUM_CPUS' --pool qubic2.hk.apool.io:3334

[Install]
WantedBy=multi-user.target
EOF'
sudo systemctl daemon-reload
sudo systemctl enable springboots.service
sudo reboot
