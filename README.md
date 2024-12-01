# DegenToken (DGN)
DegenToken is an ERC20-compliant token with an integrated rewards system. It allows the contract owner to mint tokens and users to redeem predefined rewards by burning tokens.

## Features
- **ERC20 Token Standard**: Fully compliant with the ERC20 standard for interoperability and ease of use.
- **Burnable Tokens**: Users can burn tokens, permanently reducing supply.
- **Rewards System**: Predefined rewards with fixed costs in tokens.
- **Ownership Management**: Only the contract owner can mint new tokens, ensuring control over supply.
- **No Decimals**: Tokens are transacted in whole units only (no fractional tokens).
---
## Smart Contract Details
- **Token Name**: Degen  
- **Token Symbol**: DGN  
- **Decimals**: 0 (only whole tokens are allowed)  

### Predefined Rewards
| Reward Name | Cost (DGN) |
|-------------|------------|
| Meta        | 250        |
| Crafters    | 100        |

---
## Key Functions
### Owner Functions
1. **`mint(address to, uint256 amount)`**  
   - **Description**: Mints new tokens to the specified address.  
   - **Access**: Restricted to the owner.  
   - **Event Emitted**: `TokensMinted`.
### Public Functions
2. **`redeem(uint256 index)`**  
   - **Description**: Redeem a reward by burning tokens. The index must correspond to a valid reward in the `rewards` list.  
   - **Requirements**: 
     - The sender must have a token balance greater than or equal to the reward's cost.
   - **Event Emitted**: `TokensRedeemed`.
3. **`getRewards()`**  
   - **Description**: Returns the complete list of available rewards.  
   - **Access**: Public and read-only.
4. **`decimals()`**  
   - **Description**: Returns the number of decimal places for the token.  
   - **Value Returned**: `0` (tokens are non-fractional).
---
## Events
- **`TokensMinted(address recipient, uint256 amount)`**: Emitted when tokens are minted.  
- **`TokensRedeemed(address player, string itemName, uint256 cost)`**: Emitted when tokens are burned to redeem a reward.  
---
## Usage Flow
1. **Mint Tokens**:  
   The owner mints tokens to user wallets using the `mint` function.  
2. **Redeem Rewards**:  
   Users can check available rewards using `getRewards` and redeem them by providing the reward index to the `redeem` function. Tokens are burned in exchange for the reward.  
3. **Events**:  
   All key actions such as minting and redeeming are logged through events for easy tracking.
---
## Security Features
- **Ownership Control**: Only the owner can mint tokens, ensuring supply regulation.  
- **Bounds Checking**: Redemption is only possible for valid rewards within the `rewards` array.  
- **Balance Verification**: Users cannot redeem rewards without sufficient tokens.  
---
## Development and Testing
- **Frameworks**: OpenZeppelin libraries (ERC20, ERC20Burnable, Ownable).  
- **Solidity Version**: ^0.8.18.  
- **Testing**: Ensure proper minting, redeeming, and reward management during deployment and execution. 
