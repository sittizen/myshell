# laptop init
this set of scripts installs everything strictly necessary to a python developer ( tested on a freshly installed Ubuntu 18.04 LTS)

as root execute in order :

    bash install_python.sh
    bash install_docker.sh [username]

That's it, once we have a systemwide python and userspace docker installed everything else runs via docker images the user can manage by himself, no need for higher privileges
