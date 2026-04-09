# NVXO Smart Contract Interfaces

> Public interface definitions for the NVXO ecosystem smart contracts.
> **Implementation is proprietary and private.** This repository contains only interface files (.sol) and ABI JSON — sufficient for developers to build integrations.

## Structure

```
contracts-interface/
├── interfaces/
│   ├── INVXOToken.sol          # NVXO ERC-20 token interface
│   ├── INVXOStaking.sol        # Staking contract interface
│   ├── INVXOGovernor.sol       # DAO governance interface
│   ├── INVXOBridge.sol         # Cross-chain bridge interface
│   ├── INVXODEXPool.sol        # DEX liquidity pool interface
│   ├── INVXODEXRouter.sol      # DEX router interface
│   ├── INVXOMarketplace.sol    # NFT marketplace interface
│   ├── INVXOSecurityToken.sol  # ERC-1400 security token interface
│   └── INVXOPayGateway.sol     # Payment gateway interface
└── abis/
    ├── NVXOToken.json
    ├── NVXOStaking.json
    ├── NVXOGovernor.json
    ├── NVXOBridge.json
    ├── NVXODEXRouter.json
    ├── NVXOMarketplace.json
    └── NVXOSecurityToken.json
```

## Usage

```typescript
// JavaScript / TypeScript
import { ethers } from 'ethers';
import NVXOTokenABI from './abis/NVXOToken.json';

const token = new ethers.Contract(NVXO_TOKEN_ADDRESS, NVXOTokenABI, provider);
const balance = await token.balanceOf(walletAddress);
```

```python
# Python (web3.py)
from web3 import Web3
import json

w3 = Web3(Web3.HTTPProvider('https://rpc.nvxo.io'))
with open('abis/NVXOToken.json') as f:
    abi = json.load(f)
token = w3.eth.contract(address=NVXO_TOKEN_ADDRESS, abi=abi)
balance = token.functions.balanceOf(wallet_address).call()
```

## Contract Addresses

> Mainnet addresses will be published here at TGE (Q4 2025).
> Testnet addresses available at [testnet-explorer.nvxo.io](https://testnet-explorer.nvxo.io).

| Contract | Mainnet | Testnet |
|----------|---------|---------|
| NVXO Token | TBA | TBA |
| NVXO Staking | TBA | TBA |
| NVXO Governor | TBA | TBA |
| NVXO Bridge | TBA | TBA |
| DEX Router | TBA | TBA |
| Marketplace Core | TBA | TBA |

## Audit Reports

All contracts are being audited prior to mainnet deployment.
Published reports: [audit-reports](https://github.com/NVXO-public/audit-reports)

---
*Questions? Open an issue or email dev@nvxo.io*
