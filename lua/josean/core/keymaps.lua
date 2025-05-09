vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

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

--normal mode enter
vim.keymap.set("n", "<leader><cr>", [[i<cr><esc>]])

--clipboard
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["+d]])

--previous buffer
vim.keymap.set("n", "<leader>b", "<c-^>")

--duplicate line
vim.keymap.set("n", "<leader>a", "yyp")

--undo redo
vim.keymap.set("n", "U", "<c-r>")

--new line normal mode
vim.keymap.set("n", "<leader>o", "o<esc>")
vim.keymap.set("n", "<leader>O", "O<esc>")

--move in insert mode
vim.keymap.set("i", "<A-l>", "<C-o>l")
vim.keymap.set("i", "<A-j>", "<C-o>j")
vim.keymap.set("i", "<A-k>", "<C-o>k")
vim.keymap.set("i", "<A-h>", "<C-o>h")

--center page up / down / next / prev
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--better end of line
vim.keymap.set("n", ")", "$")
vim.keymap.set("v", ")", "$")

--visual move line
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

--append line below to this line
vim.keymap.set("n", "J", "mzJ`z")

-- terminal
local terminal_open = false
local term_win_id = nil
local term_bufnr = nil

vim.keymap.set("n", "<leader>t", function()
	if terminal_open and term_win_id and vim.api.nvim_win_is_valid(term_win_id) then
		vim.api.nvim_win_close(term_win_id, true)
		terminal_open = false
		term_win_id = nil
	else
		if term_bufnr and vim.api.nvim_buf_is_valid(term_bufnr) then
			-- Reuse the existing terminal buffer
			vim.cmd("vsplit")
			vim.cmd("vertical resize 80")
			vim.api.nvim_win_set_buf(0, term_bufnr)
		else
			-- Create a new terminal buffer
			vim.cmd("vsplit | terminal")
			term_bufnr = vim.api.nvim_get_current_buf()
			vim.cmd("vertical resize 80")
		end

		vim.cmd("startinsert")
		term_win_id = vim.api.nvim_get_current_win()
		terminal_open = true
	end
end, { desc = "Toggle terminal on the right" })
-- Hide terminal without exiting the shell
vim.keymap.set("t", "<C-h>", function()
	if terminal_open and term_win_id and vim.api.nvim_win_is_valid(term_win_id) then
		vim.api.nvim_win_close(term_win_id, true)
		terminal_open = false
		term_win_id = nil
	end
end, { desc = "Hide terminal without exiting shell" })
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]]) -- Move right from terminal
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]]) -- Move down from terminal
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]]) -- Move up from terminal

-- Automatically enter insert mode when switching to terminal
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "term://*",
	command = "startinsert",
})

keymap.set("n", "<leader><leader>", "<cmd>w<CR>", { desc = "Save file" }) -- save

-- create note file
vim.keymap.set("n", "<leader>0", function()
	while vim.fn.winnr() ~= 1 do
		vim.cmd("wincmd h")
	end
	if vim.fn.bufname() == "/home/mads/myNvimCheatSheat.txt" then
		vim.cmd("close")
		return
	end
	vim.cmd("50 vsplit")
	vim.cmd("e ~/myNvimCheatSheat.txt")
end)

--fix width
vim.keymap.set("n", "<leader>w", function()
	local size = vim.v.count -- Get the number before <leader>w
	if size > 0 then
		vim.cmd("vertical resize " .. size)
	else
		vim.cmd("vertical resize 40") -- Default width if no number is provided
	end
end, { silent = true })
