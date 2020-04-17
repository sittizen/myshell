apt install -y python3
update-alternatives --install /usr/bin/python python /usr/bin/python3 10
apt install -y python3-pip
update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 10

pip install virtualfish
vf install

