Dotfiles
========

My home directory, managed by a [home-manager](https://github.com/nix-community/home-manager)
flake on Ubuntu. Full reference: **[nix/README.md](nix/README.md)**.

How it works
------------

- **`~/dotfiles` is the source of truth.** `flake.nix` describes the whole home
  directory; `home-manager` applies it.
- **Configs are live symlinks.** `nix/links.nix` maps `~/.tmux.conf` → `~/dotfiles/.tmux.conf`
  and so on. Edit the repo file and it's live; no rebuild.
- **Only links go into `/nix/store`**, never file contents, so `.ssh` and `.gnupg` stay out.
- **CLI tools come from Nix**, listed in `nix/packages.nix` and pinned in `flake.lock`.
  GUI apps (sway, waybar) and neovim stay on apt / `~/.local/bin`.
- **Every switch is a generation**, so you can roll back.

How to use it
-------------

Run tasks from `~/dotfiles`. `bb tasks` lists them all.

| You want to…              | Do this                                                      |
|---------------------------|--------------------------------------------------------------|
| Edit a config             | Edit the file in `~/dotfiles`. Done.                         |
| Track a new tool's config | `bb home:adopt ~/.config/foo`, then commit                   |
| Add a CLI tool            | Add it to `nix/packages.nix`, then `bb home:switch` (or `hms`) |
| Update all tools          | `bb home:update`, read the diff, then `bb home:switch`       |
| Something's off           | `bb home:check`                                              |
| Undo the last switch      | `bb home:rollback`                                           |

Gotchas
-------

1. **New files under `nix/` need `git add -N`.** Flakes can't see untracked files.
   `home:build` and `home:switch` warn about this.
2. **"Would be clobbered" error** means an app replaced a link with a plain file when
   saving. Copy that file into the repo, delete it from `~`, switch again.

More gotchas, the repo layout, new-machine setup and TODOs: [nix/README.md](nix/README.md).
