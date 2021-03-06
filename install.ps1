Write-Host -ForegroundColor Yellow "Installing Scoop"
try { Get-Command scoop }
catch { iwr -useb get.scoop.sh | iex }

Write-Host -ForegroundColor Yellow "Installing tools"
scoop install neovim ripgrep

Write-Host -ForegroundColor Yellow "Installing init.vim configuration file"
Get-Content ./init.vim -Raw | ni $HOME/AppData/Local/nvim/init.vim -Force

Write-Host -ForegroundColor Yellow " Installing vim-plug plugin manager"
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni $HOME/AppData/Local/nvim-data/site/autoload/plug.vim -Force

Write-Host -ForegroundColor Yellow "Installing neovim plugins"
nvim +PlugInstall +qa

Write-Host -ForegroundColor Yellow "Done"
