#!/bin/bash
set -e

function install_deb() {
    url="$1"
    filename=$(basename "$url")
    wget -O "/tmp/$filename" "$url"
    sudo dpkg -i "/tmp/$filename" || sudo apt-get install -f -y
    rm "/tmp/$filename"
}

sudo apt-get update

### -- BROWSERS --
sudo apt install -y curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg \
  https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] \
  https://brave-browser-apt-release.s3.brave.com/ stable main" \
  | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser

# Firefox Developer Edition
wget -O /tmp/firefox-dev.tar.bz2 "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64"
sudo tar -xjf /tmp/firefox-dev.tar.bz2 -C /opt/
sudo ln -sf /opt/firefox/firefox /usr/bin/firefox-developer-edition
cat <<EOF | sudo tee /usr/share/applications/firefox-developer-edition.desktop
[Desktop Entry]
Name=Firefox Developer Edition
Exec=/opt/firefox/firefox %u
Terminal=false
Type=Application
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
Categories=Network;WebBrowser;
EOF

### -- CODE EDITOR --
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install -y sublime-text

### -- REMOTE DESKTOP --
install_deb "https://download.anydesk.com/linux/anydesk_7.0.1-1_amd64.deb"

### -- CLOUD STORAGE --
install_deb "https://mega.nz/linux/repo/xUbuntu_24.04/amd64/megasync-xUbuntu_24.04_amd64.deb"
# Optional: install_deb "https://mega.nz/linux/MEGAcmd/xUbuntu_24.04/amd64/megacmd-xUbuntu_24.04_amd64.deb"

### -- XAMPP --
wget -O /tmp/xampp-installer.run "https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.2.12/xampp-linux-x64-8.2.12-0-installer.run/download"
chmod +x /tmp/xampp-installer.run
sudo /tmp/xampp-installer.run --mode unattended

### -- NODE.JS + NVM --
export NVM_DIR="$HOME/.nvm"
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source "$NVM_DIR/nvm.sh"
nvm install --lts
nvm use --lts
npm install -g yarn

### -- ZSH + OH-MY-ZSH --
sudo apt-get install -y zsh
export RUNZSH=no
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### -- INSTALL VS CODE EXTENSIONS --
extensions=(
  Makashi.dark-purple
  saoudrizwan.claude-dev
  ms-python.python
  ms-python.debugpy
  python.vscode-pylance
  fosshaas.fontsize-shortcuts
  vscode-icons-team.vscode-icons
  esbenp.prettier-vscode
  quicktype.quicktype
  streetsidesoftware.code-spell-checker
  yoavbls.pretty-ts-errors
  adpyke.codesnap
  bradlc.vscode-tailwindcss
  dsznajder.es7-react-js-snippets
  infarkt.css-to-jss
  paulmolluzzo.convert-css-in-js
  styled-components.vscode-styled-components
  Prisma.prisma
  otovo-oss.htmx-tags
  bierner.markdown-mermaid
)

for ext in "${extensions[@]}"; do
  code --install-extension "$ext" || true
done

echo "✅ Jasper Keyplay post-install configuration completed."
exit 0
