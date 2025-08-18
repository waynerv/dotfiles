---
allowed-tools: Bash(git add:*), Bash(git status:*), Bash(git commit:*)
description: Create a git commit with ultrathink code review
---

## Context

- Current git status: !`git status`
- Current git diff (staged and unstaged changes): !`git diff HEAD`
- Current branch: !`git branch --show-current`
- Recent commits: !`git log --oneline -10`

## Your task

- If 0 files are staged, automatically adds all modified and new files with `git add`.
- Based on the above changes, ultrathink to review those code for performance, maintainability and quality, create a single git commit.
- Exclude file types listed in @.gitignore and dependencies under the @vendor/ directory during review.
- Write review to commit message body, use #$ARGUMENTS as subject line of commit message if provided.
- Append all user inputs of current session to commit message body as is in ordered list format.
- Do NOT add Claude co-authorship footer to commit message.
- Write commit message in Chinese except for user inputs.
