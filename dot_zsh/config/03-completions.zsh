# Configure the file compinstall should modify
zstyle :compinstall filename '$ZDOTDIR/.zshrc'

# Define completion styles
zstyle ':completion:*' menu select # Interactive completion menu
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # Colored completion menu
zstyle ':completion:*' verbose yes # Verbose completion info
zstyle ':completion:*:descriptions' format '%F{green}-- %d --%f' # Format descriptions
zstyle ':completion:*:messages' format '%d' # Format messages
zstyle ':completion:*:warnings' format '%F{red}No matches for:%f %d' # Format warnings
zstyle ':completion:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f' # Format corrections

# Completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zcompcache

# Group completions
zstyle ':completion:*' group-name ''

# Path completion for specific commands
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin \
                                          /usr/local/bin  \
                                          /usr/sbin       \
                                          /usr/bin        \
                                          /sbin           \
                                          /bin            \
                                          /usr/X11R6/bin  \
                                          /var/lib/snapd/snap/bin \
                                          /usr/lib/flatpak/bin

# DNF completion configuration
zstyle ':completion:*:dnf:*' menu select
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'

# Initialize completion system
autoload -Uz compinit
compinit
