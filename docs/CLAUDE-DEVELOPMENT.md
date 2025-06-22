# Development Guide

This document covers the development workflow, architecture, and technical details for aldc.

## Architecture

### Core Components
- **Bash Script**: Cross-platform installation logic
- **curl/unzip**: Download and extraction of latex-environment
- **Git Integration**: Automatic repository initialization and commit handling

### Environment Source
- **Source Repository**: smkwlab/latex-environment
- **Branch**: release (stable releases)
- **Installation Method**: Downloads ZIP, extracts, and integrates files

## Installation Process

### Process Flow
1. **Validation**: Checks if .devcontainer already exists
2. **Git Setup**: Initializes git repository if not present
3. **Download**: Fetches latex-environment from release branch
4. **Integration**: Merges environment files with existing project
5. **Backup**: Creates backups of conflicting files with `-aldc` suffix
6. **Cleanup**: Removes temporary files and commits changes

### File Integration Logic
- Non-conflicting files: Direct copy
- Conflicting files: Original backed up, new version installed
- Directory structure: Automatically created as needed
- Git history: Preserved with automatic commits

## Environment Features Added

### Development Environment
- **LaTeX Compilation**: Automatic PDF generation with latexmk
- **textlint Integration**: Real-time Japanese document proofreading
- **SyncTeX Support**: Bidirectional navigation between source and PDF
- **VS Code Extensions**: Pre-configured LaTeX development tools

### Automation Features
- **Pull Request PDF**: Automatic PDF generation on PR creation
- **Review Requests**: Automatic reviewer assignment
- **Quality Checks**: Integrated document quality validation

## Ecosystem Integration

### LaTeX Thesis Environment
This tool serves as an entry point to the broader LaTeX thesis environment ecosystem:

- **latex-environment**: Core development environment (source)
- **texlive-ja-textlint**: Underlying Docker image with LaTeX + textlint
- **sotsuron-template**: Target template for thesis development
- **wr-template**: Target template for weekly reports

### Dependency Chain
```
aldc (installation tool)
  ↓ downloads and integrates
latex-environment (DevContainer template)
  ↓ uses
texlive-ja-textlint (Docker base image)
```

## Configuration Details

### Default Settings
- **Repository**: smkwlab/latex-environment
- **Branch**: release (for stability)
- **Installation Location**: Current working directory
- **Backup Strategy**: Conflicts renamed with `-aldc` suffix

## Development Guidelines

### Script Maintenance
- Follow POSIX shell compatibility (sh/bash)
- Maintain cross-platform support (Linux/macOS/Windows with Git Bash)
- Ensure idempotent execution (safe to run multiple times)
- Provide clear error messages and status updates

### Error Handling
- Check for existing .devcontainer before installation
- Validate curl/unzip availability
- Handle network connectivity issues gracefully
- Provide rollback information for troubleshooting

## Platform Compatibility

### Supported Systems
- **Linux**: Native bash support
- **macOS**: Native bash support via Terminal
- **Windows**: Git Bash environment required

### Prerequisites
- Git (for repository management)
- curl (for downloading releases)
- unzip (for archive extraction)
- Internet connectivity (for latex-environment download)

## Security Considerations

- Downloads from official smkwlab repository only
- Uses HTTPS for all network communications
- No external dependencies beyond standard unix tools
- Repository verification through GitHub's infrastructure

## Security and Permission Guidelines

### 🚨 CRITICAL: GitHub Administration Rules

#### Git and GitHub Operations
- **NEVER use `--admin` flag** with `gh pr merge` or similar commands
- **NEVER bypass Branch Protection Rules** without explicit user permission
- **ALWAYS respect the configured workflow**: approval process, status checks, etc.

#### When Branch Protection Blocks Operations
1. **Report the situation** to user with specific error message
2. **Explain available options**:
   - Wait for required approvals
   - Wait for status checks to pass
   - Use `--auto` flag for automatic merge after requirements met
   - Request explicit permission for admin override (emergency only)
3. **Wait for user instruction** - never assume intent

#### Proper Error Handling Example
```bash
# When this fails:
gh pr merge 90 --squash --delete-branch
# Error: Pull request is not mergeable: the base branch policy prohibits the merge

# CORRECT response:
echo "Branch Protection Rules prevent merge. Options:"
echo "1. Wait for required approvals (currently need: 1)"
echo "2. Wait for status checks (currently pending: build-and-release-pdf)"
echo "3. Use --auto to merge automatically when requirements met"
echo "4. Request admin override (emergency only)"
echo "Please specify how to proceed."

# WRONG response:
gh pr merge 90 --squash --delete-branch --admin  # NEVER DO THIS
```

#### Emergency Admin Override
- Only use `--admin` flag when explicitly requested by user
- Document the reason for override in commit/PR description
- Report the action taken and why it was necessary

### Rationale
Branch Protection Rules exist to:
- Ensure code quality through required reviews
- Prevent accidental breaking changes
- Maintain audit trail of changes
- Enforce consistent development workflow

Bypassing these rules undermines repository security and development process integrity.