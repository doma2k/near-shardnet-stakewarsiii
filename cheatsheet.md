# Near Shardnet Cheatsheat

### Send tokens
  ```
  near send <from> <to> <amount>
  ```

### Get all accounts staked in your pool
  ```
  near view <YOUR_POOL>.factory.shardnet.near get_accounts '{"from_index": 0, "limit": 10}'
  ```

### Stake ALL tokens with the account <YOUR_ACCOUNT>.shardnet.near
  ```
  near call <YOUR_POOL>.factory.shardnet.near stake_all --accountId <YOUR_ACCOUNT>.shardnet.near
  ```
### Get the total staked balance of the pool
  ```
  near call <YOUR_POOL>.factory.shardnet.near get_total_staked_balance '{}' --accountId <YOUR_ACCOUNT>.shardnet.near
  ```
### Deposit 10k tokens for the account <YOUR_ACCOUNT>.shardnet.near
  ```
  near call <YOUR_POOL>.factory.shardnet.near deposit '' --accountId <YOUR_ACCOUNT>.shardnet.near --amount 10000
  ```
### Stake 10k tokens (value in YoctoNEAR) with the account <YOUR_ACCOUNT>.shardnet.near
near call <YOUR_POOL>.factory.shardnet.near stake {} --accountId <YOUR_ACCOUNT>.shardnet.near --amount 10000

### Stake ALL tokens with the account <YOUR_ACCOUNT>.shardnet.near
near call <YOUR_POOL>.factory.shardnet.near stake_all --accountId <YOUR_ACCOUNT>.shardnet.near

### Unstake ALL tokens with the account <YOUR_ACCOUNT>.shardnet.near
near call <YOUR_POOL>.factory.shardnet.near unstake_all --accountId <YOUR_ACCOUNT>.shardnet.near

### Ping the pool, paying gas from account <YOUR_ACCOUNT>.shardnet.near
near call <YOUR_POOL>.factory.shardnet.near ping '{}' --accountId <YOUR_ACCOUNT>.shardnet.near

### Retrieve the total balance in YoctoNEAR for the account <YOUR_ACCOUNT>.shardnet.near
near view <YOUR_POOL>.factory.shardnet.near get_account_total_balance '{"account_id": "<YOUR_ACCOUNT>.shardnet.near"}'

### Retrieve the staked balance in YoctoNEAR for the account <YOUR_ACCOUNT>.shardnet.near
near view <YOUR_POOL>.factory.shardnet.near get_account_staked_balance '{"account_id": "<YOUR_ACCOUNT>.shardnet.near"}'

### Unstake 10k tokens (value in YoctoNEAR) from the account <YOUR_ACCOUNT>.shardnet.near
near call <YOUR_POOL>.factory.shardnet.near stake '{"amount": "1200"}' --accountId <YOUR_ACCOUNT>.shardnet.near

# Retrieve the unstaked balance in YoctoNEAR for the account <YOUR_ACCOUNT>.shardnet.near
near view <YOUR_POOL>.factory.shardnet.near get_account_unstaked_balance '{"account_id": "<YOUR_ACCOUNT>.shardnet.near"}'

# Check if the unstaked balance for the account <YOUR_ACCOUNT>.shardnet.near is unlocked
near view <YOUR_POOL>.factory.shardnet.near is_account_unstaked_balance_available '{"account_id": "<YOUR_ACCOUNT>.shardnet.near"}'

# Withdraw 5k tokens in YoctoNEAR from the account <YOUR_ACCOUNT>.shardnet.near
near call <YOUR_POOL>.factory.shardnet.near withdraw '{"amount": "5100000000000000000000000000"}' --accountId <YOUR_ACCOUNT>.shardnet.near

# Withdraw All tokens in YoctoNEAR from the account <YOUR_ACCOUNT>.shardnet.near
near call <YOUR_POOL>.factory.shardnet.near withdraw_all '{"amount": "10000000000000000000000000000"}' --accountId <YOUR_ACCOUNT>.shardnet.near

# Retrieve the owner ID of the staking pool
near view <YOUR_POOL>.factory.shardnet.near get_owner_id '{}'

# Current reward fee
near view my_validator get_reward_fee_fraction '{}'

# Owners balance
near view my_validator get_account_total_balance '{"account_id": "owner"}'

# Retrieve the staking key of the staking pool
near view <YOUR_POOL>.factory.shardnet.near get_staking_key '{}'
returns: 'ed25519:FwW88Jk71HavGw2AJe6HaV2VT835idJfErrhUoK8MCyi'

# Update the staking key of the staking pool
(replace the pubkey below with the key in your validator.json file)
near call <YOUR_POOL>.factory.shardnet.near update_staking_key '{"stake_public_key": "ed25519:00000000000000000000000000000000000000000042"}' --accountId <YOUR_ACCOUNT>.shardnet.near

# Put the staking pool on hold
near call <YOUR_POOL>.factory.shardnet.near pause_staking '{}' --accountId <YOUR_ACCOUNT>.shardnet.near

# Resume the staking
near call <YOUR_POOL>.factory.shardnet.near resume_staking '{}' --accountId <YOUR_ACCOUNT>.shardnet.near
