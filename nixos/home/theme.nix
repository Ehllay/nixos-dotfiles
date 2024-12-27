{ pkgs, ... }:

{
 gtk = {
  enable = true;
  theme = {
    name = "adw-gtk3";
    package = pkgs.adw-gtk3;
  };
  iconTheme = {
    package = pkgs.morewaita-icon-theme;
    name = "MoreWaita";
  };
 };
}
