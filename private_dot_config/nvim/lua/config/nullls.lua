local null_ls = require("null-ls")

require("null-ls").setup({
	sources = {
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.formatting.fish_indent,
		null_ls.builtins.formatting.prettier.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"yaml",
				"markdown",
				"graphql",
			},
		}),
		-- null_ls.builtins.completion.spell,
	},

	on_attach = function(client)
		if client.server_capabilities.documentFormattingProvider then
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end
	end,
})
