{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages =
    (with pkgs; [
      krita
      blockbench
    ])
    ++ (with pkgs-unstable; [
      blender
    ]);
}
