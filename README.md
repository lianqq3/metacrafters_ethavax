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

## Compilation
To compile the code, head to the Solidity Compiler after that go to the Deploy and run transactions wherein you can deploy.

After the contract is deployed, you will see a list of available functions in the "Deployed Contracts" section. Here's how to interact with each function:

## Contract Interacting 
Earn Points (earnPoints)
Purpose: Adds points to the player's account.
How to Use:
- Locate earnPoints in the deployed contract's interface.
- Enter the number of points you want to add (e.g., 200).
Click on the earnPoints button.
Result: The playerPoints variable will be updated, and the total points will be increased.
Redeem Reward (redeemReward)
Purpose: Redeems a reward by deducting points from the player's account.
How to Use:
Locate redeemReward in the deployed contract's interface.
Click on the redeemReward button.
Result: If the player has enough points (e.g., more than or equal to 100), the points will be deducted by the reward cost.
Purchase Skin (purchaseSkin)
Purpose: Purchases a skin if it's available and the player has enough points.
How to Use:
Locate purchaseSkin in the deployed contract's interface.
Click on the purchaseSkin button.
Result: If the skin is available and the player has enough points (e.g., 150), the points will be deducted by the skin cost.
Set Reward Cost (setRewardCost)
Purpose: Allows the owner to change the cost required to redeem a reward.
How to Use:
Under "Deployed Contracts," click on the contract to expand it.
Locate setRewardCost in the list of available functions.
Enter a new reward cost (e.g., 150) in the input box.
Click on the setRewardCost button.
Result: The rewardCost variable will be updated to the new value.
Toggle Skin Availability (toggleSkinAvailability)
Purpose: Allows the owner to toggle the availability of skins for purchase.
How to Use:
Locate toggleSkinAvailability in the deployed contract's interface.
Enter a value of true (if you want the skin to be available) or false (if you want to make it unavailable).
Click on the toggleSkinAvailability button.
Result: The isSkinAvailable variable will be updated accordingly.
Set Skin Cost (setSkinCost)
Purpose: Allows the owner to change the cost of purchasing a skin.
How to Use:
Locate setSkinCost in the deployed contract's interface.
Enter a new skin cost (e.g., 200) in the input box.
Click on the setSkinCost button.
Result: The skinCost variable will be updated to the new value.
Set Maximum Points (setMaxPoints)
Purpose: Allows the owner to change the maximum points a player can have.
How to Use:
Locate setMaxPoints in the deployed contract's interface.
Enter a new maximum points value (e.g., 2000).
Click on the setMaxPoints button.
Result: The maxPoints variable will be updated to the new value.


