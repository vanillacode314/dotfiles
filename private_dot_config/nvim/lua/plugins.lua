return require("packer").startup({
	function(use)
		use("wbthomason/packer.nvim")
		use({ "lervag/vimtex" })
		-- GIT
		use({
			"lewis6991/gitsigns.nvim",
			-- tag = 'release' -- To use the latest release
			config = function()
				require("gitsigns").setup()
			end,
		})

		-- COLORSCHEMES
		use("RRethy/nvim-base16")
		use({
			"Mofiqul/vscode.nvim",
		})

		-- LSP
		use({
			"neovim/nvim-lspconfig",
			config = function()
				require("config.lsp")
			end,
		})

		use("folke/lsp-colors.nvim")

		use({
			"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
			disable = true,
			config = function()
				require("lsp_lines").setup()
			end,
		})

		use({
			"onsails/lspkind-nvim",
		})

		use({
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("config.nullls")
			end,
			requires = {
				"nvim-lua/plenary.nvim",
			},
		})

		-- TREESITTER
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("config.treesitter")
			end,
		})
		use({
			"virchau13/tree-sitter-astro",
			ft = { "astro" },
		})
		use({
			"nvim-treesitter/playground",
			requires = {
				"nvim-treesitter/nvim-treesitter",
			},
		})
		use({
			"nvim-treesitter/nvim-treesitter-textobjects",
			requires = {
				"nvim-treesitter/nvim-treesitter",
			},
		})
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup()
			end,
		})
		use({
			"p00f/nvim-ts-rainbow",
		})
		use({
			"windwp/nvim-ts-autotag",
			requires = {
				"nvim-treesitter",
			},
		})

		-- STATUS LINE
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			config = function()
				require("config.lualine")
			end,
		})
		use({
			"lukas-reineke/indent-blankline.nvim",
		})
		use({
			"kylechui/nvim-surround",
			config = function()
				require("nvim-surround").setup({
					-- Configuration here, or leave empty to use defaults
					--sdf
					--asf
				})
			end,
		})

		-- SNIPPETS
		use({ "fivethree-team/vscode-svelte-snippets" })
		use({
			"rafamadriz/friendly-snippets",
		})
		use({
			"sdras/vue-vscode-snippets",
		})
		use({
			"L3MON4D3/LuaSnip",
			config = function()
				require("luasnip.loaders.from_snipmate").lazy_load()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		})
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
				"saadparwaiz1/cmp_luasnip",
				"lukas-reineke/cmp-rg",
				"hrsh7th/cmp-nvim-lsp-signature-help",
				"jcha0713/cmp-tw2css",
			},
			config = function()
				require("config.cmp")
			end,
		})

		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup({
					pre_hook = function(ctx)
						local U = require("Comment.utils")

						-- Detemine whether to use linewise or blockwise commentstring
						local type = ctx.ctype == U.ctype.line and "__default" or "__multiline"

						-- Determine the location where to calculate commentstring from
						local location = nil
						if ctx.ctype == U.ctype.block then
							location = require("ts_context_commentstring.utils").get_cursor_location()
						elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
							location = require("ts_context_commentstring.utils").get_visual_start_location()
						end

						return require("ts_context_commentstring.internal").calculate_commentstring({
							key = type,
							location = location,
						})
					end,
				})
			end,
		})
		use({
			"JoosepAlviste/nvim-ts-context-commentstring",
		})

		use({
			"wellle/targets.vim",
		})

		use({
			"kkharji/lspsaga.nvim",
			config = function()
				local lspsaga = require("lspsaga")
				lspsaga.setup({ -- defaults ...
					debug = false,
					use_saga_diagnostic_sign = false,
					-- diagnostic sign
					error_sign = "",
					warn_sign = "",
					hint_sign = "",
					infor_sign = "",
					diagnostic_header_icon = "   ",
					-- code action title icon
					code_action_icon = " ",
					code_action_prompt = {
						enable = true,
						sign = true,
						sign_priority = 40,
						virtual_text = true,
					},
					finder_definition_icon = "  ",
					finder_reference_icon = "  ",
					max_preview_lines = 10,
					finder_action_keys = {
						open = "o",
						vsplit = "s",
						split = "i",
						quit = "q",
						scroll_down = "<C-f>",
						scroll_up = "<C-b>",
					},
					code_action_keys = {
						quit = "q",
						exec = "<CR>",
					},
					rename_action_keys = {
						quit = "<C-c>",
						exec = "<CR>",
					},
					definition_preview_icon = "  ",
					border_style = "single",
					rename_prompt_prefix = "➤",
					rename_output_qflist = {
						enable = false,
						auto_open_qflist = false,
					},
					server_filetype_map = {},
					diagnostic_prefix_format = "%d. ",
					diagnostic_message_format = "%m %c",
					highlight_prefix = false,
				})
				vim.api.nvim_create_autocmd("FileType", {
					group = vim.api.nvim_create_augroup("lspsaga_filetypes", { clear = true }),
					pattern = "LspsagaHover",
					command = "nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>",
				})
			end,
		})
		use({
			"akinsho/bufferline.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("bufferline").setup()
			end,
		})
		use({
			"phaazon/hop.nvim",
			branch = "v1", -- optional but strongly recommended
			config = function()
				require("hop").setup({})
				-- place this in one of your configuration file(s)
				vim.api.nvim_set_keymap(
					"n",
					"f",
					"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
					{}
				)
				vim.api.nvim_set_keymap(
					"n",
					"F",
					"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
					{}
				)
				vim.api.nvim_set_keymap(
					"o",
					"f",
					"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
					{}
				)
				vim.api.nvim_set_keymap(
					"o",
					"F",
					"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
					{}
				)
				vim.api.nvim_set_keymap(
					"",
					"t",
					"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
					{}
				)
				vim.api.nvim_set_keymap(
					"",
					"T",
					"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
					{}
				)
			end,
		})
		use({
			"ethanholz/nvim-lastplace",
			config = function()
				require("nvim-lastplace").setup({})
			end,
		})
		use({
			"kevinhwang91/nvim-ufo",
			requires = "kevinhwang91/promise-async",
			config = function()
				vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
				-- vim.opt.foldcolumn = "1"
				vim.opt.foldlevel = 99
				vim.opt.foldenable = true

				-- option 2: nvim lsp as LSP client
				-- tell the sever the capability of foldingRange
				local capabilities = vim.lsp.protocol.make_client_capabilities()
				capabilities.textDocument.foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly = true,
				}
				--

				local handler = function(virtText, lnum, endLnum, width, truncate)
					local newVirtText = {}
					local suffix = ("  %d "):format(endLnum - lnum)
					local sufWidth = vim.fn.strdisplaywidth(suffix)
					local targetWidth = width - sufWidth
					local curWidth = 0
					for _, chunk in ipairs(virtText) do
						local chunkText = chunk[1]
						local chunkWidth = vim.fn.strdisplaywidth(chunkText)
						if targetWidth > curWidth + chunkWidth then
							table.insert(newVirtText, chunk)
						else
							chunkText = truncate(chunkText, targetWidth - curWidth)
							local hlGroup = chunk[2]
							table.insert(newVirtText, { chunkText, hlGroup })
							chunkWidth = vim.fn.strdisplaywidth(chunkText)
							-- str width returned from truncate() may less than 2rd argument, need padding
							if curWidth + chunkWidth < targetWidth then
								suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
							end
							break
						end
						curWidth = curWidth + chunkWidth
					end
					table.insert(newVirtText, { suffix, "MoreMsg" })
					return newVirtText
				end
				require("ufo").setup({
					fold_virt_text_handler = handler,
				})
			end,
		})
		use({
			"ellisonleao/carbon-now.nvim",
			disable = true,
			config = function()
				require("carbon-now").setup()
				vim.keymap.set("v", "<leader>cn", function()
					require("carbon-now").create_snippet()
				end, { noremap = true, silent = true })
			end,
		})
		use({
			"derektata/lorem.nvim",
			disable = true,
			config = function()
				require("lorem-nvim").setup()
			end,
			requires = "vim-scripts/loremipsum",
		})
		use({
			"jose-elias-alvarez/typescript.nvim",
		})
		use({
			"Abstract-IDE/penvim",
			config = function()
				require("penvim").setup({
					rooter = {
						enable = true, -- enable/disable rooter
						-- patterns = { ".__nvim__.lua", ".git", "node_modules" },
					},
					indentor = {
						enable = true, -- enable/disable indentor
						indent_length = 2, -- tab indent width
						accuracy = 5, -- positive integer. higher the number, the more accurate result (but affects the startup time)
						disable_types = {
							"help",
							"dashboard",
							"dashpreview",
							"NvimTree",
							"vista",
							"sagahover",
							"terminal",
						},
					},
					project_env = {
						enable = true, -- enable/disable project_env
						--[[ config_name = ".__nvim__.lua", -- config file name ]]
					},
				})
			end,
		})
		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("trouble").setup({
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				})
				vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", { silent = true, noremap = true })
				vim.api.nvim_set_keymap(
					"n",
					"<leader>xw",
					"<cmd>Trouble workspace_diagnostics<cr>",
					{ silent = true, noremap = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"<leader>xd",
					"<cmd>Trouble document_diagnostics<cr>",
					{ silent = true, noremap = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"<leader>xl",
					"<cmd>Trouble loclist<cr>",
					{ silent = true, noremap = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"<leader>xq",
					"<cmd>Trouble quickfix<cr>",
					{ silent = true, noremap = true }
				)
				vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", { silent = true, noremap = true })
			end,
		})
		use({
			"vimpostor/vim-tpipeline",
			disable = true,
			config = function()
				vim.g.tpipeline_cursormoved = 1
			end,
		})
		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			-- or                            , branch = '0.1.x',
			requires = { { "nvim-lua/plenary.nvim" } },
			config = function()
				local opts = { noremap = true }
				local tb = require("telescope.builtin")
				vim.keymap.set("n", "<leader>ff", function()
					tb.find_files()
				end, opts)
				vim.keymap.set("n", "<leader>fg", function()
					tb.live_grep()
				end, opts)
				vim.keymap.set("n", "<leader>fb", function()
					tb.buffers()
				end, opts)
				vim.keymap.set("n", "<leader>fh", function()
					tb.help_tags()
				end, opts)
			end,
		})
		use({
			"Shatur/neovim-session-manager",
			config = function()
				local Path = require("plenary.path")
				require("session_manager").setup({
					sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"), -- The directory where the session files will be saved.
					path_replacer = "__", -- The character to which the path separator will be replaced for session files.
					colon_replacer = "++", -- The character to which the colon symbol will be replaced for session files.
					autoload_mode = require("session_manager.config").AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
					autosave_last_session = true, -- Automatically save last session on exit and on session switch.
					autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
					autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
						"gitcommit",
					},
					autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
					max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
				})
			end,
		})
		use({
			"numToStr/FTerm.nvim",
			config = function()
				vim.keymap.set("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>')
				vim.keymap.set("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
			end,
		})
		use({
			"folke/which-key.nvim",
			disable = true,
			config = function()
				require("which-key").setup({
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
					triggers = { "<Space>" },
				})
			end,
		})
		use({
			"SmiteshP/nvim-navic",
			requires = "neovim/nvim-lspconfig",
		})
		use({
			"rktjmp/highlight-current-n.nvim",
			config = function()
				require("highlight_current_n").setup({
					highlight_group = "IncSearch", -- highlight group name to use for highlight
				})
				vim.cmd([[
						nmap n <Plug>(highlight-current-n-n)
						nmap N <Plug>(highlight-current-n-N)
						autocmd CmdlineLeave /,\? lua require('highlight_current_n')['/,?']()
						nmap * *N

						" Some QOL autocommands
						augroup ClearSearchHL
							autocmd!
							" You may only want to see hlsearch /while/ searching, you can automatically
							" toggle hlsearch with the following autocommands
							autocmd CmdlineEnter /,\? set hlsearch
							autocmd CmdlineLeave /,\? set nohlsearch
							" this will apply similar n|N highlighting to the first search result
							" careful with escaping ? in lua, you may need \\?
							autocmd CmdlineLeave /,\? lua require('highlight_current_n')['/,?']()
						augroup END
					]])
			end,
		})
		use({
			"petertriho/nvim-scrollbar",
			config = function()
				require("scrollbar").setup()
			end,
		})
		use({
			"RRethy/nvim-treesitter-textsubjects",
		})
		use({
			"kkoomen/vim-doge",
			run = ":call doge#install()",
			setup = function()
				vim.g.doge_filetype_aliases = {
					javascript = {
						"vue",
						"svelte",
					},
				}
			end,
		})
		use({
			"MunifTanjim/exrc.nvim",
			config = function()
				-- disable built-in local config file support
				vim.o.exrc = false

				require("exrc").setup({
					files = {
						".nvimrc.lua",
						".nvimrc",
						".exrc.lua",
						".exrc",
					},
				})
			end,
		})

		-- DAP
		use({
			"mfussenegger/nvim-dap",
			config = function()
				local dap = require("dap")
				dap.adapters.lldb = {
					type = "executable",
					command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path
					name = "lldb",
				}
				dap.configurations.cpp = {
					{
						name = "Launch",
						type = "lldb",
						request = "launch",
						program = function()
							return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
						end,
						cwd = "${workspaceFolder}",
						stopOnEntry = false,
						args = {},

						-- 💀
						-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
						--
						--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
						--
						-- Otherwise you might get the following error:
						--
						--    Error on launch: Failed to attach to the target process
						--
						-- But you should be aware of the implications:
						-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
						-- runInTerminal = false,
					},
				}

				-- If you want to use this for Rust and C, add something like this:

				dap.configurations.c = dap.configurations.cpp
				dap.configurations.rust = dap.configurations.cpp
			end,
		})
		use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
