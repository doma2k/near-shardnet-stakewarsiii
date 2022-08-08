#!/bin/bash

source $HOME/.cargo/env
git clone https://github.com/near/nearcore
cd nearcore
git fetch
VERSION=$(curl https://raw.githubusercontent.com/near/stakewars-iii/main/commit.md)
git checkout $VERSION
cargo build -p neard --release --features shardnet
cp ./target/release/neard /usr/local/bin/
neard --home /home/near/.near init --chain-id shardnet --download-genesis
rm ~/.near/config.json
wget -O ~/.near/config.json https://s3-us-west-1.amazonaws.com/build.nearprotocol.com/nearcore-deploy/shardnet/config.json
echo 'export NEAR_ENV=shardnet' >> ~/.bashrc
echo 'export NEAR_ENV=shardnet' >> ~/.bash_profile
source $HOME/.bash_profile
    
file_location="/etc/systemd/system/neard.service"
cat > $file_location <<EOF
  [Unit]
  Description=NEARd Daemon Service

  [Service]
  Type=simple
  User=near
  Group=near
  WorkingDirectory=/home/near/.near
  ExecStart=neard run --home /home/near/.near
  Restart=on-failure
  RestartSec=30
  KillSignal=SIGINT
  TimeoutStopSec=45
  KillMode=mixed

  [Install]
  WantedBy=multi-user.target   
EOF
