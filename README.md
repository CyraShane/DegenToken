# DegenToken (DGN)
DegenToken is an ERC20-compliant token with a built-in rewards system. It allows the owner to mint tokens and users to redeem predefined rewards by burning tokens.

## Features
- **ERC20 Token**: Standard token functionality (transfers, balances, etc.).
- **Burnable**: Users can burn tokens to redeem rewards.
- **Rewards System**: Predefined rewards with associated costs in tokens.
- **Ownership Control**: Only the owner can mint new tokens.

## Functions
1. **`mint(address to, uint256 amount)`**  
   - Mint new tokens to the specified address.  
   - **Access**: Owner only.
2. **`redeem(uint256 index)`**  
   - Redeem a reward by burning tokens.  
   - **Requirement**: Sufficient token balance.
3. **`getRewards()`**  
   - View the list of available rewards.  
4. **`decimals()`**  
   - Returns `0` (token operates in whole units only).

## Deployment
- **Token Name**: Degen  
- **Token Symbol**: DGN  
- **Decimals**: 0  

## Events
- **`TokensMinted(address recipient, uint256 amount)`**: Emitted when tokens are minted.  
- **`TokensRedeemed(address player, string itemName, uint256 cost)`**: Emitted when rewards are redeemed.  
