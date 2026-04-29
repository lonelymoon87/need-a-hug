# need-a-hug

> Sometimes you just need a hug.
>
> 抱抱一下吧，我只关心你累不累。

[中文说明](README.zh-CN.md)

`need-a-hug` is a lightweight AgentSkill for the moments when a person does not need another checklist yet.

It helps an agent notice distress, stop pushing the task forward, and answer with warmth first. Then, when the user is steadier, the agent can return with one smaller next step.

![A short emotional shift demo: user feels exhausted and self-critical, agent comforts first, then returns gently.](assets/emotion-shift.gif)

## The Moment It Is For

Most agents keep solving while the person is already overwhelmed.

They offer another plan, another list, another way to optimize the work. But sometimes the message underneath is quieter:

```text
I am so tired.
I keep trying, but nothing seems to get lighter.
Maybe I am just not built for this.
```

In that moment, the useful response is not to rush into strategy.

It is to slow down, name the hurt without making it dramatic, reduce shame, and stay close enough that the user can breathe again.

Common moments look like:

- "I am tired and I do not know how to explain it."
- "I keep thinking about the same thing and cannot calm down."
- "I do not want advice yet. I just need someone to hear me."
- "I feel alone, even though nothing dramatic happened."
- "I know I should do the next step, but I cannot make myself start."
- "The AI keeps answering like a workflow, and that makes me feel worse."

This skill is not trying to out-search the web for better advice. Its job is to make the agent stay with the person for a few turns, so the user feels heard before anything turns back into tasks.

## What The Agent Learns To Do

- Start with comfort, not a plan.
- Reflect the specific pain in the user's own words.
- Stay with hard feelings long enough for the user to feel less alone.
- Keep the user's dignity intact when they start blaming themselves.
- Return to the task gently when the user is ready.

It is not therapy or medical care. It is a small emotional first-aid layer for the moments when an agent should stop optimizing the task and start caring for the person.

## Example

User:

```text
I am exhausted.
I keep doing what I am supposed to do,
but everything still feels heavy.
Maybe I am just not strong enough for this.
```

Agent with `need-a-hug`:

```text
That sounds really heavy.

Not dramatic. Just heavy in the way things get when you have been carrying too much for too long.

I do not want to rush you into a plan while you are this tired. And I do not want "I am not strong enough" to become the only explanation. Sometimes a person is not weak. Sometimes they have just been running on empty for too long.

You can tell me a little about what has been weighing on you, if you want. You can also just stay here for a minute. We will go slowly.
```

## When It Triggers

Manual triggers:

```text
/hug
/need-a-hug
need a hug
comfort me
encourage me
抱抱我
安慰我一下
鼓励我一下
我撑不住了
```

It can also activate from clear emotional signals: shame, panic, burnout, loneliness, regret, grief, self-criticism, exhaustion, or a user saying they feel like they are falling apart.

## Optional Personalization

```text
/hug:init
```

```text
What should I call you?

It is okay if you would rather not say. We can keep going.
```

Over time, the agent can remember small things you choose to share, like what name feels right or what usually helps you feel steadier.

## Exit

```text
/hug:off
/back-to-work
back to the task
回到任务
继续做事
别安慰了，直接解决问题
```

When work resumes, the agent should not snap back into pressure. It should continue with a smaller, calmer step.

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
claude plugin marketplace add lonelymoon87/need-a-hug
claude plugin install need-a-hug@need-a-hug-skills
```

Developer install from source:

```bash
git clone https://github.com/lonelymoon87/need-a-hug ~/.claude/plugins/need-a-hug
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
  https://raw.githubusercontent.com/lonelymoon87/need-a-hug/main/skills/need-a-hug/SKILL.md
mkdir -p ~/.codex/skills/need-a-hug/references
curl -L -o ~/.codex/skills/need-a-hug/references/comfort-language-corpus.md \
  https://raw.githubusercontent.com/lonelymoon87/need-a-hug/main/skills/need-a-hug/references/comfort-language-corpus.md
curl -L -o ~/.codex/skills/need-a-hug/references/counseling-lite-patterns.md \
  https://raw.githubusercontent.com/lonelymoon87/need-a-hug/main/skills/need-a-hug/references/counseling-lite-patterns.md
curl -L -o ~/.codex/skills/need-a-hug/references/memory-template.md \
  https://raw.githubusercontent.com/lonelymoon87/need-a-hug/main/skills/need-a-hug/references/memory-template.md
```

Optional prompt commands:

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
  https://raw.githubusercontent.com/lonelymoon87/need-a-hug/main/cursor/rules/need-a-hug.mdc
```

### Kiro

Steering file:

```bash
mkdir -p .kiro/steering
curl -L -o .kiro/steering/need-a-hug.md \
  https://raw.githubusercontent.com/lonelymoon87/need-a-hug/main/kiro/steering/need-a-hug.md
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
  https://raw.githubusercontent.com/lonelymoon87/need-a-hug/main/skills/need-a-hug/SKILL.md
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
  https://raw.githubusercontent.com/lonelymoon87/need-a-hug/main/vscode/instructions/need-a-hug.instructions.md
```

Manual prompt:

```bash
mkdir -p .github/prompts
curl -L -o .github/prompts/need-a-hug.prompt.md \
  https://raw.githubusercontent.com/lonelymoon87/need-a-hug/main/vscode/prompts/need-a-hug.prompt.md
```

### Other AgentSkill-Compatible Tools

Any tool that supports the AgentSkills `SKILL.md` format can use the core skill:

```text
skills/need-a-hug/SKILL.md
```

Copy the whole `skills/need-a-hug/` directory into that tool's skill directory.

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
