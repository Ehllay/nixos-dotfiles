{user, ...}: {
  imports = [
    # ./hyprland
    ./programs
    ./git.nix
    ./nixvim.nix
    ./xdg.nix
    # Import secrets if file exists else skip
    (
      if builtins.pathExists ./homeSecrets.nix
      then ./homeSecrets.nix
      else {}
    )
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
  };

  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
