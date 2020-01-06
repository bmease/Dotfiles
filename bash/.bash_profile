#
# ~/.bash_profile
#

# Add cargo to path if present on system
if [ -d $HOME/.cargo/bin ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi


# Add yarn to path if present on system
if [ -d $HOME/.yarn/bin ]; then
    export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc

# load ssh_keys if keychain exists
if command -v keychain 2>/dev/null; then
    eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
fi
