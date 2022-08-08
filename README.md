# Near Shardnet - Hetzner Setup

### Create a wallet
- Create a new wallet here ---> https://wallet.shardnet.near.org/

### Create a new cloud server instance 
- Select user data and paste this file https://raw.githubusercontent.com/ImStaked/near-shardnet-stakewarsiii/main/cloud-init
- Otherwise create the server as normal.
- When the server is finished booting check for cloud-init completion with this command
  ```
  cat /var/log/cloud-init-output.log | grep "The system is finally up"
  ```

### Add your wallet to near-cli

### TO START NEARD
- systemctl enable neard
- systemctl start neard






