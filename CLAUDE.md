# CLAUDE.md

Command-line tool that automatically adds LaTeX development environment to existing LaTeX document repositories. Integrates smkwlab latex-environment as a DevContainer setup.

## Quick Start

### Installation Command
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/smkwlab/aldc/main/aldc)"
```

### Installation Process
1. **Validation**: Checks if .devcontainer already exists
2. **Git Setup**: Initializes git repository if not present
3. **Download**: Fetches latex-environment from release branch
4. **Integration**: Merges environment files with existing project
5. **Backup**: Creates backups of conflicting files with `-aldc` suffix
6. **Cleanup**: Removes temporary files and commits changes

## Environment Features Added

- **LaTeX Compilation**: Automatic PDF generation with latexmk
- **textlint Integration**: Real-time Japanese document proofreading
- **VS Code Extensions**: Pre-configured LaTeX development tools
- **GitHub Workflows**: Automatic PDF generation on PR creation

## Target Use Cases

- Converting existing LaTeX projects to DevContainer workflow
- Adding standardized LaTeX environment to research papers
- Enabling collaborative LaTeX development with consistent tooling
- Providing students with standardized LaTeX development setup

## Repository Structure

```
aldc/
├── aldc                   # Main installation script (bash)
├── README.md             # Japanese documentation with usage instructions
└── CLAUDE.md             # This file
```

## Prerequisites

- Git (for repository management)
- curl (for downloading releases)
- unzip (for archive extraction)
- Internet connectivity (for latex-environment download)

## Post-Installation

- **VS Code Required**: DevContainer setup requires VS Code with DevContainer extension
- **Docker Required**: Underlying environment runs in Docker containers
- **First Launch**: Initial container build may take several minutes

## Ecosystem Integration

### Dependency Chain
```
aldc (installation tool)
  ↓ downloads and integrates
latex-environment (DevContainer template)
  ↓ uses
texlive-ja-textlint (Docker base image)
```

## Detailed Documentation

- **[Development Guide](docs/CLAUDE-DEVELOPMENT.md)** - Architecture, security guidelines, ecosystem integration
- **[Troubleshooting](docs/CLAUDE-TROUBLESHOOTING.md)** - Common issues, debug commands, installation safety
- **[Usage Guide](docs/CLAUDE-USAGE.md)** - Detailed examples, scenarios, post-installation workflow