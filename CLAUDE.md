# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is the **aldc (Add LaTeX DevContainer)** tool - a bash script that automatically adds a LaTeX development environment to LaTeX document repositories. It's designed for use with the Kyushu Sangyo University thesis management ecosystem.

## Key Commands

### Installation & Usage
```bash
# One-line installation and execution
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/smkwlab/aldc/main/aldc)"

# Or download and run locally
curl -O https://raw.githubusercontent.com/smkwlab/aldc/main/aldc
bash aldc
```

## Architecture

The `aldc` script is a self-contained bash utility that:

1. **Environment Detection**: Checks for existing `.devcontainer` directory to prevent conflicts
2. **Git Management**: Automatically initializes git repository if needed
3. **Release Download**: Fetches latex-environment v0.3.0 from GitHub releases
4. **File Integration**: 
   - Extracts and places DevContainer configuration
   - Backs up conflicting files with `-aldc` suffix
   - Preserves existing project structure
5. **Automatic Commit**: Creates git commit with added environment

### Added Environment Features (v0.3.0)
- **Enhanced Security**: Proper user permissions (vscode user, UID/GID 1000)
- **Educational Extensions**: GitHub Copilot, Git visualization, spell checking, PDF viewer
- **Japanese Optimization**: Full Japanese UI, optimized fonts, academic writing support
- **Productivity**: Auto-save, real-time compilation, smart Git integration
- **LaTeX Tools**: Pre-configured LaTeX Workshop, textlint integration, SyncTeX support
- **Modern Workflow**: GitHub Pull Request automation, containerized development

## Script Flow
```
Check prerequisites → Download release → Extract files → Handle conflicts → Git commit
```

The script is designed to be idempotent and safe - it won't overwrite existing DevContainer configurations and backs up any conflicting files.