alias git-prune="git branch --merged | egrep -v '(^\*|master|dev|production|test)' | xargs git branch -d" 
alias vt="set -Ux VAULT_TOKEN (vault login -method=oidc -token-only 2>/dev/null)"
alias vr="vault token renew $VAULT_TOKEN"
alias standup="git-standup -d $argv -a simone.cittadini && git-standup -d $argv -a franco.atzori && git-standup -d $argv -a dario.giarratana && git-standup -d $argv -a alfredo.guarnieri && git-standup -d $argv -a umberto.bertonelli"
alias cdp="cd ~/workspace/pycc"
alias cdpd="cd ~/workspace/pycc-dpe"
alias czc="git add -A . && cz commit"
alias cat="batcat -p"
alias fn="fzf -q"
alias gn="grep -inR --color=always \"$argv\" *"
alias l="exa -1 -l --classify --color-scale --icons"
alias lr="exa -1 -l --classify --color-scale --icons -T"