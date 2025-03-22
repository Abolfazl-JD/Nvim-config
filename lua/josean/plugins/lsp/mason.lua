return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install (backend-focused)
			ensure_installed = {
				"ts_ls", -- TypeScript/JavaScript
				"yamlls", -- YAML (Docker Compose, K8s configs)
				"dockerls", -- Docker Language Server
				"docker_compose_language_service", -- Docker Compose support
				"bashls", -- Bash scripting
				"lua_ls", -- Lua for Neovim configuration
				"sqlls", -- SQL Language Server (for PostgreSQL)
				"marksman", -- Markdown support
			},
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"eslint_d", -- js linter
			},
		})
	end,
}
