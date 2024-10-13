apt update
# zsh  git curl
sudo apt install zsh git curl -y
sudo wget -O $ZSH_CUSTOM/themes/haoomz.zsh-theme https://cdn.haoyep.com/gh/leegical/Blog_img/zsh/haoomz.zsh-theme
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# Full Latex environemnt
apt install texlive texlive-latex-extra texlive-science texlive-extra-utils texlive-full -y




