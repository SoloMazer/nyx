{ inputs, ... }: {
  home.file = {
    ".mozilla/firefox/SoloMazer/user.js".source = ./user.js;
  };

  programs.firefox = {
    enable = true;
    profiles.SoloMazer = {
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        darkreader
        sponsorblock
        surfingkeys
        proton-pass
        proton-vpn
        facebook-container
        multi-account-containers
        side-view
      ];
      search = {
        force = true;
        default = "Google";
        order = [ "Google" "Searxng" ];
        engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [ "@np" ];
          };
          "NixOS Wiki" = {
            urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
            definedAliases = [ "@nw" ];
          };
          "Searxng" = {
            urls = [{ template = "https://searxng.site/"; }];
            definedAliases = [ "@sng" ];
          };
          "Bing".metaData.hidden = true;
          "Google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
        };
      };
    };
  };
}
