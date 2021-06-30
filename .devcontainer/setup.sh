# Add Common Tools From Package Mgr.
apk add --update --no-cache \
  curl \
  git \
  jq \
  sudo \
  zsh

# Install NVM and Configure with ZSH
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# Install and Setup Oh-My-ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp -R /root/.oh-my-zsh /home/vscode
cp /root/.zshrc /home/vscode
sed -i -e "s/\/root\/.oh-my-zsh/\/home\/vscode\/.oh-my-zsh/g" /home/vscode/.zshrc
chown -R $USER_UID:$USER_GID /home/vscode/.oh-my-zsh /home/vscode/.zshrc

# Install Python and AWS CLI
apk add --no-cache \
    python3 \
    py3-pip \
&& pip3 install --upgrade pip \
&& pip3 install \
    awscli \
&& rm -rf /var/cache/apk/*

# Configure NVM
cp -R /root/.nvm /home/vscode/

echo 'export NVM_DIR="/home/vscode/.nvm"' >> "/home/vscode/.zshrc"
echo '\n' >> "/home/vscode/.zshrc"
echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm' >> "/home/vscode/.zshrc"
