# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export VISUAL='vim'

PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$HOME/.homesick/repos/homeshick/bin:$PATH"
MANPATH=":$HOME/.linuxbrew/share/man:$MANPATH"
INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
