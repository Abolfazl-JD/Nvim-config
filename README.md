🛠️ Neovim Configuration Installation Guide

🔧 1. Install Meslo LG L DZ Nerd Font

🍺 2. Install Homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew --version

echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
source ~/.bashrc

sudo apt-get install build-essential

🔎 3. Install Ripgrep

brew install ripgrep

🌲 4. Install Tree

sudo apt-get install tree
tree

🌀 5. Install LazyGit

brew install jesseduffield/lazygit/lazygit

🚀 6. Install Neovim

brew install neovim

nvim --version

⚙️ 7. Clone Neovim Configuration

mkdir -p ~/.config/nvim

git clone git@github.com:Abolfazl-JD/Nvim-config.git ~/.config/nvim

✅ You're Ready!

Now you have Neovim installed with your custom configuration 🎉. Open Neovim with:

nvim

Enjoy your streamlined development environment! 🚀
