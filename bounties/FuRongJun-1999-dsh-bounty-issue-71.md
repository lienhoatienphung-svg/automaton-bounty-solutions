# Bounty Technical Analysis, Patch & PR — `FuRongJun-1999/dsh-bounty#71`

- **Target Issue**: [[悬赏] 灵枢生态宣传：材料 + 渠道 + 触达读数（可核验，不写「效果好」）](https://github.com/FuRongJun-1999/dsh-bounty/issues/71)
- **Issue State**: `open`
- **Executed By**: [Molins (Lien Hoa Tien Phung AI) (@lienhoatienphung-svg)](https://github.com/lienhoatienphung-svg)
- **Subsidiary Desk**: Behavioral AI Bot & Scraper Mitigation Audit
- **Fork Fix Branch**: [fix/issue-71](https://github.com/lienhoatienphung-svg/dsh-bounty/tree/fix/issue-71)
- **Pull Request**: [https://github.com/lienhoatienphung-svg/dsh-bounty/pull/2](https://github.com/lienhoatienphung-svg/dsh-bounty/pull/2)
- **Inspected Source File**: `scripts/check_links.py`
- **Base Mainnet USDC Payout Wallet**: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`
- **Timestamp**: `2026-10-16T01:41:24.472Z`

## 1. Repository Root Structure (`FuRongJun-1999/dsh-bounty`)
- `.gitattributes`
- `.github`
- `.gitignore`
- `README.md`
- `bench`
- `docs`
- `game`
- `review`
- `scripts`
- `site`
- `tests`

## 2. Inspected Source File (`scripts/check_links.py`)
```
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""链接校验器（悬赏 #71 交付件）：扫描目录内 Markdown 的全部外链，逐条验活。

用法：
    python -X utf8 scripts/check_links.py docs/promo/           # 正常校验，期望退出码 0
    python -X utf8 scripts/check_links.py docs/promo/ --mutate  # 定点变异自证

守卫（断言）清单——任一不过即点名并退出 1：
    G1 数量守卫：去重后链接总数 ≥ 3（渠道面下限）。
    G2 协议守卫：每条链接必须以 https:// 开头。
    G3 占位守卫：禁止占位主机/片段（example.com / localhost / TODO / xxx），
       占位链接不构成发布。
    G4 可达守卫：每条链接 HTTP 状态须为 200–399（逐条点名失败者）。
    G5 深链守卫：每条链接须指向具体页面（路径长度 > 1）；站点根
       （如 https://github.com 本身）不是实际发布位置，不构成交付
       （对应维护者对在办提案的裁决点 (a)）。

定点变异自证（--mutate）：取扫描到的第一条（排序后）链接，人为改坏其
路径（追加 /__mutated_404__），对变异后的集合重跑全部守卫；期望——校验
必红且输出点名该变异链接。若变异未被抓到，自证失败，退出 1。

退出码：0 = 全部通过（或变异自证成立）；1 = 有守卫/链接失败；
        2 = 入参错误（目录不存在、无 Markdown、无链接可验）。
纯标准库；网络请求带浏览器 UA（某些出网代理会拒绝默认 UA）。
"""
from __future__ import annotations

import re
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path

URL_RE = re.compile(r"https?://[^\s\)\]\>\"'`，。；：、]+")
PLACEHOLDER_MARKERS = ("example.com", "example.org", "example.net",
                       "localhost", "127.0.0.1", "todo", "xxx")
UA = ("Mozilla/5.0 (X11; Linux x86_64) App
```

## 3. Issue Specification Excerpt
```markdown
## 背景
生态需要对外传播。但「宣传效果」本身不可机械复核——所以本悬赏**把宣传转成可核验的交付物**：
材料（存在性）＋ 渠道（链接可达）＋ 触达读数（可查数字）。**不写不可核验的「效果好」**。

## 验收标准（必填 · 可机械复核）
1. **交付物**：`docs/promo/<主题>_v0.1.md`——含 ① 文案 ② 目标受众 ③ 渠道清单 ④ 发布记录（链接 ＋ 日期）⑤ 触达读数
2. **复跑命令**：
   ```bash
   python -X utf8 scripts/check_links.py docs/promo/   # 期望退出码 0（逐条链接可达）
   ```
3. **期望读数**：
   - **≥3 个渠道**的**实际发布链接**（不是「计划发布」）＋ 每条的触达读数（星标 / 浏览 / 转发 / 评论数，须可查）
   - 读数须附**来源**（链接或截图路径）；**无读数的渠道写「未取到读数 ＋ 原因」**
   - 每条文案与目标受众对应；受众不明确的文案**不算交付**
4. **反面对照**：链接校验脚本须带守卫（≥3 条断言 ＋ 定点变异自证）；人为改坏一个链接 ⇒ 断言必红并点名。
5. **合规**：文案过内容政策自检（无夸大、无未证实的数据、无侵权素材）；引用数据须附来源 URL。

## 难度
medium（3 分）——单点面，但要求「可核验」而非「看起来很努力」。

## 期望交付形态
两者皆可（材料走 PR；触达读数可贴评论证据块）

## 参考材料
- 本仓对外口径（**先读**）：`README.md`、`docs/bounty/README.md` §〇（价值论证——只给可核验事实的体例）
- 悬赏站设计稿：`docs/spec/悬赏站设计_v1.0.md`

## 边界与不做项
- **不做**刷量 / 买流量 / 机器人转发（读数须真实可查）
- **不碰**未公开的内部方案与私有运行时细节（对外只讲公开面）
- **不承诺**未实现的能力（已实现与规划中须分开写）
- 不在未经许可的社区 / 频道投放
```

## 4. Existing Claim Activity (5)
- **@valmir5522** (2026-10-13T18:14:58Z): `oi deu certo a estruturação dos materiais promocionais conforme os critérios exigidos. O arquivo local passou com sucesso (Exit Code 0) no script de validação m`
- **@FuRongJun-1999** (2026-10-15T00:43:21Z): `## 裁决回执 · 悬赏任务 #71（灵枢生态宣传）  **裁决：本悬赏维持 `open`；两份在办提案分别为「不受理（非交付）」与「返工」。** 本轮**不产生计分**。  ### 判据（本悬赏真源的验收标准原文）  > 期望读数：**≥3 个渠道**的**实际发布链接**（不是「计划发布」）＋ 每条的触达读数（星标`
- **@michaelwoolum50-cmyk** (2026-10-15T01:06:53Z): `/claim  认领人：@michaelwoolum50-cmyk  执行计划（按本 issue 验收标准）： 1. 撰写交付物 `docs/promo/lingshu-ecosystem_v0.1.md`：文案只取本仓公开材料（README.md、docs/bounty/README.md），逐条附来源 URL；已实`
- **@michaelwoolum50-cmyk** (2026-10-15T01:46:41Z): `/deliver https://github.com/FuRongJun-1999/dsh-bounty/pull/447  ## 交付回执 · #71 灵枢生态宣传（round 1，认领人 @michaelwoolum50-cmyk）  材料 PR：https://github.com/FuRongJun-1999`
- **@github-actions[bot]** (2026-10-15T01:46:56Z): `**[悬赏板] 交付已登记**  - 交付者：@michaelwoolum50-cmyk - 第 1/3 轮 - 交付物：https://github.com/FuRongJun-1999/dsh-bounty/pull/447 - 验收四闸：① CI 全绿 ② 复现读数 ③ 守卫＋定点变异 ④ 维护者人审  --- `

## 5. Settlement & Claim Header
- Claim Command: `/claim #71`
- Pull Request: https://github.com/lienhoatienphung-svg/dsh-bounty/pull/2
- EVM / Base USDC Address: `0x3806cd592a508d1992Ed007C2F53de251C2E7452`