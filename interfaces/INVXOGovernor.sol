// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title INVXOGovernor — DAO governance interface
/// @dev OpenZeppelin Governor fork · 15% quorum · 48h timelock
interface INVXOGovernor {
    enum ProposalState { Pending, Active, Canceled, Defeated, Succeeded, Queued, Expired, Executed }
    struct ProposalVote { uint256 againstVotes; uint256 forVotes; uint256 abstainVotes; }

    function propose(address[] memory targets, uint256[] memory values, bytes[] memory calldatas, string memory description) external returns (uint256 proposalId);
    function castVote(uint256 proposalId, uint8 support) external returns (uint256 weight);
    function castVoteWithReason(uint256 proposalId, uint8 support, string calldata reason) external returns (uint256 weight);
    function queue(uint256 proposalId) external;
    function execute(uint256 proposalId) external payable;
    function cancel(uint256 proposalId) external;
    function state(uint256 proposalId) external view returns (ProposalState);
    function proposalVotes(uint256 proposalId) external view returns (ProposalVote memory);
    function getVotes(address account, uint256 blockNumber) external view returns (uint256);
    function quorumNumerator() external view returns (uint256);
    function votingDelay() external view returns (uint256);
    function votingPeriod() external view returns (uint256);
    function proposalThreshold() external view returns (uint256);
    event ProposalCreated(uint256 proposalId, address proposer, string description);
    event VoteCast(address indexed voter, uint256 proposalId, uint8 support, uint256 weight, string reason);
    event ProposalExecuted(uint256 proposalId);
}