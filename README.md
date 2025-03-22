🛠️ Neovim Configuration Installation Guide

🔧 1. Install Meslo LG L DZ Nerd Font

To ensure you have proper icon rendering in Neovim, install the Meslo LG L DZ Nerd Font:

🍺 2. Install Homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

✅ Verify the installation:

brew --version

💡 Add Homebrew to your shell configuration:

echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
source ~/.bashrc

sudo proxychains apt-get install build-essential

🔎 3. Install Ripgrep

brew install ripgrep

🌲 4. Install Tree

sudo apt-get install tree

✅ Check if it’s installed:

tree

🌀 5. Install LazyGit

Install it with:

brew install jesseduffield/lazygit/lazygit

🚀 6. Install Neovim

Install Neovim using Homebrew :

proxychains brew install neovim

✅ Check if Neovim is installed:

nvim --version

⚙️ 7. Clone Neovim Configuration

mkdir -p ~/.config/nvim

git clone git@github.com:Abolfazl-JD/Nvim-config.git ~/.config/nvim

✅ You're Ready!

Now you have Neovim installed with your custom configuration 🎉. Open Neovim with:

nvim

Enjoy your streamlined development environment! 🚀
