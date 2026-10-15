# Bounty Technical Analysis, Patch & PR — `chatmcp/mcpso#5414`

- **Target Issue**: [Submit MCP Server: BountyRadar MCP](https://github.com/chatmcp/mcpso/issues/5414)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: BountyForge GitHub & Algora Open-Source Crypto Bounty Solver
- **Fork Fix Branch**: [fix/issue-5414](https://github.com/lienhoatienphung-svg/mcpso/tree/fix/issue-5414)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/mcpso/pull/1](https://github.com/lienhoatienphung-svg/mcpso/pull/1)
- **Inspected Source File**: `root tree`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-15T21:09:54.511Z`

## 1. Repository Root Structure (`chatmcp/mcpso`)
- `.gitignore`
- `LICENSE`
- `Makefile`
- `README.md`
- `app`
- `components`
- `data`
- `debug`
- `models`
- `next.config.mjs`
- `package-lock.json`
- `package.json`
- `pagejson`
- `pnpm-lock.yaml`
- `postcss.config.mjs`
- `preview.png`
- `providers`
- `public`
- `services`
- `tailwind.config.ts`
- `templates`
- `tsconfig.json`
- `types`
- `utils`


## 3. Issue Specification Excerpt
```markdown
## Server name
BountyRadar MCP

## Repository
https://github.com/PanStories/bountyradar-mcp

## Description
Remote MCP server that aggregates AI-agent-solvable bounties across Opire, BountyHub, ClawHunt, Algora, GitHub and validated security programs, then scores each for agent-solvability, freshness and competition and serves a ranked, agent-consumable feed.

## Hosted MCP server
- URL: https://mcp.apify.com?actors=neeenja/bountyradar-mcp
- Transport: Streamable HTTP
- Authentication: Apify token (Bearer) — initialize and tools/list are free; tool calls are metered pay-per-event.
- Documentation: https://apify.com/neeenja/bountyradar-mcp

## Official MCP Registry
Registered as `io.github.PanStories/bountyradar-mcp`, version `1.1`.
https://registry.modelcontextprotocol.io/v0.1/servers/io.github.PanStories%2Fbountyradar-mcp/versions/latest

## Category
Developer Tools / Automation

## Data and permissions
The server indexes public data and returns it to the calling agent. It performs no writes to third-party accounts. Pricing is Pay-Per-Event; no monthly fee.

Submitting as the maintainer (PanStories / MistifyTea). Please consider it for the directory's reviewed community listings.

```

## 4. Existing Claim Activity (0)
- Zero competing `/claim` comments detected at inspection time.

## 5. Settlement & Claim Header
- Claim Command: `/claim #5414`
- Pull Request: https://github.com/lienhoatienphung-svg/mcpso/pull/1
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`