{
  programs.nixvim.plugins = {
    
    # List of treesitter grammers to download
    treesitter = {
      enable = true;
      settings.auto_install = true;
    };

    # nvim cmp configuration
    cmp-nvim-lua.enable = true;
    friendly-snippets.enable = true;
    luasnip.enable = true;
    cmp_yanky.enable = true;
    cmp-emoji.enable = true;
    cmp = {
      enable = true;
      settings = {
        autoEnableSources = true;
        experimental = { ghost_text = true; };
        performance = {
          debounce = 60;
          fetchingTimeout = 200;
          maxViewEntries = 30;
        };
        snippet = { expand = "luasnip"; };
        formatting = { fields = [ "kind" "abbr" "menu" ]; };
        sources = [
          { name = "nvim_lsp"; }
          { name = "emoji"; }
          {
            name = "buffer"; # text within current buffer
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            keywordLength = 3;
          }
          {
            name = "path"; # file system paths
            keywordLength = 3;
          }
          {
            name = "luasnip"; # snippets
            keywordLength = 3;
          }
        ];
        window = {
          completion = { border = "solid"; };
          documentation = { border = "solid"; };
        };
        mapping = {
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<A-j>" = "cmp.mapping.select_next_item()";
          "<A-k>" = "cmp.mapping.select_prev_item()";
          "<A-e>" = "cmp.mapping.abort()";
          "<A-b>" = "cmp.mapping.scroll_docs(-4)";
          "<A-f>" = "cmp.mapping.scroll_docs(4)";
          "<A-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
        };
      };
    };
    cmp-nvim-lsp = {
      enable = true; # LSP
    };
    cmp-buffer = {
      enable = true;
    };
    cmp-path = {
      enable = true; # file system paths
    };
    cmp_luasnip = {
      enable = true; # snippets
    };
    cmp-cmdline = {
      enable = true; # autocomplete for cmdline
    }; 
    lspkind = {
      enable = true;
      symbolMap = {
        Copilot = "";
      };
      extraOptions = {
        maxwidth = 50;
        ellipsis_char = "...";
      };
    };

    # List of lsp to download
    lsp = {
      enable = true;
      servers = {
        nixd.enable = true; # nix lsp
        lua_ls.enable = true; # lua lsp
        ccls.enable = true; # C/C++ lsp powered by clang
        texlab.enable = true; # Latex lsp
      };
    };

    # Configuration for dap
    dap = {
      enable = true;
      signs = {
        dapBreakpoint = {
          text = "●";
          texthl = "DapBreakpoint";
        };
        dapBreakpointCondition = {
          text = "●";
          texthl = "DapBreakpointCondition";
        };
        dapLogPoint = {
          text = "◆";
          texthl = "DapLogPoint";
        };
      };
      extensions = {
        dap-python = {
          enable = true;
        };
        dap-ui = {
          enable = true;
          floating.mappings = {
            close = ["<ESC>" "q"];
          };
        };
        dap-virtual-text = {
          enable = true;
        };
      };
      configurations = {
        # java = [
        #   {
        #     type = "java";
        #     request = "launch";
        #     name = "Debug (Attach) - Remote";
        #     hostName = "127.0.0.1";
        #     port = 5005;
        #   }
        # ];
      };
    };
  };
}
