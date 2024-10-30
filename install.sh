apt update
# zsh  git curl
apt install zsh git curl -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
wget -O $ZSH_CUSTOM/themes/haoomz.zsh-theme https://cdn.haoyep.com/gh/leegical/Blog_img/zsh/haoomz.zsh-theme
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Anaconda
apt install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
curl -O https://repo.continuum.io/archive/Anaconda3-2024.06-1-Linux-x86_64.sh
zsh Anaconda3-2024.06-1-Linux-x86_64.sh

# Full Latex environemnt
apt install texlive texlive-latex-extra texlive-science texlive-extra-utils texlive-full -y

# node.js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
nvm install --lts


# vscode-fuzzy search
sudo apt install bat ripgrep fzf
# to .zshrc
export FZF_DEFAULT_OPTS="--history=$HOME/.fzf-history"

# exec file to /usr/local bin

#!/usr/bin/env zsh
##
# Interactive search.
#
[[ -n $1 ]] && cd "$1" # go to provided folder or noop

export FZF_DEFAULT_COMMAND="rg --column --line-number --no-heading --color=always -- ''"
selected=$(
  fzf \
    --ansi \
    --delimiter : \
    --bind "f12:execute-silent:(code -g $PWD/{1..3})" \
    --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
    --preview 'bat -f --highlight-line={2} {1}' | cut -d":" -f1,2,3
)

[[ -n $selected ]] && code -g "$PWD"/"$selected"

sudo chmod +x /usr/local/bin/rgf

