<#
.SYNOPSIS
    Provisions a new private GitHub repository for a research paper project.

.DESCRIPTION
    Creates a new private GitHub repo, clones this template into a fresh local folder,
    sets the git remote to the new private repo, and opens VS Code.

.PARAMETER Name
    The name for the new project/repository (e.g., "force-experiment-2026").

.PARAMETER Org
    Optional GitHub organization. If omitted, creates under your personal account.

.PARAMETER TemplatePath
    Path to the clo-author template repo. Defaults to the directory containing this script's parent.

.EXAMPLE
    .\New-ResearchProject.ps1 -Name "conjoint-legitimacy"
    .\New-ResearchProject.ps1 -Name "vignette-moral-reasoning" -Org "my-lab"
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$Name,

    [Parameter(Mandatory = $false)]
    [string]$Org,

    [Parameter(Mandatory = $false)]
    [string]$TemplatePath = (Split-Path -Parent (Split-Path -Parent $PSScriptRoot)),

    [Parameter(Mandatory = $false)]
    [string]$ParentDir = (Get-Location).Path
)

$ErrorActionPreference = "Stop"

# Validate prerequisites
foreach ($cmd in @("gh", "git", "code")) {
    if (-not (Get-Command $cmd -ErrorAction SilentlyContinue)) {
        Write-Error "$cmd is not installed or not in PATH. Please install it first."
        exit 1
    }
}

$ProjectDir = Join-Path $ParentDir $Name

# Check if directory already exists
if (Test-Path $ProjectDir) {
    Write-Error "Directory '$ProjectDir' already exists. Choose a different name or remove it first."
    exit 1
}

Write-Host "Creating new research project: $Name" -ForegroundColor Cyan
Write-Host "  Template: $TemplatePath" -ForegroundColor Gray
Write-Host "  Target:   $ProjectDir" -ForegroundColor Gray

# Step 1: Create private GitHub repo
Write-Host "`n[1/5] Creating private GitHub repository..." -ForegroundColor Yellow
$repoArgs = @("repo", "create", $Name, "--private", "--confirm")
if ($Org) {
    $repoArgs = @("repo", "create", "$Org/$Name", "--private", "--confirm")
}
& gh @repoArgs
if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to create GitHub repository."
    exit 1
}

# Step 2: Clone template (without git history)
Write-Host "[2/5] Copying template to $ProjectDir..." -ForegroundColor Yellow
Copy-Item -Path $TemplatePath -Destination $ProjectDir -Recurse -Force

# Remove template's git history
Remove-Item -Path (Join-Path $ProjectDir ".git") -Recurse -Force -ErrorAction SilentlyContinue

# Step 3: Initialize fresh git repo
Write-Host "[3/5] Initializing git repository..." -ForegroundColor Yellow
Push-Location $ProjectDir
& git init -b main
& git add -A
& git commit -m "Initial project from clo-author template"

# Step 4: Set remote and push
Write-Host "[4/5] Setting remote and pushing..." -ForegroundColor Yellow
if ($Org) {
    & git remote add origin "https://github.com/$Org/$Name.git"
} else {
    $ghUser = (& gh api user --jq '.login')
    & git remote add origin "https://github.com/$ghUser/$Name.git"
}
& git push -u origin main

# Step 5: Open VS Code
Write-Host "`n[5/5] Opening VS Code..." -ForegroundColor Yellow
& code .
Pop-Location

Write-Host "`nDone! Project '$Name' is ready at $ProjectDir" -ForegroundColor Green
Write-Host "  GitHub: https://github.com/$( if ($Org) { "$Org/" } else { '' } )$Name" -ForegroundColor Gray
Write-Host "  Next: Fill in CLAUDE.md placeholders and run /discover interview" -ForegroundColor Gray
