{ pkgs, ... }:
let
  #currently using nord theme
  colorscheme.palette = {
    base00 = "#2E3440";
    base01 = "#3B4252";
    base02 = "#434C5E";
    base03 = "#4C566A";
    base04 = "#D8DEE9";
    base05 = "#E5E9F0";
    base06 = "#ECEFF4";
    base07 = "#8FBCBB";
    base08 = "#BF616A";
    base09 = "#D08770";
    base0A = "#EBCB8B";
    base0B = "#A3BE8C";
    base0C = "#88C0D0";
    base0D = "#81A1C1";
    base0E = "#B48EAD";
    base0F = "#5E81AC";
  };
  gtkCss = ''
    @define-color destructive_bg_color ${colorscheme.palette.base08};
    @define-color destructive_fg_color ${colorscheme.palette.base06};
    @define-color success_bg_color ${colorscheme.palette.base0B};
    @define-color success_fg_color ${colorscheme.palette.base06};
    @define-color warning_bg_color ${colorscheme.palette.base0A};
    @define-color warning_fg_color rgba(${colorscheme.palette.base00}, 0.8);
    @define-color error_bg_color ${colorscheme.palette.base08};
    @define-color error_fg_color ${colorscheme.palette.base06};

    @define-color accent_color oklab(from ${colorscheme.palette.base0D} min(l, 0.5) a b);
    @define-color destructive_color oklab(from ${colorscheme.palette.base08} min(l, 0.5) a b);
    @define-color success_color oklab(from ${colorscheme.palette.base0B} min(l, 0.5) a b);
    @define-color warning_color oklab(from ${colorscheme.palette.base0A} min(l, 0.5) a b);
    @define-color error_color oklab(from ${colorscheme.palette.base08} min(l, 0.5) a b);

    @define-color window_bg_color ${colorscheme.palette.base00};
    @define-color window_fg_color rgba(${colorscheme.palette.base05}, 0.8);
    @define-color view_bg_color ${colorscheme.palette.base01};
    @define-color view_fg_color rgba(${colorscheme.palette.base05}, 0.8);
    @define-color headerbar_bg_color ${colorscheme.palette.base02};
    @define-color headerbar_fg_color rgba(${colorscheme.palette.base05}, 0.8);
    @define-color headerbar_border_color ${colorscheme.palette.base03};
    @define-color headerbar_backdrop_color ${colorscheme.palette.base00};
    @define-color headerbar_shade_color rgba(${colorscheme.palette.base03}, 0.12);
    @define-color headerbar_darker_shade_color rgba(${colorscheme.palette.base03}, 0.12);

    @define-color sidebar_bg_color ${colorscheme.palette.base01};
    @define-color sidebar_fg_color rgba(${colorscheme.palette.base05}, 0.8);
    @define-color sidebar_backdrop_color ${colorscheme.palette.base02};
    @define-color sidebar_shade_color rgba(${colorscheme.palette.base03}, 0.07);
    @define-color sidebar_border_color rgba(${colorscheme.palette.base03}, 0.07);

    @define-color secondary_sidebar_bg_color ${colorscheme.palette.base02};
    @define-color secondary_sidebar_fg_color rgba(${colorscheme.palette.base05}, 0.8);
    @define-color secondary_sidebar_backdrop_color ${colorscheme.palette.base03};
    @define-color secondary_sidebar_shade_color rgba(${colorscheme.palette.base03}, 0.07);
    @define-color secondary_sidebar_border_color rgba(${colorscheme.palette.base03}, 0.07);

    @define-color card_bg_color ${colorscheme.palette.base02};
    @define-color card_fg_color rgba(${colorscheme.palette.base05}, 0.8);
    @define-color card_shade_color rgba(${colorscheme.palette.base03}, 0.07);

    @define-color dialog_bg_color ${colorscheme.palette.base00};
    @define-color dialog_fg_color rgba(${colorscheme.palette.base05}, 0.8);

    @define-color popover_bg_color ${colorscheme.palette.base01};
    @define-color popover_fg_color rgba(${colorscheme.palette.base05}, 0.8);
    @define-color popover_shade_color rgba(${colorscheme.palette.base03}, 0.07);

    @define-color thumbnail_bg_color ${colorscheme.palette.base02};
    @define-color thumbnail_fg_color rgba(${colorscheme.palette.base05}, 0.8);

    @define-color shade_color rgba(${colorscheme.palette.base03}, 0.07);
    @define-color scrollbar_outline_color ${colorscheme.palette.base06};

    :root {
      --standalone-color-oklab: min(l, 0.5) a b;
      --accent-color: oklab(from var(--accent-bg-color) var(--standalone-color-oklab));
      --destructive-color: oklab(from var(--destructive-bg-color) var(--standalone-color-oklab));
      --success-color: oklab(from var(--success-bg-color) var(--standalone-color-oklab));
      --warning-color: oklab(from var(--warning-bg-color) var(--standalone-color-oklab));
      --error-color: oklab(from var(--error-bg-color) var(--standalone-color-oklab));
    }
  '';
in
{
  # Enable GTK and related
  gtk.enable = true;
  gtk.iconTheme = {
    package = pkgs.papirus-nord;
    name = "Papirus-Dark";
  };
  gtk.cursorTheme = {
    package = pkgs.bibata-cursors-translucent;
    name = "Bibata_Spirit";
  };
  gtk = { 
    theme = {
      package = pkgs.nordic;
      name = "Nordic";
    };
    # gtk4.extraCss = gtkCss;
    # gtk3.extraCss = gtkCss;
  };

  # Qt theming
  qt.enable = true;
  qt.platformTheme.name = "gtk";
  qt.style = {  
    name = "adwaita-dark";
    package = pkgs.adwaita-qt;
  };
}

