#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# load ssh_keys if keychain exists
if command -v keychain 2>/dev/null; then
    eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
fi
