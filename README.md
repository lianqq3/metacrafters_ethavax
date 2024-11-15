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

---

## Smart Contract Overview
This contract is written in Solidity 0.8.0. Key functionalities include:
- **Earn Points (`earnPoints`)**: Allows players to add points to their accounts.
- **Redeem Reward (`redeemReward`)**: Deducts points from a player's account to claim rewards.
- **Purchase Skin** (`purchaseSkin`)**: Allows players to purchase skins.
- **Owner Controls**: The owner can adjust reward costs, maximum points, and other settings.

### Contract Functions and How to Use Them

#### Earn Points (`earnPoints`)
- **Description**: Adds a specified number of points to the caller's account.
- **Requirements**:
  - Points must be greater than zero.
  - The total points must not exceed the maximum allowed points.

#### Redeem Rewards (`earnPoints`)
- **Description**: Deducts points from the caller's account to claim a reward.
- **Requirements**:
  - The caller must have enough points to cover the reward cost.

## Purchase Skin (`purchaseSkin`)
- **Description**: Deducts points from the caller's account to purchase a skin.
- **Requirements**:
  - The caller must have enough points to cover the reward cost.
