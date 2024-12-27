{config, pkgs, ...}:


# let
#   hyprConfig = pkgs.writeText "greetd-hyprland-config" ''
#     exec-once = gtkgreet; hyprctl dispatch exit 
#   '';
# in
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    # If cursor is invisible
    # WLR_NO_HARDWARE_CURSORS = "1";

    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    opengl.enable = true;
  };

  # Enable greetd
 #  services.greetd = {
 #    enable = true;
 #    settings = {
 #      default_session = {
	# command = "${pkgs.hyprland}/bin/Hyprland";
	# user = "ehllay";
 #      };
 #      initial_session = {
	# command = pkgs.writeShellScript "greeter" ''
	#   export XKB_DEFAULT_LAYOUT=${config.services.xserver.xkb.layout}
	#   export XCURSOR_THEME=Adwaita
	#
	#   ${pkgs.hyprland}/bin/Hyprland --config ${hyprConfig}
	# '';
	# user = "greeter";
 #      };
 #    };
 #  };
 #  environment.etc."greetd/environments".text = ''
 #    Hyprland
 #  '';


  # Polkit
  security = {
    polkit.enable = true;
  };

  # Portals
  xdg.portal = {
    enable = true;
    # extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Extras
  environment.systemPackages = with pkgs; [
    # Essentials
    kitty
    wl-clipboard-rs
    wl-gammactl
    hyprpicker
    # Looks
    ironbar
    ags
    matugen
    swww
    # Nautilus & Gnome software
    gnome.nautilus
    gnome.totem
    gnome.baobab
    gnome.sushi
    nautilus-open-any-terminal
    loupe
    gnome.gnome-calendar
    gnome.gnome-control-center
    gnome.gnome-calculator
    gnome.gnome-clocks
    # Screenshots
    grim
    slurp
    swappy
    # Other
    avizo
    swaynotificationcenter
    playerctl
  ];
}
