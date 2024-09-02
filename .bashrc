#
# Has cmd history appended rather than overwriting .bash_history
shopt -s histappend
#
# Add current directory to search path
PATH=$PATH:.

# Add miniforg conda to Path
#source /c/Users/seboyce/miniforge3/etc/profile.d/conda.sh
if [ -f "/c/Users/seboyce/miniforge3/etc/profile.d/conda.sh" ] ; then
  alias conda_init='source /c/Users/seboyce/miniforge3/etc/profile.d/conda.sh && conda activate '
else
  alias conda_init='echo "etc/profile.d/conda.sh not found, fix in .bashrc"'
fi
#
# Aliases
#

function np { 
  ( "/c/Program Files/Notepad++/notepad++.exe" $1 2>&1 >/dev/null & disown -h )
}
function npp { 
  ( "/c/Program Files/Notepad++/notepad++.exe"  -multiInst -notabbar -nosession $1 2>&1 >/dev/null & disown -h )
}
function md { 
  ( "/c/Program Files/Typora/Typora.exe" $1 2>&1 >/dev/null & disown -h )
}

stash() {
    # stash  MESSAGE  FILE1  FILE2 ...
    # run git stash with message and specified files
    if [ -z "$1" ]; then
        echo "Error: stash function must include a message." >&2
        return 1
    fi

    local message="$1"
    shift

    if [ $# -eq 0 ]; then
        git stash push -m "$message"
    else
        git stash push -m "$message" -- "$@"
    fi
}


# function vscode { code.exe . $1 & disown -h;}

#go_test() {
#  go test $* | sed ''/PASS/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/SKIP/s//$(printf "\033[34mSKIP\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/'' | GREP_COLOR="01;33" egrep --color=always '\s*[a-zA-Z0-9\-_.]+[:][0-9]+[:]|^'
#}

alias size="du -sh"

alias mms="meson setup builddir --prefix=\$(pwd) --libdir=bin"
alias mmi="meson install -C builddir"
alias mmt="meson test -C builddir --no-rebuild"

alias git-clean="echo && git reflog expire --expire=now --all  && git gc --aggressive --prune=now && echo"

#
alias gs='echo && git status -uno && echo'
alias gst='echo && git status && echo'

# Select only files that are Added (A), Copied (C), Deleted (D), Modified (M), Renamed (R), 
#   have their type (file, symlink, submodule,) changed (T), are Unmerged (U), are Unknown (X), or have had their pairing Broken (B). From: "--diff-filter" in https://git-scm.com/docs/git-log

alias gtrack='echo && git log --oneline --name-status '
alias gtrackfile='echo && git log --oneline --name-status --follow -- '
alias gfiles='echo && git diff --oneline --name-only '

alias gdiff='echo && git difftool --tool=meld '
alias gdif='echo && git difftool --tool=meld '
alias gwinmerge='echo && git difftool --tool=winmerge '
alias gcode='echo && git difftool --tool=vscode '
alias gwinmerge-staged='echo && git difftool --tool=winmerge --staged '
#
# for full listing: --reflog 
#
alias gl="echo && git log --pretty=format:'%>|(10)%C(bold red)%h%C(reset) %<|(87)%s%C(bold green)%<|(92)%cr%C(reset)    %C(bold magenta)%D%C(reset)' --decorate -10"
alias gg="echo && git log -5"
#
alias  glog="echo && git log --pretty=format:'%>|(13)%C(bold red)%h%C(reset) %<|(90)%s%C(bold green)%<|(95)%cr%C(reset)    %C(bold magenta)%D%C(reset)' --decorate --graph"
alias   gla="echo && git log --pretty=format:'%>|(13)%C(bold red)%h%C(reset) %<|(90)%s%C(bold green)%<|(95)%cr%C(reset)    %C(bold magenta)%D%C(reset)' --decorate --graph --all"
alias gdate="echo && git log --pretty=format:'%>|(32)%C(bold green)%aI%C(reset)   %C(bold red)%h%C(reset)   %<|(110)%s  %C(bold green)%cr%C(reset)  %C(bold)%D%C(reset)' --all  --graph"
alias gdatecmp="echo && git log --pretty=format:'%C(bold)%as   %cs%C(reset)   %C(bold red)%h%C(reset)   %s%<|(100)%C(bold)%D%C(reset)' --all"
alias gitlog="echo && git log -2"

alias gstash="echo && git stash push -m"
alias gstashall="echo && git stash push --include-untracked -m"
alias stash-commits="git reflog show stash"

alias gbranch='git branch -a -vv'
alias gpushDefault='git config remote.pushDefault ' # RemoteName
alias gremoteShow='git remote show ' # RemoteName


#git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
#git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all
#git log --pretty=oneline --abbrev-commit

alias  pull='echo && git pull  --verbose && echo'  # --prune-tags  --prune
alias fetch='echo && git fetch --verbose && echo'

alias gcom='echo && git commit -m '
#alias squash='echo && git rebase -i '  # HEAD~<n> or <HASH> or --root
alias gam='echo && git commit --amend --no-edit'

#alias ga='git add '
alias ga='git add -u && echo && git status && echo'
alias gb='git branch '

#alias gc='git commit'
alias  gd='echo && git diff'
alias gco='echo && git switch '                               # 'echo && git checkout '
alias gcb='echo && git switch --create '                      # 'echo && git checkout -b '

alias gk='gitk --all&'
alias gx='gitx --all'

alias got='git '
alias get='git '

# Some shortcuts for different directory listings
lls=`which ls`  #${lls} $lls
alias   ls='echo && $lls -hF --color=always --format=single-column && echo' # classify files in colour
alias   ll='echo && $lls -lhFA --color=always  && echo'                     # long list
alias  dir='$lls --color=always --format=vertical'
alias vdir='$lls --color=always --format=long'
alias   la='$lls -A'                                                        # all but . and ..
#alias l='$lls -CF'                                                         #
#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
alias  grep='echo && grep --color'              # show differences in color
alias egrep='echo && egrep --color=auto'        # show differences in color
alias fgrep='echo && fgrep --color=auto'

#alias ll='ls -lAB -1 --block-size=1024'
#alias vscode="code.exe ."

#/c/Data/Code/Meld/bin/meld

#env=~/.ssh/agent.env
#
#agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }
#
#agent_start () {
#    (umask 077; ssh-agent >| "$env")
#    . "$env" >| /dev/null ; }
#
#agent_load_env
#
## agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
#agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
#
#if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
#    agent_start
#    ssh-add
#elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
#    ssh-add
#fi
#
#unset env


#eval $(ssh-agent -s)
#ssh-add  /c/Users/seboyce/.ssh/id_rsa


#alias gl="git log --graph --full-history --all --color --decorate=short"


# opens first .sln file in current directory in Visual Studio
#function vs { /c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 12.0/Common7/IDE/devenv `ls *.sln | sort -n | head -1` & disown; }

# Generate production deployment patch folder e.g.: git-live-patch master..qa ~/live-patch-2015-04-01
#function git-live-patch { cp --parents `git diff-tree -r --name-only --diff-filter=ACMRT "$1"` "$2"; }




#alias   np='echo && "C:\\Program Files (x86)\\Notepad++\\notepad++.exe"'
#alias npp='echo && "/c/Program Files (x86)/Notepad++/notepad++.exe"  -multiInst -notabbar -nosession '
#alias  np='echo && "/c/Program Files (x86)/Notepad++/notepad++.exe" '
#alias  md='echo && "/c/Program Files/Typora/Typora.exe" '