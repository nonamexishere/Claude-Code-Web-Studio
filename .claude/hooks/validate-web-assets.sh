#!/usr/bin/env bash
# Validates web assets after Write/Edit operations
# Checks for common web development mistakes

FILE_PATH="$CLAUDE_FILE_PATH"

if [ -z "$FILE_PATH" ]; then
  exit 0
fi

# Check for hardcoded secrets in source files
if echo "$FILE_PATH" | grep -qE "\.(js|ts|jsx|tsx|py|env)$"; then
  if grep -qE "(password|secret|api_key|apikey|token)\s*[:=]\s*['\"][^'\"]{8,}" "$FILE_PATH" 2>/dev/null; then
    # Exclude .env.example and test files
    if ! echo "$FILE_PATH" | grep -qE "(\.example|\.test\.|\.spec\.|__test__|__mock__)"; then
      echo "WARNING: Possible hardcoded secret detected in $FILE_PATH"
      echo "Use environment variables instead."
    fi
  fi
fi

# Check for console.log in production code
if echo "$FILE_PATH" | grep -qE "\.(ts|tsx|js|jsx)$"; then
  if ! echo "$FILE_PATH" | grep -qE "(\.test\.|\.spec\.|__test__)"; then
    COUNT=$(grep -c "console\.log" "$FILE_PATH" 2>/dev/null || echo "0")
    if [ "$COUNT" -gt 3 ]; then
      echo "NOTE: $COUNT console.log statements in $FILE_PATH — clean up before production."
    fi
  fi
fi

exit 0
