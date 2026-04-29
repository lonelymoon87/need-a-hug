# Install need-a-hug for Codex

Recommended source install:

```bash
git clone https://github.com/<owner>/need-a-hug ~/.need-a-hug-src
mkdir -p ~/.codex/skills
ln -sfn ~/.need-a-hug-src/skills/need-a-hug ~/.codex/skills/need-a-hug
mkdir -p ~/.codex/prompts
ln -sfn ~/.need-a-hug-src/commands/hug.md ~/.codex/prompts/hug.md
ln -sfn ~/.need-a-hug-src/commands/need-a-hug.md ~/.codex/prompts/need-a-hug.md
ln -sfn ~/.need-a-hug-src/commands/hug-init.md ~/.codex/prompts/hug-init.md
ln -sfn ~/.need-a-hug-src/commands/back-to-work.md ~/.codex/prompts/back-to-work.md
```

Update:

```bash
git -C ~/.need-a-hug-src pull
```

Restart Codex after installing or updating.
