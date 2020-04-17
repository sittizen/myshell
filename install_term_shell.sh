apt install tilix fish

curl -L https://get.oh-my.fish | fish
fish
omf install bobthefish
git clone https://github.com/ryanoasis/nerd-fonts.git
./nerd-fonts/install.sh
set -U theme_date_format "+%H:%M"
set -U theme_display_cmd_duration no
set -x DOCKER_HOST unix://$XDG_RUNTIME_DIR/docker.sock
set -U fish_user_paths $HOME/.local/bin/
mkdir ~/.config/fish/completions
wget https://raw.github.com/barnybug/docker-fish-completion/master/docker.fish -O ~/.config/fish/completions/docker.fish


echo "tilix preferences default profile command -> run as login shell"
echo "tilix preferences default profile command -> custom shell /usr/bin/fish"
echo "tilix preferences default profile color -> color scheme solarized dark"
echo "tilix preferences default profile color -> don't use theme colors for fore/back"
