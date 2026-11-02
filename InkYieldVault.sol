// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract InkYieldVault {
    uint256 public accumulatedYieldBps;
    uint256 public lastHarvestTimestamp;

    event YieldHarvested(address indexed keeper, uint256 totalBps, uint256 timestamp);

    function harvestVaultYield(uint256 _earnedBps) external {
        accumulatedYieldBps += _earnedBps;
        lastHarvestTimestamp = block.timestamp;
        emit YieldHarvested(msg.sender, accumulatedYieldBps, block.timestamp);
    }
}
