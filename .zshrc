
# ============================================
# HOMEBREW
# ============================================
eval "$(/opt/homebrew/bin/brew shellenv)"

# ============================================
# EDITOR 
# ============================================
export EDITOR=nvim
export VISUAL="$EDITOR"

# For VimTeX + Zathura
export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"

# ============================================
# FZF
# ============================================
eval "$(fzf --zsh)"

# ============================================
# PROMPT
# ============================================
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' on %b'
setopt PROMPT_SUBST
PROMPT='%F{173}%n%f @ %F{109}%1~%f%F{143}${vcs_info_msg_0_}%f> '

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
mkcd() { mkdir "$1" && cd "$1" } 

pdf() { open -a sioyek "$@" }

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# ============================================
# GENERAL ALIASES
# ============================================
alias c="clear"
alias h="history"
alias weather="curl wttr.in/Singapore"
alias myip="curl -s ifconfig.me"
alias mb="brew"
alias doc2pdf='soffice --headless --convert-to pdf'
alias tailscale='/Applications/Tailscale.app/Contents/MacOS/Tailscale'
alias vim="nvim"
# ============================================
# NAVIGATION
# ============================================
alias ..="cd .."


# ============================================
# SEARCH & GREP
# ============================================
alias grep="grep --color=auto"


# ============================================
# ZSH COMPLETION
# ============================================
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/Users/Shailesh/.zshrc'
autoload -Uz compinit
compinit

# ============================================
# ZOXIDE
# ============================================
eval "$(zoxide init zsh)"

# Created by `pipx` on 2025-11-03 17:18:00
export PATH="$PATH:/Users/Shailesh/.local/bin"

export PATH=$PATH:/Users/Shailesh/.spicetify

# SSH TERMINAL
export TERM=xterm-256color

