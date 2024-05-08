FROM ghcr.io/ublue-os/bluefin-dx:39

# Run all the custom scripts
ADD --chmod=0755 scripts/* /tmp/


RUN /tmp/cleanup.sh

RUN /tmp/1password.sh
RUN /tmp/bat.sh
RUN /tmp/delta.sh
RUN /tmp/getfirefox.sh
RUN /tmp/git.sh
#RUN /tmp/code-insiders.sh

RUN wget https://gitlab.gnome.org/Teams/Design/os-mockups/uploads/4d8e57447a2b2bfb4bf281d7c70bf0cb/activities-filled-pill_verdre.zip && \
    unzip -d /usr/share/gnome-shell/extensions/ activities-filled-pill_verdre.zip

RUN rpm-ostree cleanup -m && ostree container commit

# Overlay custom files on the fs
ADD root/ /
