return {
	"mg979/vim-visual-multi",
	branch = "master",
	init = function()
		vim.g.VM_default_mappings = 0
		vim.keymap.set("n", "<leader>mA", "<Plug>(VM-Find-Under)", { desc = "Select word under cursor" })
		vim.keymap.set("n", "<leader>ma", "<Plug>(VM-Select-All)", { desc = "Select all matches of word" })
	end,
}
