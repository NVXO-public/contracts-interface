// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title INVXOBridge — Omnichain bridge interface
/// @dev 9-of-15 multisig + zk-SNARK proof · ETH/BSC/Polygon/Solana/TRON
interface INVXOBridge {
    enum BridgeStatus { PENDING, PROCESSING, COMPLETED, FAILED, REFUNDED }
    struct BridgeRequest {
        bytes32 requestId;
        address sender;
        address recipient;
        address token;
        uint256 amount;
        uint16 sourceChain;
        uint16 destChain;
        BridgeStatus status;
        uint256 timestamp;
    }
    function bridge(address token, uint256 amount, uint16 destChain, address recipient) external payable returns (bytes32 requestId);
    function bridgeNFT(address nftContract, uint256 tokenId, uint16 destChain, address recipient) external payable returns (bytes32 requestId);
    function claim(bytes32 requestId, bytes calldata proof) external;
    function getRequest(bytes32 requestId) external view returns (BridgeRequest memory);
    function estimateFee(address token, uint256 amount, uint16 destChain) external view returns (uint256 fee);
    function supportedChains(uint16 chainId) external view returns (bool);
    function isPaused() external view returns (bool);
    event BridgeInitiated(bytes32 indexed requestId, address indexed sender, uint16 destChain, uint256 amount);
    event BridgeCompleted(bytes32 indexed requestId, address indexed recipient, uint256 amount);
    event BridgePaused(address indexed by);
}