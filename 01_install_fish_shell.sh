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

# in ~/.config/fish/conf.d/aliases.fish

alias git-prune="git branch --merged | egrep -v '(^\*|master|dev|production|test)' | xargs git branch -d" 
alias vt="set -Ux VAULT_TOKEN (vault login -method=oidc -token-only 2>/dev/null)"
alias vr="vault token renew $VAULT_TOKEN"
alias standup="git-standup -d 1 -a simone.cittadini && git-standup -d 1 -a franco.atzori && git-standup -d 1 -a dario.giarratana && git-standup -d 1 -a alfredo.guarnieri && git-standup -d 1 -a marco.robutti"
alias cdp="cd ~/workspace/pycc && code ."
alias cdpd="cd ~/workspace/pycc-dpe"
alias czc="git add -A . && cz commit"
alias cat="bat -p"
