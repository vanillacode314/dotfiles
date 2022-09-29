vim.api.nvim_create_autocmd({ "CursorHold", "InsertLeave", "InsertEnter" }, {
	pattern = "*",
	group = vim.api.nvim_create_augroup("LspSagaHold", { clear = true }),
	command = "Lspsaga show_line_diagnostics",
})
vim.diagnostic.config({
	virtual_text = {
		prefix = "",
	},
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = false,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
