#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# load ssh_keys
eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
