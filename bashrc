set -o vi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '
#PS1='\u \$ \[\e[m\]'
#PS1='[\u@\h`__git_ps1` \W]\n\$ '
PS1='\[\e[0;34m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\e[0;30m`__git_ps1`\n\$\[\e[m\] \[\e[0m\]'
PS2='> '
PS2='> '
PS3='> '
PS4='+ '

[ -r /etc/bash_completion   ] && . /etc/bash_completion
export LC_TIME="sv_SE.UTF-8"
export LC_LANG="en_US.UTF-8"
export EDITOR="vim"
export PATH="$PATH:~/bin"

setterm -blength 0

#export LD_PRELOAD=libetc.so

#aliases
alias ls='ls --color=auto -F'
alias la='ls --color=auto -Fa'
alias ll='ls --color=auto -hog'
alias lla='ls --color=auto -la'
alias grep='grep --color=auto'
alias g='gvim --remote-silent'
alias mc='mc -b'
alias tmux='tmux -2'
alias twe='tw translate.google.com.sv-en'
alias screencapture='ffmpeg -f x11grab -r 25 -s 800x600 -i :0.0 /tmp/outputFile.mpg'
alias whatsmyip='curl ifconfig.me'
alias share='curl -F "sprunge=<-" http://sprunge.us | xclip'
alias todo='todo.sh'
alias väder='weather --id=ESSB'

function calc() {
    awk "BEGIN{ print $* }" ;
}

#start xbindkeys
#xbindkeys
# sudo completion
complete -cf sudo

#fast shellcompletion
#set show-all-if-ambiguous on

# ex - archive extractor
# usage: ex <file>
ex ()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      unrar x $1      ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.zip)      unzip $1        ;;
            *.ZIP)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *.7z)       7z e $1         ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# remind me, its important!
# usage: remindme <time> <text>
# e.g.: remindme 10m "omg, the pizza"
function remindme()
{
    sleep $1 && zenity --info --text "$2" &
}
#keychain ssh skit
#/usr/bin/keychain -Q -q ~/.ssh/id_dsa
#[[ -f $HOME/.keychain/$HOSTNAME-sh ]] && source $HOME/.keychain/$HOSTNAME-sh

#colored manpages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

