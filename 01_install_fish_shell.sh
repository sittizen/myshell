apt-add-repository ppa:fish-shell/release-3
apt-get update
apt-get install fish tilix

curl -L https://get.oh-my.fish | fish
fish
omf install bobthefish
git clone https://github.com/ryanoasis/nerd-fonts.git
./nerd-fonts/install.sh
set -U theme_date_format "+%H:%M"
set -U theme_display_cmd_duration no
set -Ux VAULT_ADDR https://vault.pycc-test.gmolapps.lcl
set -Ux VAULT_CACERT ~/Documents/cacert.pem
cp cacert.pem ~/Documents/cacert.pem

echo "tilix preferences default profile command -> run as login shell"
echo "tilix preferences default profile command -> custom shell /usr/bin/fish"
echo "tilix preferences default profile color -> color scheme solarized dark"
echo "tilix preferences default profile color -> don't use theme colors for fore/back"
