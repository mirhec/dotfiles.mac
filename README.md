# Dotfiles for MacOS

#### STEP 1: Clone the dotfiles from these reporitory

```bash
git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
~/.homesick/repos/homeshick/bin/homeshick clone mirhec/dotfiles
source ~/.bashrc
```

#### STEP 2: Install Homebrew and fish
```bash
# if you haven't installed homebrew yet, do it ...
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install fish with brew
brew install fish
```

#### STEP 3: Set fish as default shell (only for MacOS and Fedora)
```bash
# check if /usr/local/bin/fish exists in /etc/shells, otherwise add it
chsh -s /usr/local/bin/fish
```

#### Then log out and log in again to apply the changes
