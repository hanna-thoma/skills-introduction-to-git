#!/bin/bash

# Only use paging if the results are longer than one screen.
# Do this before installing the exercise monitor
git config --global pager.log false
git config --global core.pager "less -FX"

# Install exercise monitor - Do this last to avoid accidental triggers during startup.
/workspaces/skills-introduction-to-git/.devcontainer/exercise-monitor/install.sh

# Delete the .git folder in the exercise repo to prevent from showing in version control
rm -R -f /workspaces/skills-introduction-to-git/.git

# Create sample project if it doesn't exist
REPO_DIR="/workspaces/stack-overflown"
if [ ! -d "$REPO_DIR" ]; then
  # Create project folder
  mkdir -p "$REPO_DIR"

  # Copy sample source code
  cp -r /workspaces/skills-introduction-to-git/src/. $REPO_DIR/src/
fi
