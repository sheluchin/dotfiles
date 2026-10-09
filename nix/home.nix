{ ... }:

{
  imports = [
    ./links.nix
    ./packages.nix
  ];

  home.username = "alex";
  home.homeDirectory = "/home/alex";

  # Don't bump without reading the home-manager release notes.
  home.stateVersion = "24.11";

  # Non-NixOS host (Ubuntu): XDG_DATA_DIRS, locale archive, etc.
  targets.genericLinux.enable = true;
  # No GUI apps from nix, so skip the mesa/GPU driver shim (needs sudo setup).
  targets.genericLinux.gpu.enable = false;

  programs.home-manager.enable = true;
}
