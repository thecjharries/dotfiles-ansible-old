# `dotfiles`

This is my attempt to maintain a unified environment. Right now it works on Fedora 27. It might not work anywhere else. At the moment, I have at least basic tests in Fedora with every component, so I'm pretty sure it works there.

## Security

There's nothing you can't discover via Google stored in this repo (e.g. SSH keys, IP addresses, auth tokens, etc.). All of that's run locally by Ansible vault and some explicitly ignored files.

## Where's all the code?

I've split everything out into its own role to make updates and management way easier.

### Meta
* [`dotfiles-images`](https://github.com/thecjharries/dotfiles-images) holds the Docker images I'm using to test everything.
* [`dotfiles-host-dev`](https://github.com/thecjharries/dotfiles-host-dev) is the only host I have built right now. It runs my primary dev config.

### Components

#### Internal Use
* [`dotfiles-role-generic-template`](https://github.com/thecjharries/dotfiles-role-generic-template) handles the majority of the user config templating.
* [`dotfiles-role-package-installer`](https://github.com/thecjharries/dotfiles-role-package-installer) installs packages with a common set of options.
* [`dotfiles-role-repo-installer`](https://github.com/thecjharries/dotfiles-role-repo-installer) grabs remote `git` URLs in a coordinated way.

#### Components
* [`dotfiles-role-common-software`](https://github.com/thecjharries/dotfiles-role-common-software) installs libraries that don't really belong to a single package.
* [`dotfiles-role-git`](https://github.com/thecjharries/dotfiles-role-git) installs and configures `git`.
* [`dotfiles-role-i3`](https://github.com/thecjharries/dotfiles-role-i3) installs and configures `i3` and its components.
* [`dotfiles-role-javascript`](https://github.com/thecjharries/dotfiles-role-javascript) loads, installs, and configures major JS libraries (Node, Yarn).
* [`dotfiles-role-nano`](https://github.com/thecjharries/dotfiles-role-nano) installs and configures `nano` with some extra stuff.
* [`dotfiles-role-powerline-patched`](https://github.com/thecjharries/dotfiles-role-powerline-patched) configures patched Powerline fonts.
* [`dotfiles-role-prezto`](https://github.com/thecjharries/dotfiles-role-prezto) installs and configures `zsh` by way of `prezto`.
* [`dotfiles-role-python`](https://github.com/thecjharries/dotfiles-role-python) sets up Python 2 and 3 as well as `pip` and some libraries.
* [`dotfiles-role-rust`](https://github.com/thecjharries/dotfiles-role-rust) installs `exa` (also sorta `cargo`).
* [`dotfiles-role-sublime`](https://github.com/thecjharries/dotfiles-role-sublime) loads and installs `subl`.
* [`dotfiles-role-terminator`](https://github.com/thecjharries/dotfiles-role-terminator) installs and configures `terminator`.
* [`dotfiles-role-tmux`](https://github.com/thecjharries/dotfiles-role-tmux) builds `tmux` from source and installs `tpm`.

## How does that work?

Something like this should launch this:

```sh-session
$ cd /path/to/repo
$ $EDITOR site.yml
```

```yml
---
- hosts: all

  roles:
  - role: dotfiles-host-dev
```

```sh-session
$ ansible-galaxy -r req.yml install
$ ansible-playbook site.yml
No config file found; using defaults
 [WARNING]: Unable to parse /etc/ansible/hosts as an inventory source
...
```

The [`dotfiles-host-dev` build log](https://travis-ci.org/thecjharries/dotfiles-host-dev) might give you a few more ideas.
