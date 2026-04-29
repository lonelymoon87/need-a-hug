# need-a-hug

> Sometimes you just need a hug.
>
> 抱抱一下吧，我只关心你累不累。

`need-a-hug` is a lightweight AgentSkill that turns your agent into a calm, warm comfort companion when the user is overwhelmed, ashamed, burned out, lonely, or frustrated with coding/AI work.

It is not an AI therapist. It is not a mental health product. It is a small emotional first-aid layer for the moments when an agent should stop optimizing the task and start caring for the person.

[中文说明](README.zh-CN.md)

## Why This Exists

Most agents keep solving while the user is struggling.

They give another checklist, another plan, another "next step" when the human on the other side may be thinking:

- "I am too slow."
- "I am not good enough."
- "This bug is destroying me."
- "AI keeps failing and now I feel worse."
- "I just need someone to comfort me for a minute."

`need-a-hug` teaches the agent to notice that moment and respond differently.

## Positioning

`need-a-hug` is for the moments when another checklist is not what the user needs.

It helps an agent notice emotional distress, slow down, reduce shame, and stay with the user before returning to the task.

## What It Does

- Detects explicit comfort requests: `/hug`, `/need-a-hug`, `need a hug`, `抱抱我`, `安慰我一下`.
- Detects distress signals: shame, panic, burnout, loneliness, regret, grief, self-criticism.
- Handles programmer-specific pain: bugs, AI frustration, imposter feelings, missed opportunities.
- Starts with comfort by default instead of asking the user to choose between comfort and advice.
- Uses counseling-inspired patterns as hidden scaffolding, while keeping the surface language natural and non-clinical.
- Avoids diagnosis, therapy claims, toxic positivity, and dependency-building.
- Switches to safety-first guidance for self-harm, suicide, imminent danger, abuse, or medical emergencies.

## Example

User:

```text
I found somebody else already created similar tools.
I have been working on this for a long time.
Now I feel sad. Why am I always behind?
```

Agent with `need-a-hug`:

```text
That hurts.

You worked on this for a long time, and seeing someone else already build something similar can make the whole effort suddenly feel late or wasted. It makes sense that your mind goes straight to "why am I always delayed?"

But try not to let this one painful moment become a sentence about who you are. Maybe there is regret here. Maybe there is a real lesson. But it still does not mean your work was pointless, or that you are always too late.

For now, we do not have to turn this into a plan. Let it be sad for a minute. When you feel a little steadier, we can look at what, if anything, is still yours to carry forward.
```

## Installation

### Platform Support

| Platform | Auto Trigger | Manual Trigger | Install Style |
| --- | --- | --- | --- |
| Claude Code | Yes | `/hug`, `$need-a-hug` | Plugin or skill directory |
| OpenAI Codex CLI | Yes | `$need-a-hug`, `/prompts:hug` | Skill directory + optional prompts |
| Cursor | Yes | Ask normally | `.cursor/rules/*.mdc` |
| Kiro | Yes | Ask normally | `.kiro/steering/*.md` or skill directory |
| CodeBuddy | Yes | Ask normally | Skill directory |
| OpenClaw | Yes | Ask normally | ClawHub or skill directory |
| Google Antigravity | Yes | Ask normally | Skill directory |
| OpenCode | Yes | Ask normally | Skill directory |
| VSCode Copilot | Yes | `/need-a-hug` prompt | Copilot instructions + prompt file |

The core source of truth is:

```text
skills/need-a-hug/
```

Platform-specific files are just adapters for the same behavior.

### Claude Code

Plugin install after publishing:

```bash
claude plugin marketplace add <owner>/need-a-hug
claude plugin install need-a-hug@need-a-hug-skills
```

Developer install from source:

```bash
git clone https://github.com/<owner>/need-a-hug ~/.claude/plugins/need-a-hug
```

Manual skill install:

```bash
mkdir -p ~/.claude/skills/need-a-hug
cp -R skills/need-a-hug/. ~/.claude/skills/need-a-hug/
```

Optional Claude Code hooks live in:

```text
hooks/hooks.json
```

They add emotion-aware activation, quiet memory restore from `~/.need-a-hug/memory.md`, and a checkpoint before conversation context gets compressed. They do not make network calls.

### OpenAI Codex CLI

Global install:

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

Optional prompt commands:

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

Project-level install:

```bash
mkdir -p .codex/skills/need-a-hug
cp -R skills/need-a-hug/. .codex/skills/need-a-hug/
```

Restart Codex after installing.

Trigger it with:

```text
$need-a-hug
/hug
need a hug
抱抱我
```

### Cursor

Project-level rule:

```bash
mkdir -p .cursor/rules
curl -L -o .cursor/rules/need-a-hug.mdc \
  https://raw.githubusercontent.com/<owner>/need-a-hug/main/cursor/rules/need-a-hug.mdc
```

### Kiro

Steering file:

```bash
mkdir -p .kiro/steering
curl -L -o .kiro/steering/need-a-hug.md \
  https://raw.githubusercontent.com/<owner>/need-a-hug/main/kiro/steering/need-a-hug.md
```

AgentSkill format:

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

Once published to ClawHub:

```bash
clawhub install need-a-hug
```

Manual install:

```bash
mkdir -p ~/.openclaw/skills/need-a-hug
curl -L -o ~/.openclaw/skills/need-a-hug/SKILL.md \
  https://raw.githubusercontent.com/<owner>/need-a-hug/main/skills/need-a-hug/SKILL.md
```

For the full language corpus, copy the whole directory:

```bash
cp -R skills/need-a-hug/. ~/.openclaw/skills/need-a-hug/
```

### Google Antigravity

```bash
mkdir -p ~/.gemini/antigravity/skills/need-a-hug
cp -R skills/need-a-hug/. ~/.gemini/antigravity/skills/need-a-hug/
```

Project-level install:

```bash
mkdir -p .agent/skills/need-a-hug
cp -R skills/need-a-hug/. .agent/skills/need-a-hug/
```

### OpenCode

```bash
mkdir -p ~/.config/opencode/skills/need-a-hug
cp -R skills/need-a-hug/. ~/.config/opencode/skills/need-a-hug/
```

Project-level install:

```bash
mkdir -p .opencode/skills/need-a-hug
cp -R skills/need-a-hug/. .opencode/skills/need-a-hug/
```

### VSCode Copilot

Project instruction file:

```bash
mkdir -p .github/instructions
curl -L -o .github/instructions/need-a-hug.instructions.md \
  https://raw.githubusercontent.com/<owner>/need-a-hug/main/vscode/instructions/need-a-hug.instructions.md
```

Manual prompt:

```bash
mkdir -p .github/prompts
curl -L -o .github/prompts/need-a-hug.prompt.md \
  https://raw.githubusercontent.com/<owner>/need-a-hug/main/vscode/prompts/need-a-hug.prompt.md
```

### Other AgentSkill-Compatible Tools

Any tool that supports the AgentSkills `SKILL.md` format can use the core skill:

```text
skills/need-a-hug/SKILL.md
```

Copy the whole `skills/need-a-hug/` directory into that tool's skill directory.

## Usage

### Manual Triggers

```text
/hug
/need-a-hug
need a hug
comfort me
抱抱我
安慰我一下
鼓励我一下
我撑不住了
```

### Optional Personalization

```text
/hug:init
```

This only asks for a preferred name:

```text
What should I call you?

You can skip this. The skill should learn tone and preferences naturally from conversation, not through a survey.
```

The skill must not infer your name from OS usernames, paths, Git config, emails, or account metadata.

Tone and preferences are learned softly from conversation. The skill should not make the user fill out a survey before it can be kind.

### Exit

```text
/hug:off
/back-to-work
回到任务
继续做事
别安慰了，直接解决问题
```

## Safety Boundary

This skill is not therapy, diagnosis, medical care, or emergency support.

If the user expresses self-harm, suicide, imminent danger, abuse, or a medical emergency, the agent should prioritize real-world help: local emergency services, a trusted person nearby, or crisis resources appropriate to the user's explicitly provided country/region. If location is unknown, it should not name country-specific services.

The skill should not mention crisis hotlines during ordinary exhaustion, burnout, regret, sadness, or insomnia unless the user signals self-harm or immediate danger.

## Why It Is Safe to Inspect

The core `need-a-hug` skill is text-only:

- no scripts
- no shell commands
- no network calls
- no hidden runtime
- no data collection

Optional Claude Code hooks are included for users who install the plugin form. They are small shell scripts that only emit prompt context and read `~/.need-a-hug/memory.md` or `~/.need-a-hug/session.md` when those files exist. They do not call the network or collect analytics.

Read the whole skill here:

```text
skills/need-a-hug/SKILL.md
```

## License

MIT
