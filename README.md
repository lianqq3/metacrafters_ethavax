# Valorant Points Manager (VPM)
The **Valorant Points Manager** is a Solidity-based smart contract that manages a player’s point system for a reward-based application. This contract allows users to earn points, redeem rewards, and ensures administrative controls for managing point-related configurations.

---
### Getting Started
Executing program
To run this code, utilize Remix, an online Solidity Integrated Development Environment (IDE). Begin by visiting the Remix website at https://remix.ethereum.org.

Upon accessing the Remix platform, click the "+" icon in the left sidebar to create a new file. You may name the file as you prefer, provided it retains the .sol extension. Once the file is created, copy and paste the code provided below into your newly created file.
```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ValorantPointsManager {
    uint256 public playerPoints;
    uint256 public rewardCost = 100; 
    uint256 public skinCost = 150; 
    address public owner;
    bool public isSkinAvailable = true; 
    uint256 public maxPoints = 1000; 
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    function earnPoints(uint256 points) public {
        require(points > 0, "Points must be greater than zero");
        playerPoints += points;
        validatePoints();
    }

    function redeemReward() public {
        require(playerPoints >= rewardCost, "Not enough points to redeem a reward");
        playerPoints -= rewardCost;
        validatePoints();
    }

    function purchaseSkin() public {
        if (!isSkinAvailable) {
            revert("The skin is currently unavailable.");
        }
        if (playerPoints < skinCost) {
            revert("Not enough points to purchase the skin.");
        }
        playerPoints -= skinCost; 
        validatePoints(); 
    }

    function validatePoints() internal view {
        assert(playerPoints <= maxPoints);
    }

    function setRewardCost(uint256 newCost) public onlyOwner {
        require(newCost > 0, "Reward cost must be greater than zero");
        rewardCost = newCost;
    }

    function toggleSkinAvailability(bool availability) public onlyOwner {
        isSkinAvailable = availability;
    }

    function setSkinCost(uint256 newCost) public onlyOwner {
        require(newCost > 0, "Skin cost must be greater than zero");
        skinCost = newCost;
    }

    function setMaxPoints(uint256 newMax) public onlyOwner {
        require(newMax > 0, "Maximum points must be greater than zero");
        maxPoints = newMax;
    }
}
```


