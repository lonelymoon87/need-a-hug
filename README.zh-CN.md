# need-a-hug

> Sometimes you just need a hug.
>
> 抱抱一下吧，我只关心你累不累。

`need-a-hug` 是一个轻量 AgentSkill。它不会实现某个具体功能，而是在用户焦虑、崩溃、自责、孤独、burnout、被 bug 或 AI 搞到很难受的时候，让 Agent 暂时从“解决问题”切换成“先安慰人”。

它不是 AI 心理咨询师，也不是医疗或治疗产品。它更像一个很小的情绪急救层：有时候，人不是需要更多计划，而是需要先被好好抱一下。

## 一句话

让你的 Agent 学会在用户撑不住的时候，先说人话，先安慰，再解决问题。

## 为什么需要

很多 Agent 在用户最难受的时候，还是继续输出：

- 下一步计划
- checklist
- debugging 建议
- “你可以试试...”
- “我们来分析一下...”

但用户可能真正想说的是：

- “我是不是太废物了”
- “我做得太慢了”
- “我又错过机会了”
- “这个 bug 把我搞崩了”
- “AI 一直错，我也快疯了”
- “我只是想有人抱抱我”

`need-a-hug` 的作用就是让 Agent 在这种时候先停一下，别急着解决问题，先把人稳住。

## 定位

`need-a-hug` 适合那些“再来一个 checklist 也没用”的时刻。

它让 Agent 先看见用户的累、自责、焦虑和失落，先把人稳住，再慢慢回到事情本身。

## 它会做什么

- 识别显式触发：`/hug`、`/need-a-hug`、`抱抱我`、`安慰我一下`
- 识别隐式情绪信号：自责、羞耻、焦虑、崩溃、孤独、错失机会、burnout
- 识别程序员场景：bug、AI 反复出错、项目失败、竞品已经做出来、觉得自己太菜
- 默认先安慰，不让用户马上选择“你要安慰还是建议”
- 用心理咨询里的倾听、共情、去羞耻、温和重构作为内部脚手架
- 表面上保持自然说话，不说“我在使用 CBT/OARS 分析你”
- 避免毒鸡汤、诊断、治疗承诺、情感依赖
- 遇到自伤、自杀、危险、虐待、医疗紧急情况时，优先安全引导

## 示例

用户：

```text
我做了很久的这个项目，发现已经有别人实现得更好了。
我做事总是拖沓，白白错失了好多机会。
```

Agent：

```text
这一下确实很刺痛。

你做了很久，结果发现别人已经走在前面了，很容易一下子开始怪自己：为什么不快一点，为什么又拖了。这个念头会很重。

但先别急着把它总结成“我总是错过机会”。这件事可能有教训，也可能真的有遗憾，可它不能直接判你这个人不行。

我们可以先不复盘。先让这一下难受过去一点。等你缓一点，如果你愿意，再看你这段时间做出来的理解，哪些还能留下来。
```

## 安装

### 平台支持

| 平台 | 自动触发 | 手动触发 | 安装方式 |
| --- | --- | --- | --- |
| Claude Code | 支持 | `/hug`, `$need-a-hug` | Plugin 或 skill 目录 |
| OpenAI Codex CLI | 支持 | `$need-a-hug`, `/prompts:hug` | Skill 目录 + 可选 prompts |
| Cursor | 支持 | 正常对话触发 | `.cursor/rules/*.mdc` |
| Kiro | 支持 | 正常对话触发 | `.kiro/steering/*.md` 或 skill 目录 |
| CodeBuddy | 支持 | 正常对话触发 | Skill 目录 |
| OpenClaw | 支持 | 正常对话触发 | ClawHub 或 skill 目录 |
| Google Antigravity | 支持 | 正常对话触发 | Skill 目录 |
| OpenCode | 支持 | 正常对话触发 | Skill 目录 |
| VSCode Copilot | 支持 | `/need-a-hug` prompt | Copilot instructions + prompt |

核心真源是：

```text
skills/need-a-hug/
```

其他平台文件只是很薄的适配层。

### Claude Code

发布到 marketplace 后：

```bash
claude plugin marketplace add <owner>/need-a-hug
claude plugin install need-a-hug@need-a-hug-skills
```

源码开发安装：

```bash
git clone https://github.com/<owner>/need-a-hug ~/.claude/plugins/need-a-hug
```

手动 skill 安装：

```bash
mkdir -p ~/.claude/skills/need-a-hug
cp -R skills/need-a-hug/. ~/.claude/skills/need-a-hug/
```

可选 Claude Code hooks 在：

```text
hooks/hooks.json
```

这些 hook 只做三件事：识别明显情绪触发、从 `~/.need-a-hug/memory.md` 安静恢复一点记忆、在 compact 前保留短上下文。它们不联网。

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

可选 prompt 命令：

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

项目级 rule：

```bash
mkdir -p .cursor/rules
curl -L -o .cursor/rules/need-a-hug.mdc \
  https://raw.githubusercontent.com/<owner>/need-a-hug/main/cursor/rules/need-a-hug.mdc
```

### Kiro

Steering 文件：

```bash
mkdir -p .kiro/steering
curl -L -o .kiro/steering/need-a-hug.md \
  https://raw.githubusercontent.com/<owner>/need-a-hug/main/kiro/steering/need-a-hug.md
```

AgentSkill 格式：

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

如果要带完整语料和参考文件，复制整个目录：

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

项目 instruction 文件：

```bash
mkdir -p .github/instructions
curl -L -o .github/instructions/need-a-hug.instructions.md \
  https://raw.githubusercontent.com/<owner>/need-a-hug/main/vscode/instructions/need-a-hug.instructions.md
```

手动 prompt：

```bash
mkdir -p .github/prompts
curl -L -o .github/prompts/need-a-hug.prompt.md \
  https://raw.githubusercontent.com/<owner>/need-a-hug/main/vscode/prompts/need-a-hug.prompt.md
```

### 其他支持 AgentSkills 的工具

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

语气和偏好不做问卷。Agent 应该从后续对话里慢慢感知，而不是一开始就让用户填表。

退出：

```text
/hug:off
/back-to-work
回到任务
继续做事
别安慰了，直接解决问题
```

## 设计原则

首轮可以像拥抱：

```text
🫂 先抱抱你。
```

但后续不能每轮都重复这句话。后续要像一个人真的在听你说话。

默认先安慰，不要一上来问：

```text
你想要安慰还是建议？
```

这会给用户增加选择压力。更好的方式是：

```text
我们先不急着做决定。等你缓一点，如果你愿意，我们再一起看下一步。
```

## 安全边界

这个 Skill 不是治疗、诊断、医疗建议或紧急服务。

如果用户提到自伤、自杀、即时危险、虐待、医疗紧急情况，Agent 应优先建议联系当地紧急服务、身边可信任的人，或使用与用户明确提供的国家/地区匹配的危机帮助资源。如果不知道用户所在地，不应该直接写死某个国家的热线。

普通的疲惫、burnout、后悔、难过或失眠，不应该突然提危机热线，除非用户明确表达自伤或即时危险。

## 为什么可以放心检查

核心 `need-a-hug` skill 是纯文本：

- 没有脚本
- 不执行命令
- 不联网
- 不收集数据
- 不读隐私文件

Claude Code plugin 形式额外带了可选 hook。它们是很小的 shell 脚本，只输出 prompt 上下文，并且只在 `~/.need-a-hug/memory.md` 或 `~/.need-a-hug/session.md` 存在时读取这两个文件。它们不联网，也不做统计。

你可以直接读完整内容：

```text
skills/need-a-hug/SKILL.md
```

## License

MIT
