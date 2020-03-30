sudo apt install tilix

curl -L https://get.oh-my.fish | fish
fish
omf install bobthefish
git clone https://github.com/ryanoasis/nerd-fonts.git
./nerd-fonts/install.sh
set -g theme_nerd_fonts yes
set -g theme_date_format "+%H:%M"
set -g theme_display_cmd_duration no


echo "tilix preferences default profile command -> custom shell /usr/bin/fish"
echo "tilix preferences default profile color -> color scheme solarized dark"
echo "tilix preferences default profile color -> don't use theme colors for fore/back"
