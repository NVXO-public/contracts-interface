// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title INVXOStaking — Tiered staking with liquid sNVXO token
/// @dev Tiers: Bronze(1K) / Silver(10K) / Gold(50K) / Platinum(200K+ NVXO)
interface INVXOStaking {
    enum Tier { NONE, BRONZE, SILVER, GOLD, PLATINUM }
    struct StakePosition {
        uint256 amount;
        uint256 lockEnd;
        uint256 rewardDebt;
        Tier tier;
    }
    function stake(uint256 amount, uint256 lockDays) external;
    function unstake(uint256 amount) external;
    function claimRewards() external returns (uint256 rewardAmount);
    function compound() external;
    function getPosition(address staker) external view returns (StakePosition memory);
    function pendingRewards(address staker) external view returns (uint256);
    function getTier(address staker) external view returns (Tier);
    function totalStaked() external view returns (uint256);
    function rewardRate() external view returns (uint256);
    event Staked(address indexed user, uint256 amount, uint256 lockEnd, Tier tier);
    event Unstaked(address indexed user, uint256 amount);
    event RewardsClaimed(address indexed user, uint256 amount);
    event TierUpgraded(address indexed user, Tier oldTier, Tier newTier);
}