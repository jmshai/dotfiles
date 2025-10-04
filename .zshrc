# ============================================
# PROMPT
# ============================================
PROMPT='%(?.%F{green}>.%F{red}?%?)%f %B%F{240}%1~%f%b %# '

# ============================================
# FUNCTIONS
# ============================================
n() { nvim "$@" }

f() {
    local file=$(fzf --style full) && [[ -n "$file" ]] && open "$file"
}

oa() {
    open -a "$1"
}


# ============================================
# GENERAL ALIASES
# ============================================
alias c="clear"
alias h="history"
alias weather="curl -s v2.wttr.in/Singapore"
alias pdf="open -a Sioyek"
alias myip="curl -s ifconfig.me"
alias mb="brew"
# ============================================
# NAVIGATION
# ============================================
alias ..="cd .."

# ============================================
# FILE LISTINGS
# ============================================
alias ls="ls -la -G"
alias lt="ls -lth -G"

# ============================================
# SEARCH & GREP
# ============================================
alias grep="grep --color=auto"

# ============================================
# GIT ALIASES
# ============================================
alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline"
alias gd="git diff"

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/Users/Shailesh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
