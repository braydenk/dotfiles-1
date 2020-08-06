echo 'installing ripgrep'
curl -sSLo ripgrep-12.1.1.deb https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb
sudo apt install ./ripgrep-12.1.1.deb -y

echo 'installing neovim'
curl -sSLo nvim.appimage https://github.com/neovim/neovim/releases/download/v0.4.4/nvim.appimage
chmod +x ./nvim.appimage && ./nvim.appimage

echo 'installing init.vim configuration file'
cp ./init.vim ~/.config/nvim/init.vim -f

echo 'installing vim-plug plugin manager'
sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo 'installing nvim plugins'
nvim +PlugInstall +qa
