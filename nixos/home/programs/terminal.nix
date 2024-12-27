{
  programs.kitty = {
    enable = true;
    font.size = 11;
    shellIntegration.enableFishIntegration = true;
    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      background_blur = 6;
      hide_window_decorations = true;
    };
  };
}
