# CLI tools. GUI/compositor stuff (sway, waybar, dunst, wofi) stays on apt.
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # TODO neovim: not managed yet. ~/.local/bin/nvim is 0.11.6, nixpkgs has
    # 0.12.x; test the fennel config against 0.12 before adding it here.
    tmux
    ripgrep
    fd
    fzf
    jq
    direnv
    bat
    babashka
    clj-kondo
  ];
}
