{ pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "solomazer";
  home.homeDirectory = "/home/solomazer";
  nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Programs managed via Home-Manager
  programs = {

    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      history = {
        expireDuplicatesFirst = true;
        ignoreAllDups = true;
        ignoreDups = true;
        ignoreSpace = true;
        save = 5000;
        share = true;
        size = 5000;
      };
      historySubstringSearch.enable = true;
      prezto = {
        enable = true;
        prompt.theme = "pure";
      };
      shellAliases = {
        ":q" = "exit";
        c = "clear";
        ls = "ls --color";
      };
    };

    kitty = {
      enable = true;
      font.name = "Hurmit Nerd Font";
      shellIntegration.enableZshIntegration = true;
      settings = {
        font_size = "10.5";
        background_opacity = "0.9";
        hide_window_decorations = true;
        enabled_layouts = "splits"; 
      };
      # Enable once kitty-themes is updated
      # themeFile = "Duskfox";
      # and remove this 
      extraConfig = ''

        # Nightfox colors for Kitty
        ## name: duskfox
        ## upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/duskfox/kitty.conf

        background #232136
        foreground #e0def4
        selection_background #433c59
        selection_foreground #e0def4
        cursor_text_color #232136
        url_color #a3be8c

        # Cursor
        # uncomment for reverse background
        # cursor none
        cursor #e0def4

        # Border
        active_border_color #569fba
        inactive_border_color #4b4673
        bell_border_color #ea9a97

        # Tabs
        active_tab_background #569fba
        active_tab_foreground #191726
        inactive_tab_background #433c59
        inactive_tab_foreground #817c9c

        # normal
        color0 #393552
        color1 #eb6f92
        color2 #a3be8c
        color3 #f6c177
        color4 #569fba
        color5 #c4a7e7
        color6 #9ccfd8
        color7 #e0def4

        # bright
        color8 #47407d
        color9 #f083a2
        color10 #b1d196
        color11 #f9cb8c
        color12 #65b1cd
        color13 #ccb1ed
        color14 #a6dae3
        color15 #e2e0f7

        # extended colors
        color16 #ea9a97
        color17 #eb98c3      
      '';
    };
    
    tmux = {
      enable = true;
      terminal = "screen-256color";
      baseIndex = 1;
      keyMode = "vi";
      mouse = true;
      newSession = true;
      prefix = "C-space";
      plugins = with pkgs.tmuxPlugins; [
        vim-tmux-navigator
        yank
        nord
        prefix-highlight
      ];
      extraConfig = ''
        
        # tmux status bar on top
        set-option -g status-position top

        # Use Alt-arrow keys without prefix key to switch panes
        bind -n M-Left select-pane -L
        bind -n M-Right select-pane -R
        bind -n M-Up select-pane -U
        bind -n M-Down select-pane -D

        # Shift arrow to switch windows
        bind -n S-Left  previous-window
        bind -n S-Right next-window
        
        # Keybindings for tmux-yank
        # use "prefix + [" to enter copy mode
        bind-key -T copy-mode-vi v send-keys -X begin-selection
        bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
        bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
        
        # Split into cwd
        bind '"' split-window -v -c "#{pane_current_path}"
        bind % split-window -h -c "#{pane_current_path}"

      '';
    };
    
    git = {
       enable = true;
       userName = "SoloMazer";
       userEmail = "solomazer@gmail.com";
    };

  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs;[


    # # It is sometimes useful to fine-tune packages, for example, by applying3rd Year Undergraduate, Integrated BS-MS Majoring in 
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (nerdfonts.override { fonts = [ "Hermit" ]; })

    gnome-tweaks
    nautilus
    sushi
    gnome-calendar
    vscode
    okular
    vlc
    vivaldi
    spotify
    discord
    ardour
    obsidian
    # texliveFull
    kitty-themes
    krita
    inkscape

    # Some nice gnome extensions
    gnomeExtensions.pop-shell
    gnomeExtensions.blur-my-shell
    gnomeExtensions.caffeine
    gnomeExtensions.media-controls
    gnomeExtensions.custom-accent-colors
    gnomeExtensions.user-themes
    gnomeExtensions.compiz-alike-magic-lamp-effect
    gnomeExtensions.hide-top-bar
    gnomeExtensions.hot-edge

    #neovim dependencies
    xsel
    ripgrep
    fd

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/solomazer/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "neovim";
    TERMINAL = "kitty";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
