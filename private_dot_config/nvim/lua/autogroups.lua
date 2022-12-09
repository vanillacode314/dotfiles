vim.api.nvim_create_augroup("mygroup", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	group = "mygroup",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
	end,
})
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "mygroup",
	pattern = "plugins.lua",
	command = "PackerCompile",
})

vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("HighlightChanges", { clear = true }),
	callback = function()
		vim.cmd([[
			highlight Normal guibg=None ctermbg=None
			highlight FloatNormal guibg=None ctermbg=None
			highlight SignColumn guibg=None ctermbg=None
			highlight LineNr guibg=None ctermbg=None
			highlight Comment gui=italic cterm=italic 
			highlight Identifier gui=italic cterm=italic 
			highlight TSIdentifier gui=italic cterm=italic 
			highlight TSProperty gui=italic cterm=italic 
			highlight TSAttribute gui=italic cterm=italic 
			highlight Type gui=italic cterm=italic 
			highlight TSType gui=italic cterm=italic 
			" gray
			highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
			" blue
			highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
			highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
			" light blue
			highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
			highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
			highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
			" pink
			highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
			highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
			" front
			highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
			highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
			highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
      ]])
	end,
})
