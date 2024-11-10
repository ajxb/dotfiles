# DNF aliases
alias dnfi='sudo dnf install'
alias dnfu='sudo dnf update'
alias dnfr='sudo dnf remove'
alias dnfs='dnf search'
alias dnfc='dnf clean all'

# System update alias
alias sysupdate='sudo dnf update && sudo flatpak update'

# Color support
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'

# RPM Fusion support
if [[ -f /etc/yum.repos.d/rpmfusion-free.repo ]]; then
    alias rpmf-install='sudo dnf --enablerepo=rpmfusion-free,rpmfusion-nonfree install'
fi

# AJXB Customizations
command -v lsd > /dev/null && alias ls='lsd --group-dirs first'
command -v lsd > /dev/null && alias tree='lsd --tree'
command -v bat > /dev/null && alias cat='bat --pager=never'
command -v bat > /dev/null && alias less='bat'
