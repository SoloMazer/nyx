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

  gtk = {
    enable = true;
    theme = {
      package = pkgs.nordic;
      name = "Nordic";
    };
    iconTheme = {
      package = pkgs.papirus-nord;
      name = "Papirus-Dark";
    };
    cursorTheme = {
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-cursors";
      size = 16;
    };
  };

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
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
        ];
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
      };
      extraConfig = ''

        # Nord Colorscheme for Kitty
        # Based on:
        # - https://gist.github.com/marcusramberg/64010234c95a93d953e8c79fdaf94192
        # - https://github.com/arcticicestudio/nord-hyper

        foreground            #D8DEE9
        background            #2E3440
        selection_foreground  #000000
        selection_background  #FFFACD
        url_color             #0087BD
        cursor                #81A1C1

        # black
        color0   #3B4252
        color8   #4C566A

        # red
        color1   #BF616A
        color9   #BF616A

        # green
        color2   #A3BE8C
        color10  #A3BE8C

        # yellow
        color3   #EBCB8B
        color11  #EBCB8B

        # blue
        color4  #81A1C1
        color12 #81A1C1

        # magenta
        color5   #B48EAD
        color13  #B48EAD

        # cyan
        color6   #88C0D0
        color14  #8FBCBB

        # white
        color7   #E5E9F0
        color15  #ECEFF4

      '';
    };
    
    tmux = {
      enable = true;
      terminal = "screen-256color";
      baseIndex = 1;
      keyMode = "vi";
      mouse = true;
      shell = "/run/current-system/sw/bin/zsh";
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

    firefox = {
      enable = true;
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

    # # It is sometimes useful to fine-tune packages, for example, by applying 
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
    texliveFull
    kitty-themes
    krita
    inkscape
    captive-browser
    motrix
    ferdium
    onlyoffice-desktopeditors

    # Some nice gnome extensions
    gnomeExtensions.pop-shell
    gnomeExtensions.blur-my-shell
    gnomeExtensions.caffeine
    gnomeExtensions.media-controls
    gnomeExtensions.user-themes
    gnomeExtensions.compiz-alike-magic-lamp-effect
    gnomeExtensions.hide-top-bar
    gnomeExtensions.hot-edge

    #neovim dependencies
    xsel
    ripgrep
    fd
    manix

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
