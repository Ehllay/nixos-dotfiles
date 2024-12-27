{user, ...}: {
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };
    globals = {
      mapleader = " ";
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>ff";
        options.silent = true;
        action = "<cmd>Telescope find_files<CR>";
      }
      {
        mode = "n";
        key = "<leader>fr";
        options.silent = true;
        action = "<cmd>Telescope oldfiles<CR>";
      }
      {
        mode = "n";
        key = "<leader>e";
        options.silent = true;
        action = "<cmd>NvimTreeToggle<CR>";
      }
      {
        mode = [
          "n"
          "t"
        ];
        key = "<A-i>";
        options.silent = true;
        action = "<cmd>ToggleTerm<CR>";
      }
      # More convenient window navigation
      {
        mode = "n";
        key = "<leader>x";
        options.silent = true;
        action = "<cmd>bd<CR>";
      }
      {
        mode = "n";
        key = "<C-h>";
        options.silent = true;
        action = "<cmd>wincmd h<CR>";
      }
      {
        mode = "n";
        key = "<C-l>";
        options.silent = true;
        action = "<cmd>wincmd l<CR>";
      }
      {
        mode = "n";
        key = "<Tab>";
        action = "<cmd>BufferNext<CR>";
      }
      {
        mode = "n";
        key = "<C-q>";
        action = "<cmd>BufferClose<CR>";
      }
    ];

    plugins = {
      autoclose.enable = true;
      barbar.enable = true;
      comment.enable = true;
      treesitter.enable = true;
      which-key.enable = true;
      gitsigns.enable = true;
      nvim-colorizer.enable = true;
      nvim-tree.enable = true;
      markdown-preview.enable = true;
      telescope.enable = true;
      trouble.enable = true;

      # Dashboard config
      dashboard = {
        enable = true;
        settings = {
          theme = "doom";
          config = {
            header = [
              ""
              ""
              " ███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄   "
              " ███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄ "
              " ███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███ "
              " ███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███ "
              " ███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███ "
              " ███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███ "
              " ███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███ "
              "  ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀  "
              ""
              ""
            ];
            center = [
              {
                icon = "  ";
                icon_hl = "Title";
                desc = "New Buffer";
                key = "n";
                keymap = "SPC b";
                key_hl = "Number";
                action = "enew";
              }
              {
                icon = "󰱼  ";
                icon_hl = "Title";
                desc = "Open File";
                key = "f";
                keymap = "SPC f f";
                key_hl = "Number";
                action = "Telescope find_files";
              }
              {
                icon = "󰥔  ";
                icon_hl = "Title";
                desc = "Recent";
                key = "r";
                keymap = "SPC f r";
                key_hl = "Number";
                action = "Telescope oldfiles";
              }
              {
                icon = "  ";
                icon_hl = "Title";
                desc = "Edit dotfiles";
                key = "d";
                keymap = "SPC f d";
                key_hl = "Number";
                action = "cd ~/.dotfiles | Telescope find_files";
              }
            ];
            footer = [
              ""
              ""
              "Nixxin'"
              ""
            ];
          };
        };
      };

      toggleterm = {
        enable = true;
        settings = {
          direction = "float";
          float_opts = {
            border = "curved";
            height = 30;
            width = 130;
          };
          open_mapping = "[[<c->]]";
        };
      };

      lualine = {
        enable = true;
        iconsEnabled = true;
      };

      indent-blankline = {
        enable = true;
        settings = {
          scope.enabled = false;
          exclude.filetypes = [
            "lspinfo"
            "dashboard"
            "packer"
            "checkhealth"
            "help"
            "man"
            "gitcommit"
            "TelescopePrompt"
            "TelescopeResults"
            "''"
          ];
        };
      };

      # Luasnip
      luasnip = {
        enable = true;
      };

      # LSP
      lsp = {
        enable = true;
        servers = {
          nil-ls.enable = true;
          tsserver.enable = true;
          lua-ls.enable = true;
        };
      };
      # CMP
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            {name = "nvim_lsp";}
            {name = "nvim_lsp_signature_help";}
            {name = "path";}
            {name = "buffer";}
            {name = "luasnip";}
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-e>" = "cmp.mapping.close()";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          };
        };
      };
      cmp-treesitter.enable = true;

      # Autoformatting & Lint
      conform-nvim = {
        enable = true;
        formatOnSave = "
	  {
	    lsp_fallback = true,
	    timeout_ms = 100,  
	  }
	";
        formattersByFt = {
          lua = ["stylua"];
          rust = ["rustfmt"];
          nix = ["alejandra"];
          java = ["astyle"];
          javascript = ["prettierd"];
          typescript = ["prettierd"];
          javascriptreact = ["prettierd"];
          typescriptreact = ["prettierd"];
          svelte = ["prettierd"];
          css = ["prettierd"];
          html = ["prettierd"];
          json = ["prettierd"];
          yaml = ["prettierd"];
          "_" = [
            "squeeze_blanks"
            "trim_whitespace"
            "trim_newlines"
          ];
        };
        formatters = {
          astyle = {
            args = ["--suffix=none" "--indent=spaces=2"];
          };
        };
      };

      # Language specific
      rustaceanvim.enable = true;

      nvim-jdtls = {
        enable = true;
        data = "/home/${user}/.cache/jdtls/workspace";
        configuration = "/home/${user}/.cache/jdtls/config";
        rootDir = {
          __raw = "require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'})";
        };
      };

      transparent = {
        enable = false;
        settings = {
          exclude_groups = [];
          extra_groups = [
            "BufferLineTabClose"
            "BufferLineBufferSelected"
            "BufferLineFill"
            "BufferLineBackground"
            "BufferLineSeparator"
            "BufferLineIndicatorSelected"
          ];
        };
      };
    };
    extraConfigLua = ''
      vim.opt.fillchars='eob: '

      vim.api.nvim_create_autocmd("BufWritePre", {
      	pattern = "*",
      	callback = function(args)
      	require("conform").format({ bufnr = args.buf })
      	end,
      })
    '';
  };
}
