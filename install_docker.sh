apt install uidmap
su $1 bash get_docker.sh
su $1 curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o ~/.local/bin/docker-compose
su $1 chmod +x ~/.local/bin/docker-compose