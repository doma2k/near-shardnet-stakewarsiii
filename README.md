# Near Shardnet - Hetzner Setup

1. Create a new cloud server instance. 
2. Select user data and paste this file https://raw.githubusercontent.com/ImStaked/near-shardnet-stakewarsiii/main/cloud-init
3. Otherwise create the server as normal.
4. When the server is finished booting check for cloud-init completion with this command
  ```
  cat /var/log/cloud-init-output.log | grep "The system is finally up"
  ```

### TO START NEARD
- systemctl enable neard
- systemctl start neard






