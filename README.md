# Neovim Config

## LSP

### Lua

Install Sumneko's Lua language server:
```
cd ${HOME}/.local/share/nvim/site/oh-my-vim
git clone https://github.com/sumneko/lua-language-server
cd lua-language-server
git submodule update --init --recursive
cd 3rd/luamake
ninja -f ninja/linux.ninja
cd ../..
./3rd/luamake/luamake rebuild
```
