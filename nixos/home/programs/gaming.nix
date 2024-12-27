{pkgs, ...}: {
  home.packages = with pkgs; [
    # Minecraft
    (prismlauncher.override {
      withWaylandGLFW = true;
    })
    mangohud
  ];
}
