set -o vi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
##################################################
# Fancy PWD display function
##################################################
# The home directory (HOME) is replaced with a ~
# The last pwdmaxlen characters of the PWD are displayed
# Leading partial directory names are striped off
# /home/me/stuff          -> ~/stuff               if USER=me
# /usr/share/big_dir_name -> ../share/big_dir_name if pwdmaxlen=20
##################################################
bash_prompt_command() {
    # How many characters of the $PWD should be kept
    local pwdmaxlen=25
    # Indicate that there has been dir truncation
    local trunc_symbol=".."
    local dir=${PWD##*/}
    pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
    NEW_PWD=${PWD/#$HOME/\~}
    local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
    if [ ${pwdoffset} -gt "0" ]
    then
        NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
        NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
    fi
}
bash_prompt() {
    case $TERM in
     xterm*|rxvt*)
         local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]'
          ;;
     *)
         local TITLEBAR=""
          ;;
    esac
    local NONE="\[\033[0m\]"    # unsets color to term's fg color
    
    # regular colors
    local K="\[\033[0;30m\]"    # black
    local R="\[\033[0;31m\]"    # red
    local G="\[\033[0;32m\]"    # green
    local Y="\[\033[0;33m\]"    # yellow
    local B="\[\033[0;34m\]"    # blue
    local M="\[\033[0;35m\]"    # magenta
    local C="\[\033[0;36m\]"    # cyan
    local W="\[\033[0;37m\]"    # white
    
    # emphasized (bolded) colors
    local EMK="\[\033[1;30m\]"
    local EMR="\[\033[1;31m\]"
    local EMG="\[\033[1;32m\]"
    local EMY="\[\033[1;33m\]"
    local EMB="\[\033[1;34m\]"
    local EMM="\[\033[1;35m\]"
    local EMC="\[\033[1;36m\]"
    local EMW="\[\033[1;37m\]"
    
    # background colors
    local BGK="\[\033[40m\]"
    local BGR="\[\033[41m\]"
    local BGG="\[\033[42m\]"
    local BGY="\[\033[43m\]"
    local BGB="\[\033[44m\]"
    local BGM="\[\033[45m\]"
    local BGC="\[\033[46m\]"
    local BGW="\[\033[47m\]"
    
    local UC=$W                 # user's color
    [ $UID -eq "0" ] && UC=$R   # root's color
    
    PS1="$TITLEBAR${UC}\u@\h ${EMB}\${NEW_PWD}${UC}\\$ ${NONE}"
    # without colors: PS1="[\u@\h \${NEW_PWD}]\\$ "
    # extra backslash in front of \$ to make bash colorize the prompt
}

# PS1='[\u@\h \W]\$ '
#PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '
#PS1='\u \$ \[\e[m\]'
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
alias twe='tw translate.google.com.sv-en'
alias ncmpc='ncmpcpp -h 192.168.1.116'
alias weechat='weechat-curses --dir ~/.config/weechat/'
alias wlan='sudo /etc/acpi/eeepc/acpi-eeepc-generic-toggle-wifi.sh'
alias laura='sudo netcfg -r laura'
alias eduroam='sudo netcfg -r eduroam'
alias lamolineta='sudo netcfg -r "la molineta"'
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

PROMPT_COMMAND=bash_prompt_command
bash_prompt
unset bash_prompt
