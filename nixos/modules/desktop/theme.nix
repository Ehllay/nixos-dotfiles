{ pkgs, ... }:

{
  programs.dconf.enable = true;

  stylix = {
    enable = true;

    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/tokyo-night/wallpapers/main/misc/cityscape/neon-sign_00_1920x1080.jpg";
      sha256 = "0bwqyhvp4n4vxjr9v3p0vgg28grzp6g3ihbgsg77i9xrcymwaiqm";
    };

    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";   

    opacity.terminal = 0.95;

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Classic";
      size = 22;
    };

    fonts = {
      sizes.applications = 11;
      monospace = {
	package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
	name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
	package = pkgs.noto-fonts;
	name = "Noto Sans";
      };
      serif = {
	package = pkgs.noto-fonts;
	name = "Noto Serif";
      };
      emoji = {
	package = pkgs.noto-fonts-emoji;
	name = "Noto Color Emoji";
      };
    };
  };
}
