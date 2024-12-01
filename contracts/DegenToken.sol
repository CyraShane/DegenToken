pragma solidity ^0.8.18;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.0/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.0/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable {
    struct Reward {
        string name;
        uint256 cost;
    }

    Reward[] private rewards;

    event TokensMinted(address indexed recipient, uint256 amount);
    event TokensRedeemed(address indexed player, string itemName, uint256 cost);

    constructor() ERC20("Degen", "DGN") {
        rewards.push(Reward("Meta", 250));
        rewards.push(Reward("Crafters", 100));
        transferOwnership(msg.sender);
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
        emit TokensMinted(to, amount);
    }

    function redeem(uint256 index) external {
        require(index < rewards.length, "Invalid index");
        Reward memory reward = rewards[index];
        require(balanceOf(msg.sender) >= reward.cost, "Insufficient balance");

        _burn(msg.sender, reward.cost);
        emit TokensRedeemed(msg.sender, reward.name, reward.cost);
    }

    function getRewards() external view returns (Reward[] memory) {
        return rewards;
    }

    function decimals() public view virtual override returns (uint8) {
        return 0;
    }
}
