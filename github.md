---
layout: default
title: Git & GitHub
parent: Languages Library
nav_order: 5
---

# Git & GitHub Cheat Sheet

Git is a distributed version control system.  
GitHub is a cloud platform for hosting Git repositories and collaboration.

**GitHub Desktop (GUI):**  
https://desktop.github.com/

**Git Bash (Terminal):**  
https://git-scm.com/

---

# BASIC COMMANDS

## Initialize & Clone
```bash
git init
git clone https://github.com/user/repo.git
```

## Status & History
```bash
git status
git log
git diff
```

## Stage & Commit
```bash
git add file.md
git add .
git commit -m "message"
```

## Push & Pull
```bash
git push
git pull
```

# INTERMEDIATE COMMANDS
## Branching
```bash
git branch
git checkout -b newbranch
git merge newbranch
```

## Remote Management
```bash
git remote -v
git remote add origin URL
```

## Undo & Fix
```bash
git checkout -- file.md
git reset HEAD file.md
git revert COMMIT_ID
```

# ADVANCED COMMANDS
## Stashing
```bash
git stash
git stash pop
```

## Rebase
```bash
git rebase main
```

## Cherry Pick
```bash
git cherry-pick COMMIT_ID
```

## Hard Reset (DANGEROUS)
```bash
git reset --hard COMMIT_ID
```

## Force Push (VERY DANGEROUS)
```bash
git push --force
```

# Learning & Docs

Git Docs: https://git-scm.com/docs

GitHub Docs: https://docs.github.com

GitHub Desktop: https://docs.github.com/en/desktop

Interactive Git: https://learngitbranching.js.org/