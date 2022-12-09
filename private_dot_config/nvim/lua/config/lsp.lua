require("config.diagnostics")
local border = "rounded"
local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { remap = false, silent = true }
vim.keymap.set("n", "<space>e", function()
	vim.diagnostic.open_float()
end, opts)
vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	--[[ require("nvim-navic").attach(client, bufnr) ]]
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format()
			end,
		})
	end
	local client_opts = { remap = false, silent = true, buffer = bufnr }
	if not bufnr then
		bufnr = 0
	end
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", client_opts)
	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", client_opts)
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", client_opts)
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", client_opts)
	vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", client_opts)
	vim.keymap.set("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", client_opts)
	vim.keymap.set("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", client_opts)
	vim.keymap.set(
		"n",
		"<space>wl",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		client_opts
	)
	vim.keymap.set("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", client_opts)
	vim.keymap.set("n", "<space>rn", "<cmd>Lspsaga rename<CR>", client_opts)
	vim.keymap.set("n", "<space>ca", "<cmd>Lspsaga code_action<CR>", client_opts)
	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", client_opts)
	vim.keymap.set("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", client_opts)
	vim.keymap.set(
		"n",
		"<C-u>",
		"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>",
		client_opts
	)
	vim.keymap.set(
		"n",
		"<C-d>",
		"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>",
		client_opts
	)
	print("LSP attached:", client.name)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "rust_analyzer", "lemminx", "marksman", "texlab", "ltex", "cssls" }

for _, lsp in pairs(servers) do
	require("lspconfig")[lsp].setup({
		on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
			on_attach(client, bufnr)
		end,
		capabilities = capabilities,
		handlers = handlers,
	})
end

require("lspconfig").astro.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = handlers,
})

require("lspconfig").sumneko_lua.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
		on_attach(client, bufnr)
	end,
	capabilities = capabilities,
	handlers = handlers,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
		},
	},
})

require("lspconfig").svelte.setup({
	filetypes = { "svelte", "svx" },
	on_attach = function(client, bufnr)
		--[[ client.server_capabilities.documentFormattingProvider = false ]]
		--[[ client.server_capabilities.documentRangeFormattingProvider = false ]]
		on_attach(client, bufnr)
	end,
	capabilities = capabilities,
	handlers = handlers,
	settings = {
		html = {
			completion = {
				enable = true,
				emmet = false,
			},
		},
	},
})

local util = require("lspconfig.util")
local function get_typescript_server_path(root_dir)
	local global_ts = "/usr/lib/node_modules/typescript/lib/tsserverlibrary.js"
	local found_ts = ""
	local function check_dir(path)
		found_ts = util.path.join(path, "node_modules", "typescript", "lib", "tsserverlibrary.js")
		if util.path.exists(found_ts) then
			return path
		end
	end

	if util.search_ancestors(root_dir, check_dir) then
		return found_ts
	else
		return global_ts
	end
end

require("lspconfig").volar.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
		on_attach(client, bufnr)
	end,
	filetypes = {
		"typescript",
		"javascript",
		"javascriptreact",
		"typescriptreact",
		"json",
		"vue",
	},
	--[[ on_new_config = function(new_config, new_root_dir) ]]
	--[[ 	new_config.init_options.typescript.serverPath = get_typescript_server_path(new_root_dir) ]]
	--[[ end, ]]
})

return { on_attach = on_attach }
