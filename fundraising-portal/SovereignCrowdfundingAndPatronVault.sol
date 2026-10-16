// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * @title SovereignCrowdfundingAndPatronVault (Base Mainnet Chain ID: 8453)
 * @notice 3-in-1 Capital Formation Contract:
 *         1. Direct Crypto Tipping & Patronage Donations (Xin Tien / Donate / Sponsor Tiers)
 *         2. Non-Dilutive Ecosystem Grant Milestone Receiving Vault (Giai Ngan Quy Tai Tro)
 *         3. Revenue-Sharing Community Crowdfunding & Angel Investment Round (Gay Quy & Keu Goi Dau Tu)
 */

interface IERC20BaseUSDC {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

contract SovereignCrowdfundingAndPatronVault {
    address public constant BASE_USDC = 0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913;
    address public immutable sovereignTreasury;

    uint256 public totalDonationsUsdc;
    uint256 public totalGrantsUsdc;
    uint256 public totalCrowdfundingUsdc;

    struct PatronInfo {
        uint256 totalDonatedUsdc;
        uint256 totalInvestedUsdc;
        string latestMessage;
    }

    mapping(address => PatronInfo) public patrons;

    event DirectDonationReceived(address indexed donor, uint256 usdcAmount, string message, string tier);
    event EcosystemGrantReceived(address indexed grantProvider, string grantName, uint256 usdcAmount);
    event CrowdfundingInvestmentReceived(address indexed investor, uint256 usdcAmount, uint256 revenueShareBps);

    constructor(address _sovereignTreasury) {
        require(_sovereignTreasury != address(0), "Invalid treasury");
        sovereignTreasury = _sovereignTreasury;
    }

    /// @notice 1. Direct Donation / Tipping (Xin Tien / Sponsor Open-Source AI Work)
    function donateOrTipUSDC(uint256 usdcAmount, string calldata message) external {
        require(usdcAmount >= 1 * 1e6, "Min tip 1 USDC");
        require(IERC20BaseUSDC(BASE_USDC).transferFrom(msg.sender, sovereignTreasury, usdcAmount), "Transfer failed");

        totalDonationsUsdc += usdcAmount;
        patrons[msg.sender].totalDonatedUsdc += usdcAmount;
        patrons[msg.sender].latestMessage = message;

        string memory tier = usdcAmount >= 500 * 1e6
            ? "DIAMOND_SPONSOR"
            : usdcAmount >= 100 * 1e6
                ? "GOLD_PATRON"
                : usdcAmount >= 20 * 1e6
                    ? "SILVER_BACKER"
                    : "COMMUNITY_SUPPORTER";

        emit DirectDonationReceived(msg.sender, usdcAmount, message, tier);
    }

    /// @notice 2. Receive Non-Dilutive Web3/AI Public Goods Grant (Base / Optimism / Gitcoin / Arbitrum)
    function disburseEcosystemGrant(string calldata grantProgramName, uint256 usdcAmount) external {
        require(usdcAmount > 0, "Invalid grant amount");
        require(IERC20BaseUSDC(BASE_USDC).transferFrom(msg.sender, sovereignTreasury, usdcAmount), "Grant transfer failed");

        totalGrantsUsdc += usdcAmount;
        emit EcosystemGrantReceived(msg.sender, grantProgramName, usdcAmount);
    }

    /// @notice 3. Crowdfunding & Angel Seed Investment (Gay Quy Cong Dong & Keu Goi Dau Tu)
    function investCrowdfundingUSDC(uint256 usdcAmount) external {
        require(usdcAmount >= 50 * 1e6, "Min crowdfunding ticket 50 USDC");
        require(IERC20BaseUSDC(BASE_USDC).transferFrom(msg.sender, sovereignTreasury, usdcAmount), "Investment transfer failed");

        totalCrowdfundingUsdc += usdcAmount;
        patrons[msg.sender].totalInvestedUsdc += usdcAmount;
        // 1 bps of revenue-share pool per 250 USDC invested
        uint256 revShareBps = (usdcAmount / (250 * 1e6)) + 1;
        emit CrowdfundingInvestmentReceived(msg.sender, usdcAmount, revShareBps);
    }

    /// @notice Accept native Base ETH tips & donations directly
    receive() external payable {
        (bool ok, ) = sovereignTreasury.call{value: msg.value}("");
        require(ok, "ETH forward failed");
    }
}
