# Near Shardnet - Hetzner Setup

1. Create a new cloud server instance. Select user data and paste the cloud-init file there. Otherwise create the server as normal.
2. When the server is finished booting check /var/log/cloud-init-output for the message "The system is finally up after"

TO START NEARD
- systemctl enable neard
- systemctl start neard




