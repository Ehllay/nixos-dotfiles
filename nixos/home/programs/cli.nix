{pkgs, ... }:

{
  home.packages = with pkgs; [
    hyfetch 
    pfetch-rs
    lsd
    bat
    btop
    tree
    ffmpeg
    ripgrep
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source

      alias ls lsd
      PF_INFO="ascii title os wm kernel uptime pkgs memory" pfetch
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$username$hostname$directory$rust$python$nix_shell$git_branch$git_state$git_status$character";
      username = {
	style_user = "purple";
	show_always = true;
	format = "[$user]($style)";
      };
      hostname = {
	ssh_only = false;
	format = "@[$ssh_symbol$hostname]($style) ";
	style = "purple";
      };
      
      git_branch = {
	symbol = " ";
	format = "[$symbol$branch]($style) ";
	style = "bright-black";
      };

      git_status = {
	format = "([$all_status$ahead_behind]($style)) ";
	style = "cyan";
      };
      git_state = {
	format = "\([$state( $progress_current/$progress_total)]($style)\) ";
	style = "bright-black";
      };

      rust = {
	symbol = "󱘗 ";
	format = "[$symbol]($style) "; 
      };
      
      nix_shell = {
	symbol = " ";
	format = "[$symbol]($style) ";
      };
    };
  };
}
