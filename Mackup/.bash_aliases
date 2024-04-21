alias wsbak="/home/gale/workspace_backup.sh"

# Actual aliases
alias vim="nvim"
alias cat="batcat"
alias cd="z"
alias :q="exit"

# Directory exploration
alias ~="z ~"
alias desk="z ~/Desktop"
alias down="z ~/Downloads"
alias docs="z ~/Documents"
alias pics="z ~/Pictures"
alias bababooey="z ~/Games"
alias nvcf="z ~/.config/nvim"
alias cd1="z .."
alias cd2="z ../../"
alias cd3="z ../../../"
alias cd4="z ../../../../"
alias cd5="z ../../../../../"
alias wtcf="z ~/.config/wezterm"

# Sourcing
alias srcb="source ~/.bashrc"
alias srca="source ~/.bash_aliases"
alias srcf="fc-cache -f -v" # Update font cache

# Utils
alias up="sudo apt update && sudo apt upgrade -y"
alias distro="lsb_release -ds"
alias recentinstalls="grep \" install \" /var/log/apt/history.log"
alias recentinstallsdetailed="grep \" install \" /var/log/dpkg.log"
alias how="cht.sh"
alias path='echo -e ${PATH//:/\\n}'
alias tree="tree -I '.git|node_modules'"
alias wdim="trans -p -b -t es"
alias wdimx="trans -p -t es"
alias archx="dpkg --print-architecture"
alias sshh="/etc/init.d/ssh"
alias sshpub="cat ~/.ssh/id_rsa.pub | xclip -selection clipboard" # expose a public ssh key
gpgpub() { gpg --export -a "$1" | xclip -selection clipboard; } # export a public gpg key

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    export LS_COLORS="di=1;4;33:ln=36;01:so=32:pi=33:ex=35;01:bd=94:cd=92:su=31:sg=31:tw=1;4;33:ow=1;4;33"
    alias ls="eza -F --color=auto"
    alias la="eza -aF --color=auto"
    alias ll="eza -alh --color=auto"
    alias lr="eza -R --color=auto"
    alias lss="eza -lt --color=auto"
    alias grep="grep --color=auto"
    alias fgrep="fgrep --color=auto"
    alias egrep="egrep --color=auto"

fi

# Git
alias ga="git add"
alias gaa="git add ."
alias gaaa="git add -A"
alias gau="git add --update"
alias gb="git branch"
alias gc="git commit"
alias gcm="git commit -m"
alias gch="git checkout"
alias gchb="git checkout -b"
alias gchm="git checkout main"
alias gchs="git checkout staging"
alias gchd="git checkout develop"
alias gd="git diff"
alias gda="git diff HEAD"
alias gi="git init"
alias glg="git log --graph --oneline --decorate --all"
alias gld="git log --pretty=format:'%h %ad %s' --date=short --all"
alias gp="git pull"
alias gpr="git pull --rebase"
alias gr="git rebase"
alias gst="git status"
alias gsts="git status --short"
alias gsh="git stash"
alias gsha="git stash apply"
alias gshd="git stash drop"
alias gshl="git stash list"
alias gshp="git stash pop"
alias gshs="git stash save"
alias gundo="git reset --soft HEAD~1"
grb() { git rebase -i HEAD~"$1"; } # Interactive rebase
glf() { git log --all --grep="$1"; } # Find by commit message

