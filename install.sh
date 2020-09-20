# Install packages
sudo apt-add-repository universe
sudo apt install curl git python3-pip

# Set up (some) dotfiles
git clone https://github.com/Masterchef365/dotfiles.git ~/.dotfiles
ln -s ~/.dotfiles/nvim/.config/nvim/ ~/.config/nvim
echo 'export PATH=$PATH:/home/$USER/.cargo/bin' >> ~/.bashrc
echo 'export PATH=$PATH:/home/$USER/.local/bin' >> ~/.bashrc
echo 'set -o vi' >> ~/.bashrc
echo 'setxkbmap -option caps:escape' >> ~/.bashrc
source ~/.bashrc

# Install Neovim
mkdir ~/.local/bin/
wget 'https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage' -O ~/.local/bin/vim
chmod +x ~/.local/bin/vim
pip3 install --user neovim

# Install Vim-Plug and all plugins
sh -c "curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
vim +'PlugInstall' +'UpdateRemotePlugins' +'wqa'

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install rust-analyzer
wget 'https://github.com/rust-analyzer/rust-analyzer/releases/download/nightly/rust-analyzer-linux' -O ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer
