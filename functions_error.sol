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
