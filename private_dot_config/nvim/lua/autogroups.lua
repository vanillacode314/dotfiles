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
vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
	group = "mygroup",
	pattern = "*.svx",
	command = "setfiletype markdown",
})
