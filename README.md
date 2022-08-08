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
- Run this script to complete the build process
  ```
  /home/near/near-setup.sh
  ```

### Add your wallet to near-cli
  ```
  su near
  near login
  ```
  - Copy the provided link in your browser
  - Grant Access to Near CLI
  - After Grant, you will see an error page 
  - Go back to the console
  - Enter your wallet and press Enter

### Configure the validator key
  ```
  cat ~/.near/validator_key.json
  ```
  - If a validator_key.json is not present, follow these steps to create one
  ```
  near generate-key <pool_id>
  cp ~/.near-credentials/shardnet/YOUR_WALLET.json ~/.near/validator_key.json
  sed -i 's/private/secret/g' ~/.near/validator_key.json
  nano ~/.near/validator_key.json
  ```
  - Edit “account_id” => xx.factory.shardnet.near, where xx is your PoolName
  
### TO START NEARD
  ```
  systemctl enable neard
  systemctl start neard
  ```

### Check node status
  ```
  journalctl -n 100 -f -u neard | ccze -A
  ```
  
#### !! WAIT FOR THE NODE TO SYNC !! 

- Mounting a staking pool
```
near call factory.shardnet.near create_staking_pool '{"staking_pool_id": "<pool name>", "owner_id": "<accountId>", "stake_public_key": "<public key>", "reward_fee_fraction": {"numerator": 5, "denominator": 100}, "code_hash":"DD428g9eqLL8fWUxv8QSpVFzyHi1Qd16P8ephYCTmMSZ"}' --accountId="<accountId>" --amount=30 --gas=300000000000000
```
- Deposit Funds and Stake
```
near call <pool_id> deposit_and_stake --amount <amount> --accountId <accountId> --gas=300000000000000
```
- Ping pool to start validating
```
near call <pool_id> ping '{}' --accountId <accountId> --gas=300000000000000
```





