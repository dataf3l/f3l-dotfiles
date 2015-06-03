HISTSIZE=1000
export HISTTIMEFORMAT="%d/%m/%y %T "
export PS1="\u@\h\w$ "
set -o vi

export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -g -f'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PS1="\[\033[1;34m\]\!\[\033[0m\] \[\033[1;35m\]\u\[\033[0m\]:\[\033[1;35m\]\W\[\033[0m\]$ "



##
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Your previous /Users/a/.profile file was backed up as /Users/a/.profile.macports-saved_2013-02-23_at_14:10:08
##

# MacPorts Installer addition on 2013-02-23_at_14:10:08: adding an appropriate PATH variable for use with MacPorts.
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
