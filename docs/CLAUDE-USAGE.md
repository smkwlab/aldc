# Usage Guide and Examples

This document provides detailed usage examples and scenarios for aldc.

## Usage Scenarios

### Research Paper Development
- Existing LaTeX projects needing modern development environment
- Collaborative research with multiple authors
- Academic papers requiring consistent formatting and quality

### Student Projects
- Converting course assignments to standardized environment
- Thesis development with faculty review workflow
- Learning LaTeX with integrated quality tools

### Faculty Workflow
- Providing consistent environment for student submissions
- Standardizing LaTeX development across courses
- Enabling automated review and feedback processes

## Installation Examples

### Basic Installation
```bash
# Install in current directory
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/smkwlab/aldc/main/aldc)"
```

### Installation with Git Initialization
```bash
# For projects without git
cd my-latex-project
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/smkwlab/aldc/main/aldc)"
# aldc will automatically initialize git repository
```

### Installation in Existing Git Repository
```bash
# For projects with existing git history
cd existing-latex-repo
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/smkwlab/aldc/main/aldc)"
# aldc will commit changes to preserve history
```

## Post-Installation Workflow

### First Launch
1. Open project in VS Code
2. VS Code will detect .devcontainer and prompt to reopen in container
3. Click "Reopen in Container"
4. Wait for initial container build (may take several minutes)
5. Start developing with full LaTeX + textlint environment

### Development Workflow
```bash
# Compile LaTeX documents
latexmk -pv main.tex

# Check Japanese writing quality
textlint *.tex

# Auto-fix common issues
textlint --fix *.tex

# Git workflow with automatic PDF generation
git add -A
git commit -m "Update thesis content"
git push  # Triggers automatic PDF generation via GitHub Actions
```

## Integration Examples

### Converting Existing Projects
```bash
# Example: Converting a research paper
cd research-paper-2024
ls  # main.tex, references.bib, figures/

# Install LaTeX environment
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/smkwlab/aldc/main/aldc)"

# Result: Now has .devcontainer/, .github/workflows/, etc.
# Original files preserved, ready for modern development
```

### Collaborative Research Setup
```bash
# Faculty sets up template
mkdir collaborative-research
cd collaborative-research
echo "% Research Paper Template" > main.tex
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/smkwlab/aldc/main/aldc)"

# Commit and share
git add -A
git commit -m "Setup LaTeX development environment"
git remote add origin https://github.com/university/research-project.git
git push -u origin main

# Students clone and immediately have full environment
git clone https://github.com/university/research-project.git
cd research-project
# Open in VS Code -> automatic DevContainer setup
```

### Course Assignment Template
```bash
# Create assignment template
mkdir assignment-template
cd assignment-template
cat > assignment.tex << 'EOF'
\documentclass[12pt]{jarticle}
\begin{document}
\title{Assignment Title}
\author{Student Name}
\date{\today}
\maketitle

% Assignment content here

\end{document}
EOF

# Add environment
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/smkwlab/aldc/main/aldc)"

# Students get consistent environment for all assignments
```

## File Management

### Backup Files
```bash
# Check for backed up files after installation
ls -la *-aldc

# Example backed up files
# .gitignore-aldc  # Original .gitignore if existed
# Makefile-aldc    # Original Makefile if existed
```

### Restoring Backed Up Content
```bash
# Review backup content
cat .gitignore-aldc

# Merge important settings manually
# (aldc doesn't auto-merge to avoid conflicts)
echo "# Custom ignores" >> .gitignore
cat .gitignore-aldc >> .gitignore
```

## Advanced Usage

### Corporate/Institutional Deployment
```bash
# For organizations wanting standardized setup
#!/bin/bash
# institutional-setup.sh

# Clone organization template
git clone https://github.com/organization/latex-template.git project-name
cd project-name

# Add standard environment
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/smkwlab/aldc/main/aldc)"

# Customize for organization
# Add organization-specific templates, configs, etc.
```

### Integration with Existing Workflows
```bash
# Example: Integration with thesis management system
# thesis-management-tools can use aldc for student setup

# In create-repo scripts:
echo "Adding LaTeX development environment..."
if ALDC_QUIET=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/smkwlab/aldc/main/aldc)"; then
    echo "✓ LaTeX environment setup complete"
else
    echo "⚠ LaTeX environment setup failed"
fi
```

## Validation and Testing

### Post-Installation Verification
```bash
# Check environment completeness
ls -la .devcontainer/  # Should contain devcontainer.json, Dockerfile
ls -la .github/workflows/  # Should contain CI workflows

# Test compilation
docker run --rm -v $(pwd):/workspace -w /workspace \
  ghcr.io/smkwlab/texlive-ja-textlint:2025b \
  latexmk -pdf main.tex

# Test textlint
docker run --rm -v $(pwd):/workspace -w /workspace \
  ghcr.io/smkwlab/texlive-ja-textlint:2025b \
  textlint *.tex
```