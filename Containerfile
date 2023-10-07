FROM ghcr.io/ublue-os/kinoite-main:39

# Run all the custom scripts
ADD --chmod=0755 scripts/* /tmp/


RUN /tmp/cleanup.sh

# 1Password is disabled for now. Install it as an overlay.
#RUN /tmp/1password2.sh
RUN /tmp/bat.sh
RUN /tmp/delta.sh
RUN /tmp/getfirefox.sh
#RUN /tmp/git.sh
RUN /tmp/code-insiders.sh


RUN rpm-ostree cleanup -m && ostree container commit

# Overlay custom files on the fs
ADD root/ /
