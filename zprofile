# fix for WSL not starting ssh-agent on boot
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    grep -slR PRIVATE ~/.ssh/ | xargs ssh-add
fi

export TENDS_TO=42
