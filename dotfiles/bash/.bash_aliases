# Shell upgrades. Loaded automatically by ~/.bashrc. Each block is skipped if its tool is missing.

# Prompt (starship), fuzzy search (fzf), folder jumping (zoxide)
command -v starship >/dev/null && eval "$(starship init bash)"
command -v zoxide   >/dev/null && eval "$(zoxide init bash)"
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && . /usr/share/doc/fzf/examples/key-bindings.bash

# Nicer ls / cat (Ubuntu names the bat program "batcat")
if command -v eza >/dev/null; then
  alias ls='eza --group-directories-first'
  alias ll='eza -l --git --group-directories-first'
  alias la='eza -la --git --group-directories-first'
fi
command -v batcat >/dev/null && alias bat='batcat'

# Jump to repos
alias code='cd ~/code'
alias ngs='cd ~/code/NextGen-Scholars'
alias ngi='cd ~/code/NextGen-Immersion'
alias cap='cd ~/code/AI-Capital-Planning'
alias pd='cd ~/code/Personal-Dashboard'
alias loop='cd ~/code/Agentic-Loop'
alias harness='cd ~/code/AI-harness'

# Git shortcuts
alias gs='git status -sb'
alias gl='git log --oneline --graph -15'

# gsall: one-line status for every repo in ~/code (branch, uncommitted changes, unpushed commits)
gsall() {
  for d in ~/code/*/; do
    [ -d "$d/.git" ] || continue
    name=$(basename "$d")
    branch=$(git -C "$d" branch --show-current)
    dirty=$(git -C "$d" status --porcelain | wc -l)
    ahead=$(git -C "$d" rev-list --count '@{u}..HEAD' 2>/dev/null || echo "?")
    printf '%-24s %-10s changes:%-3s unpushed:%s\n' "$name" "$branch" "$dirty" "$ahead"
  done
}

# cc: start Claude Code in the current folder
alias cc='claude'
