# Load and initialize history search functions
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Keyboard and terminal configuration
if [[ "$TERM" != 'emacs' ]]; then
    typeset -A key
    key=(
        BackSpace  "${terminfo[kbs]}"
        Home       "${terminfo[khome]}"
        End        "${terminfo[kend]}"
        Insert     "${terminfo[kich1]}"
        Delete     "${terminfo[kdch1]}"
        Up         "${terminfo[kcuu1]}"
        Down       "${terminfo[kcud1]}"
        Left       "${terminfo[kcub1]}"
        Right      "${terminfo[kcuf1]}"
        PageUp     "${terminfo[kpp]}"
        PageDown   "${terminfo[knp]}"
    )

    function bind2maps () {
        local i sequence widget
        local -a maps

        while [[ "$1" != "--" ]]; do
            maps+=( "$1" )
            shift
        done
        shift

        sequence="${key[$1]}"
        widget="$2"

        [[ -z "$sequence" ]] && return 1

        for i in "${maps[@]}"; do
            bindkey -M "$i" "$sequence" "$widget"
        done
    }

    # Key bindings
    bind2maps emacs             -- BackSpace   backward-delete-char
    bind2maps       viins       -- BackSpace   vi-backward-delete-char
    bind2maps             vicmd -- BackSpace   vi-backward-char
    bind2maps emacs             -- Home        beginning-of-line
    bind2maps       viins vicmd -- Home        vi-beginning-of-line
    bind2maps emacs             -- End         end-of-line
    bind2maps       viins vicmd -- End         vi-end-of-line
    bind2maps emacs viins       -- Insert      overwrite-mode
    bind2maps             vicmd -- Insert      vi-insert
    bind2maps emacs             -- Delete      delete-char
    bind2maps       viins vicmd -- Delete      vi-delete-char
    bind2maps emacs viins vicmd -- Up          up-line-or-beginning-search
    bind2maps emacs viins vicmd -- Down        down-line-or-beginning-search
    bind2maps emacs             -- Left        backward-char
    bind2maps       viins vicmd -- Left        vi-backward-char
    bind2maps emacs             -- Right       forward-char
    bind2maps       viins vicmd -- Right       vi-forward-char

    # Terminal handling
    if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
        function zle-line-init () {
            emulate -L zsh
            printf '%s' ${terminfo[smkx]}
        }
        function zle-line-finish () {
            emulate -L zsh
            printf '%s' ${terminfo[rmkx]}
        }
        zle -N zle-line-init
        zle -N zle-line-finish
    else
        for i in {s,r}mkx; do
            (( ${+terminfo[$i]} )) || fedora_missing_features+=($i)
        done
        unset i
    fi

    unfunction bind2maps
fi
