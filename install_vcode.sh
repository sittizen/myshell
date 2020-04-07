su $1 wget "https://go.microsoft.com/fwlink/?LinkID=760868" -O - > vcode.deb
dpkg -i vcode.deb
rm vcode.deb

cat > ~/.config/Code/user/settings.json <<EOF
{
    "python.pythonPath": "/usr/bin/python3.6",
    "editor.fontFamily": "'FiraCode Nerd Font Mono', monospace",
    "editor.fontSize": 15,
    "editor.fontLigatures": true,
    "files.enableTrash": false,
}
EOF