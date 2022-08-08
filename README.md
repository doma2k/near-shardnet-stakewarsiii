# Near Shardnet - Hetzner Setup

1. Create a new cloud server instance. Select user data and paste this file https://raw.githubusercontent.com/ImStaked/near-shardnet-stakewarsiii/main/cloud-init
2. Otherwise create the server as normal.
3. When the server is finished booting check /var/log/cloud-init-output for the message "The system is finally up after"

TO START NEARD
- systemctl enable neard
- systemctl start neard






