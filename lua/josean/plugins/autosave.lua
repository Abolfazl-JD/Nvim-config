return {
	"Pocco81/auto-save.nvim",
	config = function()
		require("auto-save").setup({
			enabled = true, -- Auto-save is enabled by default
		})

		-- Key mapping to toggle auto-save
		vim.api.nvim_set_keymap("n", "<leader>n", ":ASToggle<CR>", { desc = "Toggle Auto-Save" })
	end,
}
