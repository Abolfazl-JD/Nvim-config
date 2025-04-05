return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
		}

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "trigger linting for current file" })
	end,
}
