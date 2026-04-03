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
Write-Host "`n[1/7] Creating private GitHub repository..." -ForegroundColor Yellow
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
Write-Host "[2/7] Copying template to $ProjectDir..." -ForegroundColor Yellow
Copy-Item -Path $TemplatePath -Destination $ProjectDir -Recurse -Force

# Remove template's git history
Remove-Item -Path (Join-Path $ProjectDir ".git") -Recurse -Force -ErrorAction SilentlyContinue

# Step 3: Initialize fresh git repo
Write-Host "[3/7] Initializing git repository..." -ForegroundColor Yellow
Push-Location $ProjectDir
& git init -b main
& git add -A
& git commit -m "Initial project from clo-author template"

# Step 4: Set remote and push
Write-Host "[4/7] Setting remote and pushing..." -ForegroundColor Yellow
if ($Org) {
    & git remote add origin "https://github.com/$Org/$Name.git"
} else {
    $ghUser = (& gh api user --jq '.login')
    & git remote add origin "https://github.com/$ghUser/$Name.git"
}
& git push -u origin main

# Step 5: Configure Zotero integration (optional)
Write-Host "`n[5/7] Configure Zotero integration?" -ForegroundColor Yellow
$configZotero = Read-Host "  Connect your Zotero library to Claude Code? (y/n)"
if ($configZotero -eq 'y') {
    # Check prerequisites
    $hasPip = Get-Command pip -ErrorAction SilentlyContinue
    $hasClaude = Get-Command claude -ErrorAction SilentlyContinue

    if (-not $hasPip) {
        Write-Warning "pip not found. Install zotero-mcp-server manually: pip install 'zotero-mcp-server[all]'"
    } elseif (-not $hasClaude) {
        Write-Warning "claude CLI not found. Install Claude Code first, then configure Zotero manually."
    } else {
        # Check if zotero-mcp is installed
        $zoteroMcp = Get-Command zotero-mcp -ErrorAction SilentlyContinue
        if (-not $zoteroMcp) {
            Write-Host "  Installing zotero-mcp-server..." -ForegroundColor Gray
            & pip install "zotero-mcp-server[all]"
        }

        # Prompt for credentials
        Write-Host "  Get your API key from https://www.zotero.org/settings/keys" -ForegroundColor Gray
        $apiKey = Read-Host "  Zotero API key" -AsSecureString
        $apiKeyPlain = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
            [Runtime.InteropServices.Marshal]::SecureStringToBSTR($apiKey))
        $libraryId = Read-Host "  Zotero library ID"

        if ($apiKeyPlain -and $libraryId) {
            Write-Host "  Registering Zotero MCP server..." -ForegroundColor Gray
            & claude mcp add -t stdio -s project zotero `
                -e "ZOTERO_LOCAL=true" `
                -e "ZOTERO_API_KEY=$apiKeyPlain" `
                -e "ZOTERO_LIBRARY_ID=$libraryId" `
                -- zotero-mcp serve

            if ($LASTEXITCODE -eq 0) {
                Write-Host "  Zotero integration configured successfully." -ForegroundColor Green
            } else {
                Write-Warning "  Zotero MCP registration failed. You can configure it manually later (see CLAUDE.md)."
            }
        } else {
            Write-Warning "  Missing credentials. Skipping Zotero setup. You can configure it later (see CLAUDE.md)."
        }
    }
} else {
    Write-Host "  Skipped. You can configure Zotero later (see CLAUDE.md)." -ForegroundColor Gray
}

# Step 6: Open VS Code
Write-Host "`n[6/7] Opening VS Code..." -ForegroundColor Yellow
& code .
Pop-Location

Write-Host "`nDone! Project '$Name' is ready at $ProjectDir" -ForegroundColor Green
Write-Host "  GitHub: https://github.com/$( if ($Org) { "$Org/" } else { '' } )$Name" -ForegroundColor Gray
Write-Host "  Next: Fill in CLAUDE.md placeholders and run /discover interview" -ForegroundColor Gray
