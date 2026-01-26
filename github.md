---
layout: default
title: GitHub
parent: Languages Library
nav_order: 5
---

# Git & GitHub

Git is a **distributed version control system** used to track changes in source code during software development.  
GitHub is a **cloud-based platform** built on Git that enables collaboration, hosting, and integration with CI/CD workflows.

---

## Git Syntax Overview

Git is a **command-line tool** that manages repositories, branches, commits, and merges.  
GitHub extends Git with **remote hosting**, **pull requests**, and **issue tracking**.

Unlike Python, which is imperative and object-oriented, Git is **declarative in intent** but executed through **commands** that manipulate repository states.

---

## Git Language Building Blocks

| Type | Examples | Role / Purpose |
|------|----------|----------------|
| Commands | `git init`, `git add`, `git commit`, `git push`, `git pull` | Core actions to manage repositories and versions. |
| Objects | Commit, Tree, Blob, Tag | Internal representations of data in Git. |
| Branches | `main`, `feature/login` | Parallel lines of development. |
| Remote | `origin`, `upstream` | References to remote repositories. |
| Config | `git config --global user.name "Name"` | Define user and environment settings. |
| Operators | `--force`, `--amend`, `--hard` | Modify behavior of commands. |
| Control Flow | Merge, Rebase, Checkout | Control how changes integrate and move across branches. |
| Index (Staging Area) | `git add file.py` | Prepares changes for commit. |
| Assignment | `git remote add origin <URL>` | Bind repository to remote. |
| Keywords | `HEAD`, `master`, `main` | Special pointers in Git. |

---

## Conceptual Structure of a Git Workflow

- **Repository**
  - **Working Directory** — Your files.
  - **Staging Area** — Prepared changes.
  - **Local Repository** — Commits stored locally.
  - **Remote Repository** — Hosted on GitHub.

- **Core Actions**
  - Initialize — `git init`
  - Stage — `git add`
  - Commit — `git commit -m "message"`
  - Push — `git push origin main`
  - Pull — `git pull origin main`

- **Branching**
  - Create — `git branch feature`
  - Switch — `git checkout feature`
  - Merge — `git merge feature`

- **History**
  - View — `git log`
  - Diff — `git diff`

---

## GitHub Workflow Essentials

- **Clone repository:** `git clone <URL>`
- **Create pull request:** Done via GitHub UI.
- **Fork repository:** Duplicate for independent work.
- **Issues & Discussions:** Track bugs and features.
- **Actions:** Automate CI/CD.

---

## Key Git Syntax Rules to Remember

**Commit Messages**
- Use clear, descriptive messages: `git commit -m "Add login feature"`

**Branch Naming**
- Use meaningful names: `feature/auth`, `bugfix/ui`

**HEAD**
- Represents the current branch reference.

**Remote Tracking**
- Always set upstream: `git push --set-upstream origin feature`

**Safety**
- Avoid `--force` unless necessary.
- Use `git status` frequently to check state.

---


---

# Git Bash: Basic Commands

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

# Git Bash: Intermediate Commands
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

# Git Bash: Advanced Commands
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