return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })

		vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
			pattern = "*",
			callback = function()
				if vim.bo.modified and vim.bo.filetype ~= "" and vim.bo.buftype == "" then
					-- Trigger conform format
					conform.format({
						lsp_fallback = true,
						async = false,
						timeout_ms = 1000,
					})
					-- Save the file after formatting
					vim.cmd("silent! w")
					vim.cmd([[echo "󰄬 saved"]]) -- Display "Saved" message
					vim.defer_fn(function()
						vim.cmd([[echo ""]]) -- Hide the "Saved" message after 3 seconds
					end, 3000)
				end
			end,
		})
	end,
}
