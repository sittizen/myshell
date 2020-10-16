apt install uidmap

su $1 bash get_docker.sh
su $1 curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o ~/.local/bin/docker-compose
su $1 chmod +x ~/.local/bin/docker-compose

set -x DOCKER_HOST unix://$XDG_RUNTIME_DIR/docker.sock
set -U fish_user_paths $HOME/.local/bin/
mkdir ~/.config/fish/completions
wget https://raw.github.com/barnybug/docker-fish-completion/master/docker.fish -O ~/.config/fish/completions/docker.fish
