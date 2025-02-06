# run as root
apt-get update
apt-get install htop bat

mv /usr/bin/cat /usr/bin/cat.bu
ln -s /usr/bin/batcat /usr/bin/cat

wget https://releases.hashicorp.com/vault/1.18.4/vault_1.18.4_linux_amd64.zip
unzip vault_1.18.4_linux_amd64.zip
mv vault /usr/local/bin
rm vault_1.18.4_linux_amd64.zip

DIR="/usr/local/bin"
ARCH=$(uname -m)
GITHUB_LATEST_VERSION=$(curl -L -s -H 'Accept: application/json' https://github.com/jesseduffield/lazydocker/releases/latest | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
GITHUB_FILE="lazydocker_${GITHUB_LATEST_VERSION//v/}_$(uname -s)_${ARCH}.tar.gz"
GITHUB_URL="https://github.com/jesseduffield/lazydocker/releases/download/${GITHUB_LATEST_VERSION}/${GITHUB_FILE}"
curl -L -o lazydocker.tar.gz $GITHUB_URL
tar xzvf lazydocker.tar.gz lazydocker
install -Dm 755 lazydocker -t "$DIR"
rm lazydocker lazydocker.tar.gz
