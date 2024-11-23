{ pkgs, ... }: {
  programs.tmux = {
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
}
