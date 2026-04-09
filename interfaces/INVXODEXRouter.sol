// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title INVXODEXRouter
/// @notice Interface for the NVXO DEX concentrated liquidity router
/// @dev UniswapV3-style AMM with 0.01% / 0.05% / 0.30% / 1.00% fee tiers
interface INVXODEXRouter {
    struct SwapParams {
        address tokenIn;
        address tokenOut;
        uint24 fee;           // Fee tier: 100, 500, 3000, or 10000
        address recipient;
        uint256 deadline;
        uint256 amountIn;
        uint256 amountOutMinimum;
        uint160 sqrtPriceLimitX96;
    }

    struct ExactOutputParams {
        bytes path;
        address recipient;
        uint256 deadline;
        uint256 amountOut;
        uint256 amountInMaximum;
    }

    struct AddLiquidityParams {
        address token0;
        address token1;
        uint24 fee;
        address recipient;
        int24 tickLower;
        int24 tickUpper;
        uint256 amount0Desired;
        uint256 amount1Desired;
        uint256 amount0Min;
        uint256 amount1Min;
        uint256 deadline;
    }

    // ── Swaps ───────────────────────────────────────────────
    function exactInputSingle(SwapParams calldata params) external payable returns (uint256 amountOut);
    function exactInput(bytes calldata path, address recipient, uint256 deadline, uint256 amountIn, uint256 amountOutMin) external payable returns (uint256 amountOut);
    function exactOutputSingle(SwapParams calldata params) external payable returns (uint256 amountIn);

    // ── Liquidity ───────────────────────────────────────────
    function addLiquidity(AddLiquidityParams calldata params) external returns (uint256 tokenId, uint128 liquidity, uint256 amount0, uint256 amount1);
    function removeLiquidity(uint256 tokenId, uint128 liquidityAmount, uint256 amount0Min, uint256 amount1Min, uint256 deadline) external returns (uint256 amount0, uint256 amount1);
    function collectFees(uint256 tokenId) external returns (uint256 fee0, uint256 fee1);

    // ── Views ───────────────────────────────────────────────
    function quoteExactInput(address tokenIn, address tokenOut, uint24 fee, uint256 amountIn) external view returns (uint256 amountOut, uint256 priceImpact);
    function getPool(address token0, address token1, uint24 fee) external view returns (address pool);
    function factory() external view returns (address);
    function WETH() external view returns (address);

    // ── Events ──────────────────────────────────────────────
    event Swap(address indexed sender, address tokenIn, address tokenOut, uint256 amountIn, uint256 amountOut);
    event LiquidityAdded(uint256 indexed tokenId, address indexed provider, uint128 liquidity);
    event LiquidityRemoved(uint256 indexed tokenId, address indexed provider, uint128 liquidity);
}