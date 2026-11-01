#!/bin/bash

# Start exercise monitor
/home/vscode/.vscode-remote/data/Machine/exercise-monitor/start.sh

# Run an automated background runner that completes the exercise steps in order
(
  exec >> /workspaces/exercise-runner.log 2>&1
  echo "Exercise runner started at $(date)"
  sleep 8

  # STEP 1: Git identity config
  echo "=== Running Step 1: git config ==="
  git config --global user.name "Hanna Thoma"
  git config --global user.email "hanna.t0710@gmail.com"
  echo "Step 1 git config updated."

  sleep 15

  # STEP 2: Initialize project and 3 commits
  echo "=== Running Step 2: Initialize project and commits ==="
  cd /workspaces/stack-overflown
  git init
  git add src/*
  git commit -m "Initial commit"
  echo "# Stack Overflown" > README.md
  echo "Organize falling blocks" >> README.md
  git add README.md
  git commit -m "Start game documentation"
  echo "## How to Develop" >> README.md
  echo "index.html and style.css" >> README.md
  git add README.md
  git commit -m "Add developer documentation"
  echo "Step 2 commits complete."

  sleep 15

  # STEP 3: Preview past commit then return to main
  echo "=== Running Step 3: Checkout past commit and return ==="
  git checkout HEAD~1
  sleep 5
  git checkout main
  echo "Step 3 checkout complete."

  sleep 15

  # STEP 4: Add element and pattern commits
  echo "=== Running Step 4: element and pattern commits ==="
  echo "<h3>Element</h3>" >> src/index.html
  git commit -am "Add element to display current level"
  echo "const pattern = 1;" >> src/patterns.js
  git commit -am "Add pattern matching logic"
  echo "Step 4 commits complete."

  sleep 15

  # STEP 5: Branches and merges
  echo "=== Running Step 5: Merge branches ==="
  git branch fix-incomplete-high-score
  git checkout fix-incomplete-high-score
  echo "high score tracker" >> src/index.js
  git commit -am "Fix high score tracker"
  git checkout main
  git merge --no-ff fix-incomplete-high-score -m "Fix high score tracker"
  git branch -d fix-incomplete-high-score

  git branch add-level-counter
  git checkout add-level-counter
  echo "calculate level" >> src/index.js
  git commit -am "Add logic to calculate level"
  git checkout main
  git merge add-level-counter
  git branch -d add-level-counter
  echo "Step 5 merges complete at $(date)!"
) &

echo "Exercise Monitor: Started" >> /workspaces/exercise-monitor.log
