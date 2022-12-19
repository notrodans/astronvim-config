local config = {

	updater = {
		remote = "origin", -- remote to use
		channel = "nightly", -- "stable" or "nightly"
		version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
		branch = "main", -- branch name (NIGHTLY ONLY)
		commit = nil, -- commit hash (NIGHTLY ONLY)
		pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
		skip_prompts = false, -- skip prompts about breaking changes
		show_changelog = true, -- show the changelog after performing an update
		auto_reload = true, -- automatically reload and sync packer after a successful update
		auto_quit = false, -- automatically quit the current session after a successful update
		-- remotes = { -- easily add new remotes to track
		--   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
		--   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
		--   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
		-- },
	},

	colorscheme = "default_theme",

	highlights = {
		-- init = { -- this table overrides highlights in all themes
		--   Normal = { bg = "#000000" },
		-- }
		-- duskfox = { -- a table of overrides/changes to the duskfox theme
		--   Normal = { bg = "#000000" },
		-- },
	},

	options = {
		opt = {
			expandtab = true,
			smartindent = true,
			smarttab = true,
			number = true,
			spell = false,
			signcolumn = "yes",
			cmdheight = 1,
			completeopt = { "menu", "menuone", "noselect" },
			tabstop = 4,
			softtabstop = 4,
			shiftwidth = 4,
		},
		g = {
			mapleader = " ", -- sets vim.g.mapleader
			autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
			cmp_enabled = true, -- enable completion at start
			autopairs_enabled = true, -- enable autopairs at start
			diagnostics_enabled = true, -- enable diagnostics at start
			status_diagnostics_enabled = true, -- enable diagnostics in statusline
			icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
			ui_notifications_enabled = true, -- disable notifications when toggling UI elements

			-- mellow colorscheme
			mellow_italic_keywords = true,
			mellow_italic_booleans = true,
			mellow_italic_functions = true,
			mellow_bold_keywords = true,
			mellow_bold_functions = true,
		},
	},

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

	default_theme = {
		colors = {
			fg = "#abb2bf",
			bg = "#181A1F",
			black = "#1e222a",
		},
		highlights = function(hl)
			local C = require "default_theme.colors"

			hl.Normal = { fg = C.fg, bg = "" }
			hl.NormalNC = { fg = C.fg, bg = "" }
			hl.WildMenu = { fg = C.grey_3, bg = "" }

			hl.DiagnosticError.italic = true
			hl.DiagnosticHint.italic = true
			hl.DiagnosticInfo.italic = true
			hl.DiagnosticWarn.italic = true

			return hl
		end,
		plugins = {
			aerial = true,
			beacon = false,
			bufferline = true,
			cmp = false,
			dashboard = true,
			highlighturl = true,
			hop = false,
			indent_blankline = true,
			lightspeed = false,
			["neo-tree"] = false,
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
	},

	diagnostics = {
		virtual_text = true,
		underline = true,
	},

	lsp = {
		servers = {},
		formatting = {
			format_on_save = {
				enabled = false,
				allow_filetypes = {
					-- "go",
				},
				ignore_filetypes = {
					-- "python"
				},
			},
			disabled = {
				"jsonls",
				"html",
				"tsserver",
				"sumneko_lua",
			},
			async = true,
		},
		mappings = {
			n = {
				["[d"] = false,
				["]d"] = false,
				["gl"] = false,
			},
		},
		["server-settings"] = {
			stylelint_lsp = {
				filetypes = { "css", "sass", "scss", "less" },
			},
			tsserver = {
				init_options = {
					plugins = {
						{
							name = "anything",
							location = "anything",
						},
					},
				},
			},
		},
	},

	mappings = {
		n = {
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
				desc = "prev diagnostic line",
			},
			["]d"] = {
				"<Cmd>Lspsaga diagnostic_jump_next<CR>",
				desc = "next diagnostic line",
			},
			["gl"] = {
				"<Cmd>Lspsaga show_line_diagnostics<CR>",
				desc = "diagnostics line",
			},
		},
	},

	plugins = {
		lspkind = function(config)
			config.mode = "symbol_text"
			config.before = function(entry, vim_item)
				vim_item.menu = entry.completion_item.detail
				return vim_item
			end
			return config
		end,
		init = {
			["lukas-reineke/indent-blankline.nvim"] = {
				event = "BufEnter",
				config = function() require "user.configs.indent-line" end,
			},
			{ "andweeb/presence.nvim" },
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
			["catppuccin/nvim"] = {},
		},
		["null-ls"] = function(config)
			local null_ls = require "null-ls"
			config.sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.stylelint,
				null_ls.builtins.formatting.prettierd.with {
					filetypes = {
						"javascriptreact",
						"javascript",
						"typescriptreact",
						"typescript",
						"html",
						"json",
					},
				},
				null_ls.builtins.diagnostics.stylelint,
				null_ls.builtins.diagnostics.eslint_d,
			}
			return config
		end,
		treesitter = {
			auto_install = true,
			ensure_installed = {
				"tsx",
				"javascript",
				"typescript",
				"scss",
				"css",
				"html",
				"json",
				"lua",
			},
			rainbow = {
				enable = false,
			},
		},
		["mason-lspconfig"] = {
			ensure_installed = {
				"tsserver",
				"sumneko_lua",
				"html",
				"cssls",
				"jsonls",
				"stylelint_lsp",
				"emmet_ls",
			},
		},
		["mason-null-ls"] = {
			ensure_installed = {
				"stylelint_lsp",
				"eslint_d",
				"prettierd",
				"stylua",
			},
			automatic_setup = false,
		},
		["mason-nvim-dap"] = {
			-- ensure_installed = { "python" },
		},
	},

	luasnip = {
		vscode = {
			paths = { "./lua/user/snippets" },
		},
	},

	cmp = {
		source_priority = {
			nvim_lsp = 1000,
			luasnip = 750,
			buffer = 500,
			path = 250,
		},
	},

	["which-key"] = {
		register = {
			n = {
				["<leader>"] = {
					["b"] = { name = "Buffer" },
				},
			},
		},
	},
}

return config
