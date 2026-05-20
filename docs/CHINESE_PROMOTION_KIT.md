# need-a-hug 中文推广材料

Updated: 2026-05-20

> 这个文件用于人工分享 `need-a-hug`。不要群发、不要伪装用户、不要在不欢迎项目展示的社区硬发。

仓库：https://github.com/lonelymoon87/need-a-hug  
最新版本：https://github.com/lonelymoon87/need-a-hug/releases/latest  
便携 `.skill`：https://github.com/lonelymoon87/need-a-hug/releases/latest/download/need-a-hug.skill  
Claude Code plugin：https://github.com/lonelymoon87/need-a-hug/releases/latest/download/need-a-hug-claude-plugin.zip

## 一句话

`need-a-hug` 是一个给 AI coding agent 的轻量情绪急救 skill：当人已经过载时，先别继续推计划。

## 短介绍

很多 Agent Skill 都在让 AI 更快、更强、更会自动化。`need-a-hug` 反过来提醒 agent：当用户已经很累、很自责、被 bug 或 AI 工具反复出错弄到崩溃时，先看见人，再处理事。

用户可以发送 `need a hug`、`/hug`、`抱抱我`、`安慰我一下`，或者直接说“这个 bug 把我搞崩了”。Agent 会先安慰、降低认知负担，不急着把情绪变成清单；等用户稳一点，再回到一个很小、可验证的下一步。

它不是心理咨询、诊断、医疗建议或紧急服务。它是一个文本型、开源、无网络调用、无隐藏运行时、无数据收集的 person-first fallback layer。

## 适合谁

- 高频使用 Claude Code、Codex、Cursor、Kiro、VS Code Copilot、OpenCode 等 AI coding tools 的开发者。
- 被 AI agent 反复计划、反复改错、反复失败弄到更焦虑的人。
- 想给自己的 agent / prompt / skill 系统加一个更温和边界的 builder。
- 对 agent UX、AI companionship、developer wellbeing 感兴趣的中文技术社区用户。

## 中文渠道优先级

### P0：最适合先发，低成本，反馈质量高

| 渠道 | 建议形式 | 适合原因 | 需要用户协助 |
| --- | --- | --- | --- |
| V2EX | `分享创造` 或 AI/程序员节点的短帖 | 开发者密度高，适合收早期反馈 | 需要你的 V2EX 账号；最好本人发，语气真实 |
| 掘金 | 技术文章 / 沸点 | AI 编程工具用户多，适合讲设计思路 | 需要账号；文章可由你署名发布 |
| 知乎 | 回答或文章 | 适合讲“AI agent 为什么会让人更累”这个问题 | 需要账号；建议不要硬广，先写观点文 |
| 个人公众号 / 微信朋友圈 | 短文或朋友圈 | 中文传播最有效，适合讲故事 | 需要你的微信/公众号操作 |

### P1：适合有一篇完整中文文章之后再发

| 渠道 | 建议形式 | 注意事项 |
| --- | --- | --- |
| SegmentFault | 文章 | 更偏工程，最好强调 Agent Skill 结构和实现方式 |
| OSCHINA | 软件推荐 / 博客 | 可以突出开源、MIT、无数据收集 |
| CSDN | 博客 | SEO 强，但评论反馈可能较弱 |
| 少数派 | 文章投稿 | 更适合“AI 工具如何更照顾人”的产品体验角度 |

### P2：等有 demo 视频 / 更多反馈后再做

| 渠道 | 建议形式 | 注意事项 |
| --- | --- | --- |
| Bilibili | 1-3 分钟 demo 视频 | 需要视觉 demo；不建议只发链接 |
| 即刻 | 动态 | 适合轻量分享，需要账号关系链 |
| 小红书 | 图文卡片 | 可以讲“AI 工具把我搞焦虑了怎么办”，但要避免医疗化表达 |

### P3：AI 工具目录 / 媒体投稿

| 类型 | 例子 | 建议 |
| --- | --- | --- |
| AI 工具导航 | 中文 AI 工具集、AIBase 等 | 等有 landing page、截图、中文介绍后提交 |
| 科技媒体 | 量子位、机器之心、Founder Park 等 | 目前太早；等有用户故事或社区讨论再投 |
| Awesome lists / skill registry | Agent Skill / Claude Skill 相关列表 | 可以先准备 PR，但如果规则要求成熟项目就等一等 |

## 推荐发布顺序

1. **先发 V2EX**：目标是拿到第一批真实开发者反馈，不追求流量。
2. **再发一篇掘金文章**：把设计动机、实现方式、安全边界讲完整。
3. **朋友圈/公众号同步短版**：用更人话的方式讲“为什么 agent 有时应该先停下来”。
4. **根据反馈补 README / demo**：尤其补“Agent made it worse”的中文 GIF 或截图。
5. **再考虑 AI 工具目录和视频平台**。

## V2EX 短帖草稿

标题备选：

- 做了一个有点反常的 Agent Skill：当用户崩溃时，先别继续给计划
- need-a-hug：给 Claude Code / Codex / Cursor 的轻量情绪急救 skill
- AI coding agent 有时会让人更焦虑，我做了一个让它先停下来的 skill

正文：

```text
最近做了一个小的开源 Agent Skill，叫 need-a-hug：
https://github.com/lonelymoon87/need-a-hug

它不是让 agent 更快、更会自动化，反而是提醒 agent：当用户已经明显过载、很自责、被 bug 或 AI 工具反复出错搞到崩溃时，先别继续推计划。

比如用户说：

“AI 一直错，我也快疯了。”
“这个 bug 把我搞崩了。”
“need a hug”

正常 coding agent 可能会继续列步骤、改文件、解释方案。但这个 skill 会让 agent 先安慰、降低认知负担，等人稳一点，再回到一个很小、可验证的下一步。

它不是心理咨询，也不是医疗建议，只是一个很轻的 person-first fallback layer。核心 skill 是纯文本，无网络调用、无隐藏运行时、无数据收集。

目前支持 portable .skill、Claude Code plugin，也有 Codex / Cursor / Kiro / VS Code / OpenCode 等适配。

想听听大家对这个方向的看法：AI coding tools 里需不需要这种“先看见人，再处理事”的 fallback？它应该做成 skill、system prompt，还是工具自身的一部分？
```

## 掘金 / 公众号文章大纲

标题备选：

- 我做了一个“不急着解决问题”的 AI Agent Skill
- 当 AI coding agent 把人搞崩时，它应该先停下来
- need-a-hug：给 AI 编程助手的一层轻量情绪急救

大纲：

1. **问题**：AI agent 很会推进任务，但有时会在用户已经过载时继续加压。
2. **典型场景**：bug 修不动、agent 改太多文件、测试全挂、用户开始怀疑自己。
3. **设计原则**：person-first before task-first。
4. **它做什么**：触发词、第一句、comfort ladder、回到任务、Agent made it worse recovery。
5. **它不做什么**：不治疗、不诊断、不替代现实帮助、不收集数据。
6. **实现方式**：纯文本 Agent Skill + references + Claude Code hooks + 多平台适配。
7. **我想要的反馈**：这种能力应该放在 agent skill、IDE、模型 system prompt，还是产品默认 UX？

## 朋友圈 / 即刻短文

```text
做了一个有点反常的小项目：need-a-hug。

大多数 AI Agent Skill 都在让 AI 更快、更强、更会自动化。这个 skill 反过来提醒 AI：当人已经很累、很自责、被 bug 或 AI 工具反复出错弄到崩溃时，先别继续给计划。

它会让 coding agent 先安慰、慢下来，然后再一起回到一个很小、可验证的下一步。

不是心理咨询，也不是医疗建议，只是给 AI coding tools 的一层轻量情绪急救。

GitHub: https://github.com/lonelymoon87/need-a-hug
```

## 投稿/发帖注意事项

- 不要说“AI 心理医生”“治疗焦虑”“心理健康解决方案”。
- 推荐说“情绪急救”“先别继续推计划”“person-first fallback”。
- 不要多个社区同一天批量发。先发一个社区，认真回复反馈，再决定下一站。
- 如果被质疑“AI 不应该做心理支持”，回应重点是边界：不治疗、不诊断、不替代人，只是在 coding agent 已经参与工作流时避免继续加压。
- 如果社区要求项目成熟度或已有用户，不要硬投；先积累 star、download、issue、反馈截图。

## 需要账号协助的动作

这些动作必须由项目作者或账号拥有者执行：

- V2EX 发帖。
- 掘金发布文章/沸点。
- 知乎回答/文章。
- 微信公众号/朋友圈。
- 即刻、小红书、Bilibili。
- 任何需要登录、实名、绑定手机号、验证码、扫码的平台。

AI 可以继续帮你准备：标题 A/B、正文、配图文案、评论区 FAQ、英文/中文版本、或者根据某个平台的字数限制改稿。
