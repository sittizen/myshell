set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

source $OMF_PATH/init.fish

set -g theme_use_abbreviated_branch_name yes
set -g theme_git_worktree_support yes
