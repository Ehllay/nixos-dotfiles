{pkgs, inputs, user, ...}:

{
  programs.firefox = {
    enable = true;
    profiles.${user} = {
      isDefault = true;
      settings = {
        "browser.search.defaultenginename" = "DuckDuckGo";
	"browser.search.order.1" = "DuckDuckGo";
        "browser.tabs.firefox-view" = false;
	"ui.key.menuAccessKeyFocuses" = false;
	"toolkit.legacyUserProfileCustomizations.stylesheets" = true;
	# Hide new tab garbage
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
	"browser.newtabpage.activity-stream.feeds.system.topstories" = false;

	"privacy.trackingprotection.enabled" = true;
      };
      userChrome = pkgs.lib.strings.concatStringsSep "\n" [
	# Remove useless empty space in corner
	''
	  .titlebar-spacer[type="pre-tabs"] {
	    display: none !important;
	  }
	''
      ];
      search = {
	engines = {
          "Nix Packages" = {
            urls = [{
	      template = "https://search.nixos.org/packages";
	      params = [
	        { name = "type"; value = "packages"; }
	        { name = "query"; value = "{searchTerms}"; }
	      ];
            }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
	    definedAliases = [ "@np" ];
	  };
	  "Nix Options" = {
            urls = [{
	      template = "https://search.nixos.org/options";
	      params = [
	        { name = "type"; value = "options"; }
	        { name = "query"; value = "{searchTerms}"; }
	      ];
            }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
	    definedAliases = [ "@no" ];
	  };
        };
	default = "DuckDuckGo";
	force = true;
      	order = ["DuckDuckGo" "Google"];
      };

    
      bookmarks = [
	{
	  name= "NixOS wiki";
	  tags = ["nixwiki"];
	  keyword = "nixwiki";
	  url = "https://nixos.wiki";
	}
	{
	  name= "NixOS search";
	  tags = ["nixsearch"];
	  keyword = "nixsearch";
	  url = "https://search.nixos.org";
	}
	{
	  name= "Youtube";
	  tags = ["yt"];
	  keyword = "yt";
	  url = "https://youtube.com";
	}
	{
	  name= "Reddit";
	  tags = ["reddit"];
	  keyword = "reddit";
	  url = "https://new.reddit.com";
	}
      ];

      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
	darkreader
	ublock-origin
	localcdn
      ];
    };
  };
}
