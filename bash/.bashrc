# base-files version 3.7-1

# To pick up the latest recommended .bashrc content,
# look in /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benificial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file


# Shell Options
# #############

# See man bash for more options...

# Don't wait for job termination notification
# set -o notify

# Don't use ^D to exit
# set -o ignoreeof

# Use case-insensitive filename globbing
 shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
 shopt -s histappend

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
 shopt -s cdspell
 
shopt -s checkwinsize


# Completion options
# ##################

# These completion tuning parameters change the default behavior of bash_completion:

# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1

# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1

# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1

# If this shell is interactive, turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# case $- in
#   *i*) [[ -f /etc/bash_completion ]] && . /etc/bash_completion ;;
# esac


# History Options
# ###############

# Don't put duplicate lines in the history.
 export HISTCONTROL="ignoredups"

# ignore same sucessive entries
# export HISTCONTROL="ignoreboth"

# Ignore some controlling instructions
 export HISTIGNORE="[   ]*:&:bg:fg:exit:ls"

# Whenever displaying the prompt, write the previous line to disk
 export PROMPT_COMMAND="history -a"

export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s cmdhist

# adds timestamps to history
export HISTTIMEFORMAT="%F %T "

# Aliases
# #######

# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

# Default to human readable figures
 alias df='df -h'
 alias du='du -h'

# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
 alias grep='grep --color'                     # show differences in colour
 alias hs='history | grep '

# Some shortcuts for different directory listings
 alias ls='ls -hF --color=tty --group-directories-first'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
 alias ll='ls -l'                              # long list
 alias la='ls -A'                              # all but . and ..
 alias l='ls -CF'                              #

#cd aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# cd into the old directory
alias bd='cd "$OLDPWD"'

# Other
alias serve='python -m SimpleHTTPServer'
alias bc='bc -l'  # start with math features and division

# Functions
# #########

# Some example functions
# function settitle() { echo -ne "\e]2;$@\a\e]1;$@\a"; }

function __setprompt {
  local BLUE='\[\e[1;34m\]'
  local NO_COLOUR='\[\e[0m\]'
  local RED='\[\e[1;31m\]'   # Red
  local GRAY='\[\e[0;37m\]'
  local GREEN='\[\e[1;32m\]'

  local SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
  local SSH2_IP=`echo $SSH2_CLIENT | awk '{ print $1 }'`
  if [ $SSH2_IP ] || [ $SSH_IP ] ; then
    local SSH_FLAG="@\h"
  fi
  PS1="$GRAY[$RED\$(date +%H:%M)$GRAY][$BLUE\u$SSH_FLAG$GRAY:$GREEN\w$GRAY]\$ $NO_COLOUR"
  PS2="$BLUE>$NO_COLOUR "
  PS4='$BLUE+$NO_COLOUR '
}
__setprompt

# VirtualEnvWrapper
# export WORKON_HOME=~/Virtualenvs
# source /usr/bin/virtualenvwrapper.sh

# Set Vim as the man pager
#export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""


# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end


# 256 color terminal support
# export TERM="xterm-256color"

export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export BROWSER=/usr/bin/chromium

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
