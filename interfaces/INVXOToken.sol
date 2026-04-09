// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title INVXOToken — NVXO ERC-20 utility and governance token interface
/// @dev Fixed supply 1,000,000,000 NVXO · quarterly burn · EIP-2612 permit
interface INVXOToken {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
    function burn(uint256 amount) external;
    function burnFrom(address account, uint256 amount) external;
    function totalBurned() external view returns (uint256);
    function permit(address owner, address spender, uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s) external;
    function nonces(address owner) external view returns (uint256);
    function DOMAIN_SEPARATOR() external view returns (bytes32);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Burn(address indexed burner, uint256 amount, uint256 newTotalSupply);
}