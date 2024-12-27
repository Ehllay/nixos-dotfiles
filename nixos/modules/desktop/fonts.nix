{pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    corefonts
    (nerdfonts.override { fonts = [ "JetBrainsMono"]; })
  ];
}
