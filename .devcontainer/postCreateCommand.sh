#!/usr/bin/env bash

chown jovyan:jovyan -R $HOME/.oh-my-zsh

echo "alias open='xdg-open'" | tee -a $HOME/.zshrc
git clone \
https://github.com/zsh-users/zsh-autosuggestions \
$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

echo "export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt" >> $HOME/.bashrc
echo "export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt" >> $HOME/.zshrc