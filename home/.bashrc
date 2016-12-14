# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$HOME/.homesick/repos/homeshick/bin:$PATH"
MANPATH=":$HOME/.linuxbrew/share/man:$MANPATH"
INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

if [[ -S "$SSH_AUTH_SOCK" && ! -h "$SSH_AUTH_SOCK" ]]; then
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock;
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock;

# # Autostart workaround for windows
# fish -l
# exit
