#!/usr/bin/env bash
# install.sh — Install E2E Test Agents into your AI tool of choice
# Usage: bash install.sh --tool <claude-code|copilot|cursor|opencode>

set -euo pipefail

TOOL=""
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AGENTS_DIR="$SCRIPT_DIR/../.claude/agents"

usage() {
  echo "Usage: $0 --tool <claude-code|copilot|cursor|opencode>"
  echo ""
  echo "Tools:"
  echo "  claude-code  → ~/.claude/agents/"
  echo "  copilot      → .github/agents/ (project-scoped)"
  echo "  cursor       → .cursor/rules/  (project-scoped)"
  echo "  opencode     → .opencode/agents/ (project-scoped)"
  exit 1
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --tool) TOOL="$2"; shift 2 ;;
    *) usage ;;
  esac
done

[ -z "$TOOL" ] && usage

install_agents() {
  local dest="$1"
  local ext="${2:-.md}"
  local scope="${3:-global}"

  if [[ "$scope" == "project" ]]; then
    mkdir -p "$dest"
  else
    mkdir -p "$dest"
  fi

  local count=0
  for agent in "$AGENTS_DIR"/*.md; do
    base="$(basename "$agent" .md)"
    dest_file="$dest/${base}${ext}"
    cp "$agent" "$dest_file"
    echo "  ✓ $base"
    ((count++))
  done
  echo ""
  echo "Installed $count agents to $dest"
}

case "$TOOL" in
  claude-code)
    echo "Installing to Claude Code (~/.claude/agents/)..."
    install_agents "$HOME/.claude/agents" ".md" "global"
    echo ""
    echo "Done! Agents are available in all Claude Code sessions."
    echo "Start a new session and try: 'Run a full E2E test on my app'"
    ;;

  copilot)
    echo "Installing to GitHub Copilot (.github/agents/)..."
    install_agents ".github/agents" ".md" "project"
    echo ""
    echo "Done! Commit .github/agents/ to enable agents in this repo."
    ;;

  cursor)
    echo "Installing to Cursor (.cursor/rules/)..."
    mkdir -p .cursor/rules
    for agent in "$AGENTS_DIR"/*.md; do
      base="$(basename "$agent" .md)"
      cp "$agent" ".cursor/rules/${base}.mdc"
      echo "  ✓ $base"
    done
    echo ""
    echo "Done! Agents are available as Cursor rules in this project."
    ;;

  opencode)
    echo "Installing to OpenCode (.opencode/agents/)..."
    install_agents ".opencode/agents" ".md" "project"
    echo ""
    echo "Done! Commit .opencode/agents/ to activate in this repo."
    ;;

  *)
    echo "Unknown tool: $TOOL"
    usage
    ;;
esac
