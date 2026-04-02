---
name: create-repo
description: Provision a new private GitHub repository from the clo-author template. Creates repo, clones template, sets remote, opens VS Code.
argument-hint: "[project-name] [--org organization-name]"
allowed-tools: Read,Bash
---

# Create Repo

Provision a new private GitHub repository for a research paper project using the clo-author template.

**Input:** `$ARGUMENTS` — project name, optionally with `--org` flag for a GitHub organization.

---

## What It Does

1. Creates a new private GitHub repository
2. Copies this template into a fresh local directory
3. Removes template git history and initializes a new repo
4. Sets the remote to the new private repo and pushes
5. Opens VS Code in the new project directory

## Usage

```
/create-repo conjoint-legitimacy
/create-repo vignette-moral-reasoning --org my-lab
```

## Implementation

Run the PowerShell provisioning script:

```powershell
powershell.exe -ExecutionPolicy Bypass -File scripts/New-ResearchProject.ps1 -Name "[project-name]"
```

If `--org` is specified:
```powershell
powershell.exe -ExecutionPolicy Bypass -File scripts/New-ResearchProject.ps1 -Name "[project-name]" -Org "[org-name]"
```

## Prerequisites

- `gh` CLI installed and authenticated
- `git` installed
- `code` (VS Code) in PATH

## After Creation

The new project will have all clo-author infrastructure. Next steps:
1. Fill in `CLAUDE.md` placeholders (project name, etc.)
2. If you skipped Zotero setup during provisioning, configure it now (see CLAUDE.md "Optional: Zotero Integration")
3. Run `/discover interview [topic]` to build the research specification
4. Or start directly with `/strategize [question]`

Note: The provisioning script prompts for optional Zotero integration (step 5/7). If configured, the librarian agent will search your Zotero library during literature review.

---

## Important

- This is DISTINCT from `/new-project`, which orchestrates the full research pipeline within an existing repo
- `/create-repo` provisions infrastructure; `/new-project` runs the research workflow
