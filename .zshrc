if [[ $USER != fksc76 ]]; then
  source ~/.zshrc.d/zle
  source ~/.zshrc.d/keybindings.zsh

  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh

  # -------------------- PLUGINS --------------------
  source <(antibody init)

  antibody bundle zsh-users/zsh-syntax-highlighting
  antibody bundle zsh-users/zsh-completions
  antibody bundle romkatv/powerlevel10k

  # -------------------- THEMES --------------------
  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block, everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

  # ---------------------------------------- 
  # OTHER
  # ----------------------------------------
  # use modern completion system
  autoload -Uz compinit
  compinit

  # complete aliases
  setopt COMPLETE_ALIASES

  # try to complete commands with sudo
  zstyle ':completion::complete:*' gain-privileges 1

  # enable smart history search
  autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
  zle -N up-line-or-beginning-search
  zle -N down-line-or-beginning-search

  [[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
  [[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
fi

if [[ $HOST == hamilton?.hpc.dur.ac.uk ]]; then
  alias cdd="cd /ddn/data/fksc76"
  alias python=python3

  # Start screen on every shell
  # source: https://wiki.archlinux.org/index.php/GNU_Screen#Start_Screen_on_every_shell
  if [[ -z "$STY" ]]; then
      screen -xRR main
  fi
fi

  #################### ALIASES ####################

# fancy cd with ls
chpwd() ls

# listing files
alias ls="ls -v --color --group-directories-first"
alias lsa="ls -a"
alias lsl="ls -l"
alias lsal="ls -al"

if [[ -e /usr/bin/nvim ]]; then
	alias vim=nvim
fi

# universal stuff
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward

# directory traversal
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

