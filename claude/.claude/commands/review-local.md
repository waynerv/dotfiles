---
allowed-tools: Bash(git status:*), Bash(git log:*), Bash(git diff:*)
description: Review recent changes with code-reviewer subagent
---
 
## Context
 
- Current git status: !`git status`
- Recent commits: !`git log --oneline -10`
- Last commit changes: !`git diff HEAD~1`
 
## Your task
 
- 使用 code-reviewer subagent 审查代码变更
- 仅审查当前分支变更过的文件
- 如果未发现任何文件变更，则审查最近一个 git 提交
