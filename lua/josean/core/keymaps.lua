vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- use usual ctrl + v to paste
vim.keymap.set("i", "<leader>p", "<C-r>+", { desc = "Paste from clipboard in insert mode" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- terminal
local terminal_open = false
local term_win_id = nil

vim.keymap.set("n", "<leader>t", function()
	if terminal_open and term_win_id and vim.api.nvim_win_is_valid(term_win_id) then
		vim.api.nvim_win_close(term_win_id, true)
		terminal_open = false
		term_win_id = nil
	else
		vim.cmd("vsplit | terminal")
		vim.cmd("vertical resize 80")
		vim.cmd("startinsert")

		term_win_id = vim.api.nvim_get_current_win()
		terminal_open = true
	end
end, { desc = "Toggle terminal on the right" }) -- Better terminal navigation

vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]]) -- Move left from terminal
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]]) -- Move right from terminal
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]]) -- Move down from terminal
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]]) -- Move up from terminal

-- Automatically enter insert mode when switching to terminal
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "term://*",
	command = "startinsert",
})

keymap.set("n", "<leader><leader>", "<cmd>w<CR>", { desc = "Save file" }) -- close current tab
