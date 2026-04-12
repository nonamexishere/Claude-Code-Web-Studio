#!/usr/bin/env bash
# Validates commit messages follow conventional commit format
# Runs as a PreToolUse hook on Bash commands

TOOL_INPUT="$CLAUDE_TOOL_INPUT"

# Only check git commit commands
if ! echo "$TOOL_INPUT" | grep -q "git commit"; then
  exit 0
fi

# Extract commit message
MSG=$(echo "$TOOL_INPUT" | grep -oP '(?<=-m ")[^"]+' || echo "$TOOL_INPUT" | grep -oP "(?<=-m ')[^']+")

if [ -z "$MSG" ]; then
  exit 0
fi

# Check conventional commit format
if ! echo "$MSG" | grep -qE "^(feat|fix|refactor|docs|test|chore|style|perf|ci|build|revert)(\(.+\))?: .+"; then
  echo "BLOCK: Commit message must follow conventional commits format."
  echo "Format: type(scope): description"
  echo "Types: feat, fix, refactor, docs, test, chore, style, perf, ci, build, revert"
  echo "Example: feat(auth): add JWT refresh token rotation"
  exit 1
fi

exit 0
