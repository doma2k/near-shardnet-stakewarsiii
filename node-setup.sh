#!/bin/bash

cpucheck=$(lscpu | grep -P '(?=.*avx )(?=.*sse4.2 )(?=.*cx16 )(?=.*popcnt )' > /dev/null && echo "0" || echo "1")
if [ "$cpucheck" = 1 ]
then
echo " Your CPU is not supported exiting"
exit
fi


# NEAR CLI 
function near_cli_setup
{
    sudo apt update && sudo apt upgrade -yq
    curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -  
    apt install build-essential nodejs -yq
    PATH="$PATH"
    npm install -g near-cli
    echo 'export NEAR_ENV=shardnet' >> ~/.bashrc
    echo 'export NEAR_ENV=shardnet' >> ~/.bash_profile
    source $HOME/.bash_profile
}

# Near User Account

function add_near_user
{
    useradd -U -m -d /home/near -r -s /bin/bash near
}

# Setup Node
function node_setup
{
    apt install -yq python3-pip htop iotop nmon net-tools nload ca-certificates software-properties-common unattended-upgrades wget curl zip unzip gzip jq git binutils-dev libcurl4-openssl-dev zlib1g-dev libdw-dev libiberty-dev cmake gcc g++ python protobuf-compiler libssl-dev pkg-config clang llvm
    USER_BASE_BIN=$(python3 -m site --user-base)/bin
    export PATH="$USER_BASE_BIN:$PATH"
    apt install clang build-essential make -yq
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
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

}


near_cli_setup

add_near_user

node_setup
