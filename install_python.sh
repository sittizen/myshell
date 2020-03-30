sudo apt install python3       
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 10
sudo apt install python3-pip
sudo update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 10
pip install doit
sudo update-alternatives --install /usr/bin/doit doit ~/.local/bin/doit 10
