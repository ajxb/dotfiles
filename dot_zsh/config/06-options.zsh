# ZSH options
#setopt AUTO_CD             # If a command is a directory name, cd to it
#setopt EXTENDED_GLOB       # Enable extended globbing
#setopt NOTIFY              # Report status of background jobs immediately
#setopt APPEND_HISTORY      # Append to history instead of overwriting
#setopt INC_APPEND_HISTORY  # Add commands to history as they are typed
#setopt HIST_IGNORE_DUPS    # Don't store duplicated commands
#setopt HIST_REDUCE_BLANKS  # Remove superfluous blanks from history

# DNF options
export DNFOPT="--setopt=install_weak_deps=False"
