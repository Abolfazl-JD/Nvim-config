return {
	"Exafunction/codeium.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({
			enable_cmp_source = true, -- Ensure Codeium is enabled in nvim-cmp
			virtual_text = {
				enabled = true, -- Show suggestions automatically
				manual = false, -- Automatically show inline suggestions (like VSCode)
				idle_delay = 75, -- Time (ms) before Codeium suggests completions
				key_bindings = {
					accept = "<Tab>", -- Press Tab to accept suggestions (VSCode-like)
					next = "<M-]>", -- Move to next suggestion
					prev = "<M-[>", -- Move to previous suggestion
				},
			},
		})
	end,
}
