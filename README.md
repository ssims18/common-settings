# Common-Settings
Settings for vim and tmux.

#### Setup:

Create vim plugin directory
```
mkdir ~/.vim/plugged
```

Download and link config files
```
mkdir ~/.dotfiles && cd ~/.dotfiles 
git clone https://github.com/ssims18/common-settings.git
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.bashrc ~/.bashrc
```
Reload vim and install plugins
```
:PlugInstall
```

Bash aliases - add to .bashrc
```
 # Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
```
