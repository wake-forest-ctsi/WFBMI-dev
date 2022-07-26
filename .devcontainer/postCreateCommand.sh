#!/usr/bin/env bash

git clone \
https://github.com/zsh-users/zsh-autosuggestions \
$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

git clone \
https://github.com/zsh-users/zsh-syntax-highlighting \
$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

chown jovyan:jovyan -R $HOME/.oh-my-zsh

echo "alias open='xdg-open'" | tee -a $HOME/.zshrc

sed -i.bak '1s/^/ZSH_DISABLE_COMPFIX="true"\'$'\n/g' $HOME/.zshrc

echo "export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt" >> $HOME/.bashrc
echo "export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt" >> $HOME/.zshrc

sed -i.bak 's/\(^plugins=([^)]*\)/\1 zsh-autosuggestions sudo zsh-syntax-highlighting/' $HOME/.zshrc
