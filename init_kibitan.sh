#init shell
cd ~

## for git
git config --add --global user.email uzukifirst@gmail.com
git config --add --global user.name kibitan
git config --add --global color.diff auto
git config --add --global color.status auto
git config --add --global color.branch auto
git config --add --global alias.st status
git config --add --global alias.ci commit
git config --add --global alias.br branch
git config --add --global alias.co checkout
git config --global push.default simple

## rbenv
rbenv global 2.0.0

## ohmyzsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

### add config manually
# .zshrc <<
# source /opt/boxen/env.sh
# ZSH_THEME="bira"

