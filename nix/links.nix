# Live symlinks into ~/dotfiles. Only the link target goes into /nix/store,
# so edits apply immediately and secrets (.ssh, .gnupg) never get copied.
# To add a config: add one line here, then run `hms`.
{ config, ... }:

let
  link = path: config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dotfiles/${path}";
in
{
  home.file = {
    # Shell
    ".bash".source = link ".bash";
    ".bashrc".source = link ".bashrc";
    ".bash_profile".source = link ".bash_profile";
    ".tmux.conf".source = link ".tmux.conf";
    ".git_template".source = link ".git_template";

    # Keys
    ".ssh".source = link ".ssh";
    ".gnupg/gpg.conf".source = link ".gnupg/gpg.conf";
    ".gnupg/gpg-agent.conf".source = link ".gnupg/gpg-agent.conf";

    ".ipython/profile_default/ipython_config.py".source =
      link ".ipython/profile_default/ipython_config.py";
    ".ipython/terminal".source = link ".ipython/terminal";

    ".local/share/applications/dbeaver.desktop".source =
      link ".local/share/applications/dbeaver.desktop";
    ".local/share/applications/freeplane.desktop".source =
      link ".local/share/applications/freeplane.desktop";

    # Agents (formerly the `agents` stow package)
    ".agents".source = link "agents/.agents";
    ".claude/CLAUDE.md".source = link "agents/.claude/CLAUDE.md";
    ".claude/settings.json".source = link "agents/.claude/settings.json";
    ".codex/AGENTS.md".source = link "agents/.codex/AGENTS.md";
    ".pi/agent/AGENTS.md".source = link "agents/.pi/agent/AGENTS.md";

    # herdr agent integrations (formerly the `herdr` stow package)
    ".claude/hooks/herdr-agent-state.sh".source =
      link "herdr/.claude/hooks/herdr-agent-state.sh";
    ".pi/agent/extensions/herdr-agent-state.ts".source =
      link "herdr/.pi/agent/extensions/herdr-agent-state.ts";

    # Legacy top-level links; candidates to drop
    "git".source = link ".config/git";
    "nvim".source = link ".config/nvim";
    "tags".source = link "tags";
    "keyrings".source = link "keyrings";
  };

  xdg.configFile = {
    "git".source = link ".config/git";
    "nvim".source = link ".config/nvim";
    "sway".source = link "sway/.config/sway";
    "waybar".source = link "waybar/.config/waybar";
    "dunst".source = link "dunst/.config/dunst";
    "herdr/config.toml".source = link "herdr/.config/herdr/config.toml";
    "opencode/AGENTS.md".source = link "agents/.config/opencode/AGENTS.md";
  };
}
