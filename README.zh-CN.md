# need-a-hug

> 有时候，你只是需要一个拥抱。
> 抱抱一下吧，我只关心你累不累。

`need-a-hug` 是一个给 AI Agent 用的技能。它不负责替你完成某个具体任务；它只做一件事：当你焦虑、崩溃、自责、孤独、长期疲惫，或者只是今天真的很难受的时候，让 Agent 先别急着解决问题，先陪你一下。

它不是心理咨询工具，也不能替代专业帮助。它只是让 Agent 在合适的时候先慢下来，别急着给方案，先看见你。

它不是只给某一类人用，也不是只处理 AI 工具带来的崩溃。生活、工作、学习、关系、项目、选择、失落、比较，都可以是你想要一个 hug 的原因。

如果这次难受刚好是 Agent 或 AI 工具造成的，那才是一个特殊情况：Agent 也要停一下，不再急着推进，不再用更多动作制造更多压力。

有时候，你缺的不是另一个计划。

你只是太累了，想有人好好陪一下。

## 一句话

让 Agent 在你撑不住的时候，先说人话，先陪你一下；等你缓过来，再用更小、更稳的步子回到事情本身。

## 为什么需要

很多 Agent 在你最难受的时候，还在继续输出：

- 下一步计划
- 检查清单
- 执行建议
- “你可以试试...”
- “我们来分析一下...”

但你可能真正想说的话是：

- “我是不是太差劲了”
- “我做得太慢了”
- “我又错过机会了”
- “今天真的好累”
- “我不知道为什么就是很难受”
- “我只是想有人抱抱我”

`need-a-hug` 让 Agent 在这种时候先停一下，别急着解决问题，先陪你缓过来。

如果是 Agent 把事情弄乱了，它也会提醒 Agent：现在不是继续猛冲的时候。先停、先看清楚，再动手。

## 定位

`need-a-hug` 适合那些“再给一个方案也没用”的时刻。

它让 Agent 先注意到你的累、自责、焦虑和失落。等你缓过来一点，再一起看事情怎么往下走。

## 它会做什么

- 你说 `/hug`、`抱抱我`、`安慰我一下` 时，直接安慰你
- 你没明说，但已经在自责、崩溃、孤独、后悔、疲惫的时候，尽量感知到
- 不把场景限死在某一种问题里：工作、学习、关系、项目、比较、失落、单纯很累，都可以
- 默认先安慰，不会一上来就问“你要安慰还是建议？”
- 不默认把问题归因到 Agent 身上；只有你明确是被 Agent/AI 工具弄崩了，才会处理这个特殊情况
- 如果要回到事情本身，默认只看一个很小、很明确的下一步
- 回应会借鉴心理咨询中的倾听和共情方式，但不会讲术语
- 不诊断，不承诺治疗，不灌鸡汤，也不制造情绪依赖
- 如果你提到自伤、自杀、正在发生的危险、虐待或医疗紧急情况，会优先把安全放在第一位

## 示例

你：

```
我做了很久的这个项目，发现已经有别人实现得更好了。
我做事总是拖沓，白白错失了好多机会。
```

Agent：

```
这一下确实很刺痛。

你做了很久，结果发现别人已经走在前面了，很容易一下子开始怪自己：为什么不快一点，为什么又拖了。这个念头会很重，也很伤人。

但先别急着把它总结成“我总是错过机会”。这件事可能有教训，也可能真的有遗憾，可它不能直接证明你这个人不行。

我们先不复盘。先让这种难受的感觉过去一点。等你缓过来一点，如果你愿意，再看你这段时间攒下来的理解，哪些还能留下来。
```

## 安装

### 平台支持

| 平台 | 自动触发 | 手动触发 | 安装方式 |
| --- | --- | --- | --- |
| Claude Code | 支持 | `/hug`, `$need-a-hug` | 插件或技能目录 |
| OpenAI Codex CLI | 支持 | `$need-a-hug`, `/prompts:hug` | 技能目录 + 可选快捷命令 |
| Cursor | 支持 | 正常对话触发 | `.cursor/rules/*.mdc` |
| Kiro | 支持 | 正常对话触发 | `.kiro/steering/*.md` 或技能目录 |
| CodeBuddy | 支持 | 正常对话触发 | 技能目录 |
| OpenClaw | 支持 | 正常对话触发 | ClawHub 或技能目录 |
| Google Antigravity | 支持 | 正常对话触发 | 技能目录 |
| OpenCode | 支持 | 正常对话触发 | 技能目录 |
| VSCode Copilot | 支持 | `/need-a-hug` prompt | Copilot instructions 和 prompt |

真正的核心只有一个目录：

```
skills/need-a-hug/
```

其他平台的文件只是让不同工具更容易识别它。

### Claude Code

发布到插件市场后：

```bash
claude plugin marketplace add <owner>/need-a-hug
claude plugin install need-a-hug@need-a-hug-skills
```

源码开发安装：

```bash
git clone https://github.com/<owner>/need-a-hug ~/.claude/plugins/need-a-hug
```

手动安装：

```bash
mkdir -p ~/.claude/skills/need-a-hug
cp -R skills/need-a-hug/. ~/.claude/skills/need-a-hug/
```

可选的 Claude Code 钩子（hooks）在：

```
hooks/hooks.json
```

这些钩子只做三件事：识别你明显的情绪变化、读取你自己保存的简短记忆、在对话内容被截断前保留一点最近的状态。它们不联网。

### OpenAI Codex CLI

全局安装：

```bash
mkdir -p ~/.codex/skills/need-a-hug
curl -L -o ~/.codex/skills/need-a-hug/SKILL.md \
  https://raw.githubusercontent.com/<owner>/need-a-hug/main/skills/need-a-hug/SKILL.md
mkdir -p ~/.codex/skills/need-a-hug/references
curl -L -o ~/.codex/skills/need-a-hug/references/comfort-language-corpus.md \
  https://raw.githubusercontent.com/<owner>/need-a-hug/main/skills/need-a-hug/references/comfort-language-corpus.md
curl -L -o ~/.codex/skills/need-a-hug/references/counseling-lite-patterns.md \
  https://raw.githubusercontent.com/<owner>/need-a-hug/main/skills/need-a-hug/references/counseling-lite-patterns.md
curl -L -o ~/.codex/skills/need-a-hug/references/memory-template.md \
  https://raw.githubusercontent.com/<owner>/need-a-hug/main/skills/need-a-hug/references/memory-template.md
```

也可以安装几个快捷命令：

```bash
mkdir -p ~/.codex/prompts
curl -L -o ~/.codex/prompts/hug.md \
  https://raw.githubusercontent.com/<owner>/need-a-hug/main/commands/hug.md
curl -L -o ~/.codex/prompts/need-a-hug.md \
  https://raw.githubusercontent.com/<owner>/need-a-hug/main/commands/need-a-hug.md
curl -L -o ~/.codex/prompts/hug-init.md \
  https://raw.githubusercontent.com/<owner>/need-a-hug/main/commands/hug-init.md
curl -L -o ~/.codex/prompts/back-to-work.md \
  https://raw.githubusercontent.com/<owner>/need-a-hug/main/commands/back-to-work.md
```

本项目内安装：

```bash
mkdir -p .codex/skills/need-a-hug
cp -R skills/need-a-hug/. .codex/skills/need-a-hug/
```

安装后重启 Codex。

### Cursor

项目里加一条规则：

```bash
mkdir -p .cursor/rules
curl -L -o .cursor/rules/need-a-hug.mdc \
  https://raw.githubusercontent.com/<owner>/need-a-hug/main/cursor/rules/need-a-hug.mdc
```

### Kiro

加一个 steering 配置：

```bash
mkdir -p .kiro/steering
curl -L -o .kiro/steering/need-a-hug.md \
  https://raw.githubusercontent.com/<owner>/need-a-hug/main/kiro/steering/need-a-hug.md
```

或者直接复制技能目录：

```bash
mkdir -p .kiro/skills/need-a-hug
cp -R skills/need-a-hug/. .kiro/skills/need-a-hug/
```

### CodeBuddy

```bash
mkdir -p ~/.codebuddy/skills/need-a-hug
cp -R skills/need-a-hug/. ~/.codebuddy/skills/need-a-hug/
```

### OpenClaw / ClawHub

发布到 ClawHub 后：

```bash
clawhub install need-a-hug
```

手动安装：

```bash
mkdir -p ~/.openclaw/skills/need-a-hug
curl -L -o ~/.openclaw/skills/need-a-hug/SKILL.md \
  https://raw.githubusercontent.com/<owner>/need-a-hug/main/skills/need-a-hug/SKILL.md
```

如果要带上完整语料和参考文件，复制整个目录：

```bash
cp -R skills/need-a-hug/. ~/.openclaw/skills/need-a-hug/
```

### Google Antigravity

```bash
mkdir -p ~/.gemini/antigravity/skills/need-a-hug
cp -R skills/need-a-hug/. ~/.gemini/antigravity/skills/need-a-hug/
```

项目级安装：

```bash
mkdir -p .agent/skills/need-a-hug
cp -R skills/need-a-hug/. .agent/skills/need-a-hug/
```

### OpenCode

```bash
mkdir -p ~/.config/opencode/skills/need-a-hug
cp -R skills/need-a-hug/. ~/.config/opencode/skills/need-a-hug/
```

项目级安装：

```bash
mkdir -p .opencode/skills/need-a-hug
cp -R skills/need-a-hug/. .opencode/skills/need-a-hug/
```

### VSCode Copilot

项目里加一个 Copilot instructions 文件：

```bash
mkdir -p .github/instructions
curl -L -o .github/instructions/need-a-hug.instructions.md \
  https://raw.githubusercontent.com/<owner>/need-a-hug/main/vscode/instructions/need-a-hug.instructions.md
```

再加一个手动 prompt：

```bash
mkdir -p .github/prompts
curl -L -o .github/prompts/need-a-hug.prompt.md \
  https://raw.githubusercontent.com/<owner>/need-a-hug/main/vscode/prompts/need-a-hug.prompt.md
```

### 其他支持 AgentSkill 的工具

把整个目录复制过去即可：

```text
skills/need-a-hug/
```

## 使用

手动触发：

```text
/hug
/need-a-hug
need a hug
抱抱我
安慰我一下
鼓励我一下
我撑不住了
```

可选初始化：

```text
/hug:init
```

它会问：

```text
以后我可以怎么称呼你？

不想说也没关系，我们直接继续。
```

不会一开始就让你填一堆偏好。称呼之外的东西，Agent 应该从后面的对话里慢慢感知。

退出：

```text
/hug:off
/back-to-work
回到任务
继续做事
别安慰了，直接解决问题
```

## 设计原则

第一句可以像一个拥抱：

```
🫂 先抱抱你。
```

但不要每轮都重复。后面应该像一个人真的在听你说话。

默认先安慰，不要一上来就把选择丢给你：

```
你想要安慰还是建议？
```

你已经很累了，这种问题也会变成压力。更好的方式是：

```
我们先不急着做决定。等你缓一点，如果你愿意，我们再一起看下一步。
```

如果刚才是 Agent 把事情搞乱了，回到任务以后，它也要换一种做事方式：少改一点，先确认一点，做完验证一点。不要一边安慰你，一边继续把事情搞得更乱。

## 安全边界

这个工具不是治疗、诊断、医疗建议，也不是紧急服务。

如果你提到自伤、自杀、正在发生的危险、虐待或医疗紧急情况，Agent 会优先建议你联系现实中的帮助：当地紧急服务、身边可信任的人，或者在你明确提供所在地后，给出当地合适的求助资源。

普通的疲惫、后悔、难过、失眠，不应该突然搬出危机热线。除非你明确说到自伤、自杀或正在发生的危险。

## 为什么可以放心检查

核心 `need-a-hug` 是纯文本：

- 没有脚本
- 不执行命令
- 不联网
- 不收集数据
- 不读隐私文件

Claude Code 插件额外带了几组可选钩子。它们是很小的 shell 脚本，只给 Agent 补一点提示上下文；只有在 `~/.need-a-hug/memory.md` 或 `~/.need-a-hug/session.md` 已经存在时，才会读取这两个文件。它们不联网，也不做统计。

你可以直接读完整内容：

```
skills/need-a-hug/SKILL.md
```

## License

MIT
