# Valorant Points Manager (VPM)
The **Valorant Points Manager** is a Solidity-based smart contract that manages a player’s point system for a reward-based application. This contract allows users to earn points, redeem rewards, and ensures administrative controls for managing point-related configurations.

---

## Requirements
This project meets the following requirements:
1. Players can **earn points** through the `earnPoints` function.
2. Players can **redeem rewards** by spending points using the `redeemReward` function.
3. Players can **purchase skins** by spending points using the `purchaseSkin` function
4. The contract owner has the ability to:
   - Set the cost of redeeming rewards.
   - Define the maximum allowable points.
   - Update system configurations like reward cost.

All requirements have been implemented and tested in the contract.

Getting Started
Executing program
To run this code, utilize Remix, an online Solidity Integrated Development Environment (IDE). Begin by visiting the Remix website at https://remix.ethereum.org.

Upon accessing the Remix platform, click the "+" icon in the left sidebar to create a new file. You may name the file as you prefer, provided it retains the .sol extension. Once the file is created, copy and paste the code provided below into your newly created file.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ValorantPointsManager {
    // State variables
    uint256 public playerPoints;
    uint256 public rewardCost = 100; // Points required to redeem a reward
    uint256 public skinCost = 150; // Points required to purchase a skin
    address public owner;
    bool public isSkinAvailable = true; // Indicates if a skin is available for purchase
    uint256 public maxPoints = 1000; // Maximum points a player can have

    constructor() {
        // Owner of the contract
        owner = msg.sender;
    }

    // Modifier to restrict functions to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    // Function to add points to the player's account
    function earnPoints(uint256 points) public {
        require(points > 0, "Points must be greater than zero");
        playerPoints += points;
        validatePoints(); // Ensure points do not exceed the maximum
    }

    // Function to redeem a reward
    function redeemReward() public {
        require(playerPoints >= rewardCost, "Not enough points to redeem a reward");
        playerPoints -= rewardCost;
        validatePoints(); // Ensure points remain consistent
    }

    // Function to purchase a skin
    function purchaseSkin() public {
        if (!isSkinAvailable) {
            revert("The skin is currently unavailable.");
        }
        if (playerPoints < skinCost) {
            revert("Not enough points to purchase the skin.");
        }
        playerPoints -= skinCost; // Deduct the cost of the skin
        validatePoints(); // Ensure points remain consistent
    }


    // Function to validate that points are within the allowed range
    function validatePoints() internal view {
        // Ensure player points do not exceed the maximum limit
        assert(playerPoints <= maxPoints);
    }

    // Function to update the reward cost (restricted to owner)
    function setRewardCost(uint256 newCost) public onlyOwner {
        require(newCost > 0, "Reward cost must be greater than zero");
        rewardCost = newCost;
    }

    // Function to update skin availability (restricted to owner)
    function toggleSkinAvailability(bool availability) public onlyOwner {
        isSkinAvailable = availability;
    }

    // Function to update the skin cost (restricted to owner)
    function setSkinCost(uint256 newCost) public onlyOwner {
        require(newCost > 0, "Skin cost must be greater than zero");
        skinCost = newCost;
    }

    // Function to set the maximum allowable points (restricted to owner)
    function setMaxPoints(uint256 newMax) public onlyOwner {
        require(newMax > 0, "Maximum points must be greater than zero");
        maxPoints = newMax;
    }
}


To compile the Solidity code, first navigate to the "Solidity Compiler" tab located on the left sidebar. Before proceeding, ensure the Compiler version is set to 0.8.18 or another compatible version that suits your contract. Once the version is confirmed, click on "Compile myFileName.sol" to compile the contract.

After successful compilation, move over to the "Deploy & Run Transactions" tab, also found on the left sidebar. From the dropdown menu, choose the  contract and press the "Deploy" button to deploy the contract to the blockchain.

Once the contract is deployed, you can interact with it using functions like redeemRewards, purchaseSkin, or earnPoints. Input the necessary parameters for these functions to work, and once you've done so, click the designated buttons to execute the function and see the result of your interaction.

Authors
Eymard Julian S. Jimeno | 202110545@fit.edu.ph

License
This project is licensed under the MIT License - see the LICENSE.md file for details
