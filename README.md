# custom-bluefin-dx

This is my personal rendition of [Fedora Silverblue](https://silverblue.fedoraproject.org/) based on [ublue-os/bluefin](https://github.com/ublue-os/bluefin)-dx with custom modifications and fixes for my workflow. This _may_ be useful for other people to use, but it's specifically tailored for my usage. Use at your own risk.

## Based

This is a fork of [btkostner/silverblue](https://github.com/btkostner/silverblue), tweaked to build Bluefin-dx 38.

As said above, this repository is based off the excellent work of [ublue-os](https://github.com/ublue-os), the [Fedora Silverblue](https://silverblue.fedoraproject.org/) team, the [Flatpak](https://flatpak.org/) project, [ostree](https://github.com/ostreedev/ostree), and a multitude of other projects and people not listed here.

## Usage

I do not provide ISO downloads for this. To do a clean install, you will need to:

1) Install a libostree-based Fedora release on your computer
2) Reboot and [pin your current deployment](https://docs.fedoraproject.org/en-US/fedora-silverblue/faq/#_how_can_i_upgrade_my_system_to_the_next_major_version_for_instance_rawhide_or_an_upcoming_fedora_release_branch_while_keeping_my_current_deployment) in case of issues: `sudo ostree admin pin 0`
3) Run the following command to rebase your system:

```shell
rpm-ostree rebase ostree-unverified-registry:ghcr.io/briorg/custom-bluefin-dx:38
```

## Changes

- [x] Exports a ton of env variables to enforce the usage of the [XDG Base Directory Specification](https://xdgbasedirectoryspecification.com/). Use [xdg-ninja](https://github.com/b3nj5m1n/xdg-ninja) to ensure this list is kept up to date and working.
- [ ] Installs [1Password](https://1password.com) and CLI (not flatpak for browser integration) (See [^1] for caveats)
- [x] Installs [Visual Studio Code (Insiders)](https://code.visualstudio.com/insiders/)
- [x] Installs [`bat`](https://github.com/sharkdp/bat) ~~and replaces `cat`~~ _Replacing `cat` is disabled, because `bat` isn't fully 100% compatible with the GNU `cat` so I prefer using shell aliases in my dotfiles._
- [x] Installs [`delta`](https://github.com/dandavison/delta) for better `git diff`
- [x] Configures `git` to use 1Password for authentication and `delta` for diffs
- [x] Installs the latest version of Firefox from the tar.bz2 package onto the base image, _not_ as a flatpak, for 1Password integration

[^1]: The script that installs 1Password needs some extra steps done after install to overlay onto /opt, and _may_ expect your username to be `bri`. I don't remember exactly what I did (though I'll attempt to fully document this in the future), but I _think_ that I just installed from [1password-latest.tar.gz](https://downloads.1password.com/linux/tar/stable/x86_64/1password-latest.tar.gz) afterwards with [this patch](https://gist.github.com/b-/77413a0107986d1ef42ddba93e8ed9c4) applied to `after-install.sh`.



## License

Unless otherwise stated, code in this repository is licensed under [Apache License 2.0](LICENSE)
