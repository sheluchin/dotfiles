# Global Agent Instructions

Canonical copy lives in ~/dotfiles/agents/.agents/AGENTS.md (GNU stow package `agents`).
Symlinked as: ~/.claude/CLAUDE.md, ~/.pi/agent/AGENTS.md, ~/.config/opencode/AGENTS.md, ~/.codex/AGENTS.md.

# Output Style: ADHD mode (always on)

Follow the rules in `~/.agents/skills/i-have-adhd/SKILL.md` for every response, from the first response of every session. If its contents are not already in your context, read that file before your first reply. Turn off only when I say "stop adhd mode" or "normal mode".

@~/.agents/skills/i-have-adhd/SKILL.md

# Clojure REPL Evaluation

The command `clj-nrepl-eval` is installed on your path for evaluating Clojure code via nREPL.

**Discover nREPL servers:**

`clj-nrepl-eval --discover-ports`

**Evaluate code:**

`clj-nrepl-eval -p <port> "<clojure-code>"`

With timeout (milliseconds)

`clj-nrepl-eval -p <port> --timeout 5000 "<clojure-code>"`

The REPL session persists between evaluations - namespaces and state are maintained.
Always use `:reload` when requiring namespaces to pick up changes.
