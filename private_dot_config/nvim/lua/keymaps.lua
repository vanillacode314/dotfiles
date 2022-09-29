local opts = { silent = true, noremap = true }

-- Global Clipboard using <leader>
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', opts)
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', opts)
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', opts)
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y', opts)
vim.keymap.set({ "n", "v" }, "<leader>d", '"+d', opts)
vim.keymap.set({ "n", "v" }, "<leader>D", '"+D', opts)

-- Move through buffers
vim.keymap.set("n", "<Tab>", "<cmd>bn<cr>", opts)
vim.keymap.set("n", "<S-Tab>", "<cmd>bp<cr>", opts)

-- Better visual shifts
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("n", "0", "^", opts)
vim.keymap.set("n", "^", "0", opts)

-- Disable Arrow Keys
vim.keymap.set("n", "<up>", "<nop>", opts)
vim.keymap.set("n", "<down>", "<nop>", opts)
vim.keymap.set("n", "<left>", "<nop>", opts)
vim.keymap.set("n", "<right>", "<nop>", opts)
