# Troubleshooting Guide

This document provides troubleshooting information for common issues with aldc installation.

## Common Issues and Solutions

### Permission Issues
- Ensure write permissions in target directory
- Run with appropriate user privileges (avoid root when possible)

### Network Issues
- Verify internet connectivity and GitHub access
- Check corporate firewall/proxy settings
- Consider manual download if automated fails

### Existing Environment Conflicts
- Review `-aldc` backup files for important customizations
- Manual merge may be required for complex configurations
- Consider fresh installation in new directory if conflicts are extensive

## Installation Safety

### Backup Creation
- **Automatic Backup**: Conflicting files automatically backed up with `-aldc` suffix
- **Git Integration**: Changes committed to preserve history
- **Idempotent**: Safe to run multiple times (exits if already installed)
- **Rollback**: Manual rollback possible using backup files

### Post-Installation Requirements
- **VS Code Required**: DevContainer setup requires VS Code with DevContainer extension
- **Docker Required**: Underlying environment runs in Docker containers
- **First Launch**: Initial container build may take several minutes

## Debug Commands

### Check Prerequisites
```bash
# Check git availability
git --version

# Check curl availability
curl --version

# Check unzip availability
unzip -v

# Check internet connectivity
curl -I https://github.com/smkwlab/latex-environment
```

### Verify Installation
```bash
# Check if .devcontainer exists
ls -la .devcontainer/

# Check DevContainer configuration
cat .devcontainer/devcontainer.json

# Check for backup files
ls -la *-aldc 2>/dev/null || echo "No backup files found"
```

### Manual Recovery
```bash
# View git history
git log --oneline -10

# Restore from backup files (if needed)
for backup in *-aldc; do
    original="${backup%-aldc}"
    echo "Consider restoring: $backup -> $original"
done
```

## Installation Process Debugging

### Step-by-Step Verification
1. **Environment Check**: Verify prerequisites are installed
2. **Network Check**: Test GitHub connectivity
3. **Directory Check**: Confirm write permissions
4. **Git Check**: Verify git repository status
5. **Download Check**: Test latex-environment availability

### Common Error Messages

#### "Command not found: curl"
- Install curl: `sudo apt install curl` (Ubuntu) or `brew install curl` (macOS)

#### "Command not found: unzip"
- Install unzip: `sudo apt install unzip` (Ubuntu) or `brew install unzip` (macOS)

#### "Permission denied"
- Check directory permissions: `ls -la`
- Ensure you have write access to the current directory

#### "Already exists: .devcontainer"
- aldc exits safely if .devcontainer already exists
- Use `--force` flag (if implemented) or remove existing .devcontainer manually

#### "Failed to download latex-environment"
- Check internet connectivity
- Verify GitHub access: `curl -I https://github.com`
- Check if repository exists: `curl -I https://github.com/smkwlab/latex-environment`