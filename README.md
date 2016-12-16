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

#### STEP 4: Add your ssh key to the keychain
You need to do this once, otherwise tmux will ask you every time you connect via ssh for your passphrase:
```bash
ssh-add -K ~/.ssh/id_rsa
   Enter your passphrase: ...
```

#### Then log out and log in again to apply the changes
