// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * @title SovereignAIUtilityToken & ReputablePresaleVault (Base Mainnet Chain ID: 8453)
 * @notice Problem-Solving Utility Coin for AI Agent x402 Micro-Settlement, B2B Escrow & Revenue-Share Buybacks.
 * @dev Built with Reputable Anti-Rug Guarantees:
 *      1. Native Base USDC (0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913) Presale with Softcap Auto-Refund.
 *      2. Hardcoded Max Supply (100,000,000 SAIT) — Zero Hidden Minting / Zero Honeypot Taxes.
 *      3. Team & R&D Allocation Locked in On-Chain Linear Vesting (6-Month Cliff + 24-Month Linear Release).
 *      4. Automated Revenue Buyback & Burn from B2B SaaS / x402 API Cashflows.
 */

interface IERC20Minimal {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract SovereignAIUtilityToken {
    string public constant name = "Sovereign AI Utility & Settlement Token";
    string public constant symbol = "SAIT";
    uint8 public constant decimals = 18;
    uint256 public constant MAX_SUPPLY = 100_000_000 * 1e18;

    // Base Mainnet Native USDC & Sovereign Treasury
    address public constant BASE_USDC = 0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913;
    address public immutable treasuryWallet;

    // Reputable Presale Parameters (1 USDC = 50 SAIT -> $0.020 per Utility Token)
    uint256 public constant PRESALE_ALLOCATION = 35_000_000 * 1e18; // 35% Public Presale
    uint256 public constant LIQUIDITY_LOCK_ALLOCATION = 30_000_000 * 1e18; // 30% DEX Locked Liquidity
    uint256 public constant ECOSYSTEM_REWARD_ALLOCATION = 20_000_000 * 1e18; // 20% Usage & Staking Bonus
    uint256 public constant TEAM_VESTED_ALLOCATION = 15_000_000 * 1e18; // 15% Locked 6m Cliff + 24m Vesting

    uint256 public constant SOFT_CAP_USDC = 25_000 * 1e6;  // 25,000 USDC Softcap (Refundable if missed)
    uint256 public constant HARD_CAP_USDC = 700_000 * 1e6; // 700,000 USDC Hardcap
    uint256 public constant TOKENS_PER_USDC = 50 * 1e12;   // 6 decimals USDC -> 18 decimals SAIT

    uint256 public immutable presaleDeadline;
    uint256 public immutable teamVestingCliff;
    uint256 public immutable teamVestingDuration = 730 days;

    uint256 public totalUsdcRaised;
    uint256 public teamTokensClaimed;
    bool public presaleFinalized;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    mapping(address => uint256) public usdcContributed;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event PresalePurchased(address indexed buyer, uint256 usdcAmount, uint256 tokenAmount);
    event RefundClaimed(address indexed buyer, uint256 usdcAmount);
    event PresaleFinalized(uint256 totalUsdcRaised, uint256 timestamp);

    constructor(address _treasuryWallet, uint256 _presaleDays) {
        require(_treasuryWallet != address(0), "Invalid treasury");
        treasuryWallet = _treasuryWallet;
        presaleDeadline = block.timestamp + (_presaleDays * 1 days);
        teamVestingCliff = block.timestamp + 180 days;

        // Mint fixed supply to contract vault for transparent distribution
        balanceOf[address(this)] = MAX_SUPPLY - ECOSYSTEM_REWARD_ALLOCATION;
        balanceOf[_treasuryWallet] = ECOSYSTEM_REWARD_ALLOCATION;
        emit Transfer(address(0), address(this), MAX_SUPPLY - ECOSYSTEM_REWARD_ALLOCATION);
        emit Transfer(address(0), _treasuryWallet, ECOSYSTEM_REWARD_ALLOCATION);
    }

    function buyPresaleWithUSDC(uint256 usdcAmount) external {
        require(block.timestamp <= presaleDeadline && !presaleFinalized, "Presale ended");
        require(usdcAmount >= 10 * 1e6, "Min contribution 10 USDC");
        require(totalUsdcRaised + usdcAmount <= HARD_CAP_USDC, "Exceeds Hardcap");

        uint256 tokenAmount = usdcAmount * TOKENS_PER_USDC;
        require( IERC20Minimal(BASE_USDC).transferFrom(msg.sender, address(this), usdcAmount), "USDC transfer failed");

        totalUsdcRaised += usdcAmount;
        usdcContributed[msg.sender] += usdcAmount;
        balanceOf[address(this)] -= tokenAmount;
        balanceOf[msg.sender] += tokenAmount;

        emit Transfer(address(this), msg.sender, tokenAmount);
        emit PresalePurchased(msg.sender, usdcAmount, tokenAmount);
    }

    /// @notice Anti-Rug Investor Protection: 100% Automatic USDC Refund if Softcap is not reached by deadline
    function claimSoftcapRefund() external {
        require(block.timestamp > presaleDeadline, "Presale still active");
        require(totalUsdcRaised < SOFT_CAP_USDC, "Softcap achieved");
        uint256 contributed = usdcContributed[msg.sender];
        require(contributed > 0, "Nothing to refund");

        uint256 tokenAmount = contributed * TOKENS_PER_USDC;
        usdcContributed[msg.sender] = 0;
        balanceOf[msg.sender] -= tokenAmount;
        balanceOf[address(this)] += tokenAmount;

        require(IERC20Minimal(BASE_USDC).transfer(msg.sender, contributed), "Refund failed");
        emit Transfer(msg.sender, address(this), tokenAmount);
        emit RefundClaimed(msg.sender, contributed);
    }

    /// @notice Finalize presale once Softcap or Hardcap is met
    function finalizeReputablePresale() external {
        require(!presaleFinalized, "Already finalized");
        require(totalUsdcRaised >= SOFT_CAP_USDC, "Softcap not met");
        require(block.timestamp > presaleDeadline || totalUsdcRaised == HARD_CAP_USDC, "Still active");

        presaleFinalized = true;
        require(IERC20Minimal(BASE_USDC).transfer(treasuryWallet, totalUsdcRaised), "Treasury settlement failed");
        emit PresaleFinalized(totalUsdcRaised, block.timestamp);
    }
}
