{pkgs, ... }:

{
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Add extra stuff
  environment.systemPackages = (with pkgs; [
    gnome.gnome-tweaks
    kitty
    adw-gtk3
    morewaita-icon-theme
  ]) ++ (with pkgs.gnomeExtensions; [
    appindicator
    desktop-cube
    pop-shell
    blur-my-shell
    rounded-corners
    burn-my-windows
  ]);

  # Remove bloat
  environment.gnome.excludePackages = (with pkgs; [
    gnome-connections
    gnome-console
    epiphany
  ]) ++ (with pkgs.gnome; [
    gnome-contacts
    gnome-music
    gnome-weather
    geary
  ]);
}
