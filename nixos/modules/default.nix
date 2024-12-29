{
  imports = [
    ./desktop
    # Import secrets if file exists else skip
    (
      if builtins.pathExists ./secrets.nix
      then ./secrets.nix
      else {}
    )
  ];
}
