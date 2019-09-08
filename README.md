# J-Lo's Vim Configuration
## Usage
1. Clone this repo into your `~/.vim/` directory
    ```
    mkdir ~/.vim
    cd ~/.vim && git clone https://github.com/SerLongfellow/vim-config
    ```
1. Point bash to this projects `vimrc` (or source this `vimrc` from the default `~/.vimrc`) in `~/.bashrc`
    ```
    ...
    export MYVIMRC="~/.vim/vimrc"
    ...
    ```
1. Install plugins from vim with the `:PlugInstall` command
