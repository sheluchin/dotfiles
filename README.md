Dotfiles
========

Managed by [home-manager](https://github.com/nix-community/home-manager) as a flake.
Configs are live symlinks into this repo, so edits apply without a rebuild.

Install (needs Nix with flakes):

    nix run home-manager/master -- switch --flake ~/dotfiles#alex

After that, apply changes with `hms` (alias in `.bash/aliases`).

- Add a config file: one line in `nix/links.nix`, then `hms`.
- Add a CLI tool: one line in `nix/packages.nix`, then `hms`.
- Update pinned versions: `nix flake update`, then `hms`.

TODO
----

- neovim: not managed by nix yet. `~/.local/bin/nvim` is 0.11.6, nixpkgs has
  0.12.x; test the fennel config against 0.12 before adding it to `nix/packages.nix`.
- Legacy top-level links (`~/git`, `~/nvim`, `~/tags`, `~/keyrings`): probably droppable.
