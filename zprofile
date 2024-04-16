# fix for WSL not starting ssh-agent on boot
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    grep -slR PRIVATE ~/.ssh/ | xargs ssh-add
fi

# fix for firefox using xwayland instead of wayland native
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
	export GDK_BACKEND=wayland
fi

# make AUR packages not compress, since they immediately get
# decompressed anyway
export PKGEXT=pkg.tar

export TENDS_TO=42
