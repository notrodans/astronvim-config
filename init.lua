--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "nightly", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_reload = false, -- automatically reload and sync packer after a successful update
    auto_quit = false, -- automatically quit the current session after a successful update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set colorscheme to use
  colorscheme = "mellow",

  -- Add highlight groups in any theme
  highlights = {
    -- init = { -- this table overrides highlights in all themes
    --   Normal = { bg = "#000000" },
    -- }
    -- duskfox = { -- a table of overrides/changes to the duskfox theme
    --   Normal = { bg = "#000000" },
    -- },
  },

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = true, -- sets vim.ohout set scroll=0, the scrpt.relativenumber
      expandtab = true,
      smartindent = true,
      smarttab = true,
      number = true, -- sets vim.opt.number
      spell = false, -- sets vim.opt.spell
      signcolumn = "auto", -- sets vim.opt.signcolumn to auto
      wrap = false, -- sets vim.opt.wrap
      cmdheight = 1,
      completeopt = { "menu", "menuone", "noselect" },
      -- tabstop = 2,
      -- softtabstop = 2,
      -- shiftwidth = 2,
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      autoformat_enabled = false, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      cmp_enabled = true, -- enable completion at start
      autopairs_enabled = true, -- enable autopairs at start
      diagnostics_enabled = true, -- enable diagnostics at start
      status_diagnostics_enabled = true, -- enable diagnostics in statusline
      icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    },
  },

  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --   local_vim.opt.relativenumber = true
  --   local_vim.g.mapleader = " "
  --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --
  --   return local_vim
  -- end,

  -- Set dashboard header
  header = {
    " ▄▄▄        ██████  ██▓ ██▀███   ██▓▒██   ██▒",
    "▒████▄    ▒██    ▒ ▓██▒▓██ ▒ ██▒▓██▒▒▒ █ █ ▒░",
    "▒██  ▀█▄  ░ ▓██▄   ▒██▒▓██ ░▄█ ▒▒██▒░░  █   ░",
    "░██▄▄▄▄██   ▒   ██▒░██░▒██▀▀█▄  ░██░ ░ █ █ ▒ ",
    "▓█   ▓██▒▒██████▒▒░██░░██▓ ▒██▒░██░▒██▒ ▒██▒",
    "▒▒   ▓▒█░▒ ▒▓▒ ▒ ░░▓  ░ ▒▓ ░▒▓░░▓  ▒▒ ░ ░▓ ░",
    " ▒   ▒▒ ░░ ░▒  ░ ░ ▒ ░  ░▒ ░ ▒░ ▒ ░░░   ░▒ ░",
    " ░   ▒   ░  ░  ░   ▒ ░  ░░   ░  ▒ ░ ░    ░  ",
    "      ░  ░      ░   ░     ░      ░   ░    ░  ",
  },

  -- Default theme configuration
  default_theme = {
    -- Modify the color palette for the default theme
    -- colors = {
    --   fg = "#CDD6F4",
    --   bg = "#1E1E2E",
    -- },
    highlights = function(hl) -- or a function that returns a new table of colors to set
      local C = require "default_theme.colors"

      hl.Normal = { fg = C.fg, bg = C.bg }

      -- New approach instead of diagnostic_style
      hl.DiagnosticError.italic = true
      hl.DiagnosticHint.italic = true
      hl.DiagnosticInfo.italic = true
      hl.DiagnosticWarn.italic = true

      return hl
    end,
    -- enable or disable highlighting for extra plugins
    plugins = {
      aerial = true,
      beacon = false,
      bufferline = true,
      cmp = true,
      dashboard = true,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      treesitter = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  }, -- Diagnostics configuration (for vim.diagnostics.config({...}))
  diagnostics = {
    virtual_text = true,
    underline = true,
    signs = true,
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      "tsserver",
      "stylelint_lsp",
    },
    skip_setup = {
      "stylelint_lsp",
    },
    formatting = {
      format_on_save = {
        enabled = false, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      -- disabled = { -- disable formatting capabilities for the listed clients
      -- },
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
      -- timeout_ms = 1000, -- default format timeout
      async = true,
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
        ["[d"] = false,
        ["]d"] = false,
      },
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the mason server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      stylelint_lsp = { -- override table for require("lspconfig").stylelint_lsp.setup({...})
        stylelintplus = {
          autoFixOnFormat = true,
          filetypes = { "css", "sass", "scss", "less" },
        },
      },
    },
  },

  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
      ["<C-f>"] = {
        "<Cmd>Lspsaga lsp_finder<CR>",
        desc = "lspsaga lsp finder",
      },
      ["[d"] = {
        "<Cmd>Lspsaga diagnostic_jump_prev<CR>",
        desc = "lspsaga lsp finder",
      },
      ["]d"] = {
        "<Cmd>Lspsaga diagnostic_jump_next<CR>",
        desc = "lspsaga lsp finder",
      },
    },
  },

  -- Configure plugins
  plugins = {
    heirline = function(config)
      -- the first item is the statusline
      -- the second item is the winbar
      config[2] = nil
      return config
    end,
    lspkind = function(config)
      config.mode = "symbol_text"
      config.before = function(entry, vim_item)
        vim_item.menu = entry.completion_item.detail
        return vim_item
      end
      config.symbol_map = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = "",
      }
      return config
    end,
    init = {
      ["hrsh7th/cmp-buffer"] = { disable = true },

      ["HerringtonDarkholme/yats.vim"] = {
        event = "InsertEnter",
      },

      ["lukas-reineke/indent-blankline.nvim"] = {
        event = "BufEnter",
        config = function() require "user.configs.indent-line" end,
      },

      ["avneesh0612/react-nextjs-snippets"] = {
        event = "BufRead",
      },

      ["windwp/nvim-ts-autotag"] = {
        event = "BufRead",
        config = function() require("nvim-ts-autotag").setup() end,
      },

      ["glepnir/lspsaga.nvim"] = {
        branch = "main",
        event = "BufRead",
        config = function()
          local saga = require "lspsaga"
          saga.init_lsp_saga {}
        end,
      },

      ["kvrohit/mellow.nvim"] = {},
    },
    -- All other entries override the require("<key>").setup({...}) call for default plugins
    ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
      -- config variable is the default configuration table for the setup functino call
      local null_ls = require "null-ls"
      config.sources = {
        -- Set a formatter
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.stylelint.with {
          filetypes = { "css", "sass", "scss", "less" },
        },
        -- Diagnostics
        null_ls.builtins.diagnostics.stylelint.with {
          filetypes = { "css", "sass", "scss", "less" },
        },
        null_ls.builtins.diagnostics.eslint_d,
      }
      return config -- return final config table to use in require("null-ls").setup(config)
    end,
    treesitter = {
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      rainbow = {
        enable = false,
        disable = { "html" },
        extended_mode = false,
        max_file_lines = nil,
      },
      autopairs = { enable = true },
      autotag = { enable = true },
      incremental_selection = { enable = true },
      indent = { enable = true },
    },
    -- use mason-lspconfig to configure LSP installations
    ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
      ensure_installed = { "stylelint_lsp" },
    },
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
      -- ensure_installed = { "prettier", "stylua" },
    },
  },

  luasnip = {
    vscode_snippet_paths = { "./lua/user/snippets" },
  },

  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      path = 500,
      buffer = false,
    },
  },

  -- Modify which-key registration (Use this with mappings table in the above.)
  ["which-key"] = {
    -- Add bindings which show up as group name
    register = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- third key is the key to bring up next level and its displayed
          -- group name in which-key top level menu
          ["b"] = { name = "Buffer" },
        },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  -- polish = function()
  --   -- Set up custom filetypes
  --   vim.filetype.add {
  --     extension = {
  --       foo = "fooscript",
  --     },
  --     filename = {
  --       ["Foofile"] = "fooscript",
  --     },
  --     pattern = {
  --       ["~/%.config/foo/.*"] = "fooscript",
  --     },
  --   }
  -- end,
}

return config
