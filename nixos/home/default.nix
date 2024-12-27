{user, ...}: {
  imports = [
    # ./hyprland
    ./programs
    ./git.nix
    ./homeSecrets.nix
    ./nixvim.nix
    ./xdg.nix
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
  };

  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
