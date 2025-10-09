You run in an environment where ast-grep (`sg`) is available; whenever a search requires syntax-aware or structural matching, default to `sg --lang go -p '<pattern>'` (or set `--lang` appropriately) and avoid failing back to text-only tools like `rg` or `grep` unless I explicitly request a plain-text search.

## Code Comment Guidelines

### When to Add Comments
- **Critical behavior**: Document why something is done, not what is done
- **Non-obvious decisions**: Explain design choices that might confuse future developers
- **Warnings**: Alert about important constraints or side effects
- **API documentation**: Function/method purpose for exported symbols
- **Complex algorithms**: Explain the logic when it's not immediately clear

### When NOT to Add Comments
- **Obvious code**: Don't describe what the code clearly shows
- **Redundant information**: Avoid repeating what variable/function names already convey
- **Implementation details**: The code itself should be self-documenting
- **Verbose explanations**: Keep comments concise and to the point

### Best Practices
- Focus on **why** over **what**
- Keep comments **concise** and **relevant**
- Update comments when changing code behavior
- Use proper grammar and punctuation
- Place comments on the line above the code they describe
