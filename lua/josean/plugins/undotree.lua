return {
	"mbbill/undotree",
	config = function()
		vim.g.undotree_SetFocusWhenToggle = 1
		vim.g.undotree_WindowWidth = 30 -- Adjust this value for the desired width

		-- Set up undo history persistence
		if not vim.fn.isdirectory(vim.fn.expand("~/.local/share/nvim/undo")) then
			vim.fn.mkdir(vim.fn.expand("~/.local/share/nvim/undo"), "p")
		end

		vim.opt.undodir = vim.fn.expand("~/.local/share/nvim/undo") -- Path for undo files
		vim.opt.undofile = true -- Enable persistent undo
		vim.opt.undolevels = 1000 -- Max number of undo levels
		vim.opt.undoreload = 10000 -- Number of lines after which undo is reloaded

		vim.keymap.set("n", "<leader>ut", ":UndotreeToggle<CR>", { desc = "Toggle UndoTree" })
	end,
}
