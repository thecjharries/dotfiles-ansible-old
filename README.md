# `dotfiles`

This is my attempt to maintain a unified environment. Right now it works on Fedora 27. It might not work anywhere else. I have Ansible roles for

* installing common libraries
* installing and configuring `git`
* installing and configuring `nano`
* getting repos for, installing, and configuring `node` and `yarn`
* loading patched Powerline fonts
* setting up Python 2 and 3
* installing and configuring `exa` by way of `cargo`/`rust`
* building and configuring `tmux` and `tpm`
* installing and customizing `zsh` by way of `prezto`
* getting the repo for and installing `subl`
* installing and configuring `terminator`
* installing and configuring `i3`

## Security

There's nothing you can't discover via Google stored in this repo (e.g. SSH keys, IP addresses, auth tokens, etc.). All of that's run locally by Ansible vault and some explicitly ignored files.

## Usage

All of the config is how I like things, so you might not like it. That being siad, you're more than welcome to use this. Something like this will get you started:

```yml
# Built around v0.2.0
---
- hosts: development

  roles:
    - role: common_software
    - role: git
    - role: nano
    - role: javascript
    - role: powerline_patched
    - role: python
    - role: rust
    - role: tmux
    - role: prezto
    - role: sublime
    - role: terminator
    - role: i3
```
