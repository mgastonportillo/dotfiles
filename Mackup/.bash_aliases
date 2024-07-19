# workspace backup
alias wsbak="/home/gale/workspace_backup.sh"

# dev
alias newnext="npx create-next-app@latest"
alias newastro="npm create astro@latest"
alias newastropnpm="pnpm create astro@latest"
alias newsolidjs="npx degit solidjs/templates/js"
alias newsolidts="npx degit solidjs/templates/ts"

# aliases
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias sudoedit="sudo -Es nvim"
alias btw="nvim"
alias cat="batcat"
alias cd="z"
alias :q="exit"
alias :e="nvim"

# zoxide
alias ~="z ~"
alias desk="z ~/Desktop"
alias down="z ~/Downloads"
alias docs="z ~/Documents"
alias pics="z ~/Pictures"
alias game="z ~/Games"
alias win="z \$USERPROFILE"
alias nvcf="z ~/.config/nvim"
alias wtcf="z ~/.config/wezterm"
alias cd1="z .."
alias cd2="z ../../"
alias cd3="z ../../../"
alias cd4="z ../../../../"
alias cd5="z ../../../../../"

# eza / greps
alias ls="eza -F --color=auto --icons"
alias la="eza -aF --color=auto --icons"
alias ll="eza -alh --color=auto --icons"
alias lr="eza -R --color=auto --icons"
alias lss="eza -lt --color=auto --icons"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias tree="eza_tree"
alias treei="eza_tree I"

# sourcing
alias srcb="source ~/.bashrc"
alias srca="source ~/.bash_aliases"
alias srcf="fc-cache -f -v" # update font cache

# utils
alias up="sudo apt update && sudo apt upgrade -y && ble-update"
alias distro="lsb_release -ds"
alias recentinstalls="grep \" install \" /var/log/apt/history.log"
alias recentinstallsdetailed="grep \" install \" /var/log/dpkg.log"
alias how="cht.sh"
alias path='echo -e ${PATH//:/\\n}'
alias wdim="trans -p -b -t es"
alias wdimx="trans -p -t es"
alias archx="dpkg --print-architecture"
alias sshh="/etc/init.d/ssh"
alias sshpub="cat ~/.ssh/id_rsa.pub | xclip -selection clipboard" # expose a public ssh key
gpgpub() { gpg --export -a "$1" | xclip -selection clipboard; }   # export a public gpg key
alias edita="nvim ~/.bash_aliases"
alias editb="nvim ~/.bashrc"
alias editble="nvim ~/.blerc"
alias dotbak="backup_dotfiles"

# Git
alias ga="git add"
alias gaa="git add ."
alias gaaa="git add -A"
alias gau="git add --update"
alias gb="git branch"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gcane="git commit --amend --no-edit"
alias gch="git checkout"
alias gchb="git checkout -b"
alias gchm="git checkout main"
alias gchs="git checkout staging"
alias gchd="git checkout dev"
alias gd="git diff"
alias gda="git diff HEAD"
alias gi="git init"
alias glg="git log --graph --pretty=format:'%C(yellow)%h%Creset -%C(auto)%d%Creset %s %C(green)(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gp="git pull"
alias gpr="git pull --rebase"
alias gst="git status"
alias gsts="git status --short"
alias gsh="git stash"
alias gsha="git stash apply"
alias gshd="git stash drop"
alias gshl="git stash list"
alias gshp="git stash pop"
alias gshs="git stash save"
alias gundo="git reset --soft HEAD~1"
alias gr="git rebase"
alias gri="rebase_i"
alias glf="grep_gcm"

# functions
eza_tree() {
  local level=2
  local ignore=()

  # include ignore patterns if `I` is passed
  if [[ "$1" == "I" ]]; then
    ignore=(-I '.git|node_modules')
    shift 1
  fi

  # if the argument is an integer, treat it as new depth level
  if [[ "$1" =~ ^[0-9]+$ ]]; then
    level="$1"
    shift 1
  fi

  # allow other eza params
  params=("$@")
  eza -TRaF --color=auto --icons "${ignore[@]}" --level="$level" "${params[@]}"
}

rebase_i() {
  git rebase -i HEAD~"$1"
}

grep_gcm() {
  # grep by commit message
  git log --all --grep="$1"
}

backup_dotfiles() {
  local current_dir
  current_dir=$(pwd)

  # Prompt for confirmation
  while true; do
    read -rp "Do you want to backup dotfiles? (y/n): " yn
    case "$yn" in
    [Yy]*)
      # Change directory and perform git operations
      cd ~/dotfiles/ || return
      git add -A
      git commit -m 'chore: update dotfiles'
      git push
      cd "$current_dir" || return
      break
      ;;
    [Nn]*)
      echo "Backup aborted."
      return 1
      ;;
    *) echo "Please answer yes or no." ;;
    esac
  done
}

# dropped
# tree_fun() { eza -TRaF --color=auto --icons -I '.git|node_modules' --level="${2:-2}"; }
# alias glg="git log --graph --oneline --decorate --all"
# alias gld="git log --pretty=format:'%h %ad %s' --date=short --all"
