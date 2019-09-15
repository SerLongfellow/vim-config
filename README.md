# J-Lo's Vim Configuration
## Usage
1. Clone this repo into your `~/.vim/` directory
    ```
    mkdir ~/.vim
    cd ~/.vim && git clone https://github.com/SerLongfellow/vim-config .
    ```
1. Make sure that your neovim `.config/nvim/init.vim' file is `source`ing this `vimrc` and adding `~/.vim/` to its runpath
    ```
    ...
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vim/vimrc
    ...
    ```
1. Install plugins from vim with the `:PlugInstall` command
1. Install all coc.nvim plugins from within neovim
    ```
    :CocInstall coc-json coc-tsserver coc-html coc-css coc-solargraph coc-yaml coc-python coc-git
    ```

## Dependencies
All linters, fixers, and language servers referenced in the vimrc file will need to be installed as well.
```
gem install solargraph
```

