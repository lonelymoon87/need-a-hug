# need-a-hug

> 抱抱一下吧，我只关心你累不累。

`need-a-hug` 是一个很轻的 AgentSkill。它不是让 Agent 多做一个功能，而是让 Agent 在你已经很累、很难受、很自责的时候，先别急着继续解决问题。

有时候你不需要另一个计划。

你只是想有人好好陪一下。

![一段很短的情绪变化演示：用户很累、开始怀疑自己，Agent 先安慰，再轻轻回到下一步。](assets/emotion-shift.gif)

## 它适合的时刻

很多 Agent 在你最难受的时候，还会继续输出：

- 下一步计划
- 检查清单
- 执行建议
- “你可以试试...”
- “我们来分析一下...”

但你心里真正冒出来的，可能是：

```text
我最近真的好累。
明明一直在撑，但好像什么都没有变好。
是不是我就是不够好。
```

这个时候，马上复盘、马上规划、马上讲道理，通常都太早了。

更有用的是先慢下来，把那种刺痛、自责、委屈或者疲惫说清楚一点，让它不要立刻变成一句“我这个人不行”。

更常见的场景其实是这些：

- “我很累，但我也说不清楚为什么。”
- “脑子一直在想同一件事，停不下来。”
- “我现在还不想听建议，只想先有人听我说。”
- “明明也没发生什么大事，但就是觉得很孤单。”
- “我知道应该做下一步，可就是动不了。”
- “AI 一直像流程一样回复，反而让我更难受。”

这个 skill 不是为了给出比搜索更聪明的建议。它真正要做的是让 Agent 多陪你几轮，先把你听见，而不是马上把你推回任务里。

## 它会让 Agent 怎么变

- 先安慰，不急着给方案
- 听你真正难受的地方，而不是套进某个固定问题
- 不把一个困难时刻上升成对你整个人的判断
- 允许难过、生气、疲惫、羞耻先存在一会儿
- 避免一上来就给编号选项、行动菜单，或者让你“挑一个”
- 如果刚好是 Agent 或 AI 工具把你弄崩了，它会先放慢自己的动作
- 如果你明确保存过一些上下文，它可以轻轻用一下，但不会把你贴成某种标签
- 回到任务时，只给一个更小、更稳的下一步
- 跟随你的语言，不会因为示例里有别的语言就突然切换

它不是心理咨询工具，也不能替代专业帮助。它只是一个很小的情绪急救层：当 Agent 应该先关心人，而不是继续优化任务时，它提醒 Agent 慢下来。

## 示例

你：

```text
我最近真的很累。
明明也在努力，工作和生活却都没有明显变好。
有时候会觉得，是不是我就是不够好。
```

Agent：

```text
这听起来真的很累。

不是那种睡一觉就一定能好的累，而是撑了很久、一直没有被好好看见的累。人到这种时候，很容易把所有事情都往自己身上收，最后变成一句：是不是我不够好。

我想先替你把这句话放轻一点。你现在很累，不等于你很差。你没有立刻变好，也不等于你没有在努力。

你可以先说一点，最近最压着你的是什么。也可以先不说，就在这里缓一会儿。我们不急着把整个人生都想明白。
```

## 怎么触发

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

它也会尽量感知明显的情绪信号，比如自责、崩溃、孤独、后悔、长期疲惫、很强的比较感，或者你说自己快撑不住了。

## 可选初始化

```text
/hug:init
```

它只会问一个问题：

```text
以后我可以怎么称呼你？

不想说也没关系，我们直接继续。
```

不会一开始就让你填一堆偏好，不问国家地区，也不做心理咨询式问卷。称呼之外的东西，Agent 应该从后面的对话里慢慢感知。

如果你明确保存过一点安慰相关的记忆，Agent 可以轻轻提一句：

```text
我记得你之前说过，累到一定程度时，很容易把事情都变成“是不是我不够好”。现在是不是有一点像那种感觉？
```

如果证据不够强，它就不应该硬猜。

## 退出

```text
/hug:off
/back-to-work
回到任务
继续做事
别安慰了，直接解决问题
```

回到任务以后，Agent 也不应该突然恢复成高压推进。它应该继续小一点、慢一点、稳一点。

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
claude plugin marketplace add lonelymoon87/need-a-hug
claude plugin install need-a-hug@need-a-hug-skills
```

源码开发安装：

```bash
git clone https://github.com/lonelymoon87/need-a-hug ~/.claude/plugins/need-a-hug
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
  https://raw.githubusercontent.com/lonelymoon87/need-a-hug/main/skills/need-a-hug/SKILL.md
mkdir -p ~/.codex/skills/need-a-hug/references
curl -L -o ~/.codex/skills/need-a-hug/references/comfort-language-corpus.md \
  https://raw.githubusercontent.com/lonelymoon87/need-a-hug/main/skills/need-a-hug/references/comfort-language-corpus.md
curl -L -o ~/.codex/skills/need-a-hug/references/counseling-lite-patterns.md \
  https://raw.githubusercontent.com/lonelymoon87/need-a-hug/main/skills/need-a-hug/references/counseling-lite-patterns.md
curl -L -o ~/.codex/skills/need-a-hug/references/memory-template.md \
  https://raw.githubusercontent.com/lonelymoon87/need-a-hug/main/skills/need-a-hug/references/memory-template.md
```

也可以安装几个快捷命令：

```bash
mkdir -p ~/.codex/prompts
curl -L -o ~/.codex/prompts/hug.md \
  https://raw.githubusercontent.com/lonelymoon87/need-a-hug/main/commands/hug.md
curl -L -o ~/.codex/prompts/need-a-hug.md \
  https://raw.githubusercontent.com/lonelymoon87/need-a-hug/main/commands/need-a-hug.md
curl -L -o ~/.codex/prompts/hug-init.md \
  https://raw.githubusercontent.com/lonelymoon87/need-a-hug/main/commands/hug-init.md
curl -L -o ~/.codex/prompts/back-to-work.md \
  https://raw.githubusercontent.com/lonelymoon87/need-a-hug/main/commands/back-to-work.md
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
  https://raw.githubusercontent.com/lonelymoon87/need-a-hug/main/cursor/rules/need-a-hug.mdc
```

### Kiro

加一个 steering 配置：

```bash
mkdir -p .kiro/steering
curl -L -o .kiro/steering/need-a-hug.md \
  https://raw.githubusercontent.com/lonelymoon87/need-a-hug/main/kiro/steering/need-a-hug.md
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
  https://raw.githubusercontent.com/lonelymoon87/need-a-hug/main/skills/need-a-hug/SKILL.md
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
  https://raw.githubusercontent.com/lonelymoon87/need-a-hug/main/vscode/instructions/need-a-hug.instructions.md
```

再加一个手动 prompt：

```bash
mkdir -p .github/prompts
curl -L -o .github/prompts/need-a-hug.prompt.md \
  https://raw.githubusercontent.com/lonelymoon87/need-a-hug/main/vscode/prompts/need-a-hug.prompt.md
```

### 其他支持 AgentSkill 的工具

把整个目录复制过去即可：

```text
skills/need-a-hug/
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
