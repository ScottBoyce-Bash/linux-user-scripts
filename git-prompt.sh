#
#
#
###  PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]' # set window title
###  PS1="$PS1"'\n'                 # new line
###  PS1="$PS1"'\[\033[32m\]'       # change to green
###  PS1="$PS1"'\u@\h '             # user@host<space>
###  PS1="$PS1"'\[\033[35m\]'       # change to purple
###  PS1="$PS1"'$MSYSTEM '          # show MSYSTEM
###  PS1="$PS1"'\[\033[33m\]'       # change to brownish yellow
###  PS1="$PS1"'\w'                 # current working directory
###  if test -z "$WINELOADERNOEXEC"
###  then
###  	GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
###  	COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
###  	COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
###  	COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
###  	if test -f "$COMPLETION_PATH/git-prompt.sh"
###  	then
###  		. "$COMPLETION_PATH/git-completion.bash"
###  		. "$COMPLETION_PATH/git-prompt.sh"
###  		PS1="$PS1"'\[\033[36m\]'  # change color to cyan
###  		PS1="$PS1"'`__git_ps1`'   # bash function
###  	fi
###  fi
###  PS1="$PS1"'\[\033[0m\]'        # change color
###  PS1="$PS1"'\n'                 # new line
###  PS1="$PS1"'$ '                 # prompt: always $


#Note: could change \w for $PWD to get full path instead of ~
#


#PS1="\[\e]0; GitBash  ->  \w\a\]\[\033[01;32m\]\[\033[00m\] \[\033[01;31m\]\# \[\033[01;34m\][\t]\[\033[00m\] \$ "
#
#PS1="\[\e]0; GitBash  ->  \w\a\]\[\033[01;32m\]\[\033[00m\] \[\033[01;31m\]\# "
PS1='\[\033]0; GitBash  ->  \w\a\007\] \[\033[01;31m\]\#'
#
#
#
if test -z "$WINELOADERNOEXEC"
then
	GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
	COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
	COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
	COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
	if test -f "$COMPLETION_PATH/git-prompt.sh"
	then
		. "$COMPLETION_PATH/git-completion.bash"
		. "$COMPLETION_PATH/git-prompt.sh"
		PS1="$PS1"'\[\033[01;34m\]'      # change color
		PS1="$PS1"'`__git_ps1`'          # bash function
	fi
fi
#
#
#
PS1="$PS1"'\[\033[0m\]'        # change color
PS1="$PS1"' $ '                # prompt: always $
#
# added by vscode

if [ -z "${VSCODE_TERMINAL+x}" ]; then
    :
else
    if [ "$VSCODE_TERMINAL" = "1" ]
    then
      PS1='\[\033[01;34m\]`__git_ps1` \[\033[32m\]\w\[\033[00m\] $ '
    fi
fi
# case $VSCODE_TERMINAL in
#     '1') PS1='\[\033[01;34m\]`__git_ps1` \[\033[32m\]\w\[\033[00m\] $ ' ;;
#     *) true ;;
# esac
#
#
##############################################################
# Note that:
#            $(__git_ps1 " (%s)")  <==> `__git_ps1`
#
##############################################################

