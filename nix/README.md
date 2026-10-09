Home directory (home-manager)
=============================

Full reference for the Nix setup. Short version: [../README.md](../README.md).

Tasks
-----

All operations are [babashka](https://babashka.org) tasks in `bb.edn`.
Run them from `~/dotfiles` (`cd ~/dotfiles && bb <task>`). `hms` is a shortcut for `bb home:switch` from anywhere.

| Command                         | What it does                                                     |
|---------------------------------|------------------------------------------------------------------|
| `bb home:adopt ~/.config/x`     | Move `~/.config/x` into the repo, link it back, and switch       |
| `bb home:switch` (or `hms`)     | Build and activate. Conflicting files get renamed to `*.hm-bak`  |
| `bb home:build`                 | Dry run: build without touching `~`                              |
| `bb home:diff`                  | Build, then list package changes vs. what's active               |
| `bb home:update`                | Bump nixpkgs + home-manager, then show the diff (doesn't switch) |
| `bb home:check`                 | Every link target exists in the repo; every link in `~` resolves |
| `bb home:rollback`              | Activate the previous generation (asks first)                    |
| `bb home:gens` / `bb home:news` | List generations / read home-manager release news                |
| `bb home:gc`                    | Expire generations older than 30 days, then `nix store gc`       |

Run `bb tasks` for the full list (all under `home:`).

Common jobs
-----------

**Track a new tool's config**

    bb home:adopt ~/.config/foo                     # stored at ~/dotfiles/.config/foo
    bb home:adopt ~/.config/foo --to foo/.config/foo  # per-tool dir, like sway/ and herdr/
    git add nix/links.nix .config/foo && git commit

**Install a CLI tool:** add it to `nix/packages.nix`, then `bb home:switch`.
Search names with `nix search nixpkgs <name>`.

**Update everything:** `bb home:update`, read the diff, then `bb home:switch`.
Undo with `git checkout flake.lock`.

Layout
------

| Path               | Purpose                                                          |
|--------------------|------------------------------------------------------------------|
| `flake.nix`        | Inputs (nixpkgs-unstable, home-manager), `homeConfigurations.alex` |
| `flake.lock`       | Pinned versions. Commit it.                                      |
| `nix/home.nix`     | Top-level module: user, `stateVersion`, imports                  |
| `nix/links.nix`    | Every symlink from `~` into this repo                            |
| `nix/packages.nix` | CLI packages                                                     |
| `nix/README.md`    | This file                                                        |
| `bb.edn`, `bb/`    | The bb tasks                                                     |

Links use `config.lib.file.mkOutOfStoreSymlink`, so `~/.x` → `/nix/store/…-hm_.x` →
`~/dotfiles/.x`. Only the link goes into `/nix/store`; file contents (including
`.ssh` and `.gnupg`) are never copied there.

Gotchas
-------

- **Flakes ignore untracked files.** New files under `nix/` need `git add -N` before
  building. `bb home:build` and `bb home:switch` warn about this.
- **Some apps replace symlinks with plain files** when they save (e.g. `~/.claude/settings.json`).
  The next switch then fails with "would be clobbered". Copy the file back into the repo,
  delete it from `~`, and switch again.
- **Don't roll back to generation 23 or earlier.** Those come from the old channel-based
  setup, which had no links; activating one removes every link in `~`.
- **GUI apps stay on apt** (sway, waybar, dunst, wofi). Nix-built GUI apps need GPU
  driver setup on Ubuntu, which is turned off in `nix/home.nix`.

New machine
-----------

1. Install Nix with flakes enabled.
2. `git clone <this repo> ~/dotfiles`
3. `nix run home-manager/master -- switch --flake ~/dotfiles#alex -b hm-bak`

TODO
----

- neovim: not managed by nix yet. `~/.local/bin/nvim` is 0.11.6, nixpkgs has
  0.12.x; test the fennel config against 0.12 before adding it to `nix/packages.nix`.
- Remove leftover linuxbrew / `~/.local/bin` copies of tools nix now provides.
- Legacy top-level links (`~/git`, `~/nvim`, `~/tags`, `~/keyrings`): probably droppable.
