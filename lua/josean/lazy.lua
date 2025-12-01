-- Hide ONLY the nvim-lspconfig deprecation warning

vim.notify_original = vim.notify

-- Override to filter out specific warnings and stack traces
vim.notify = function(msg, ...)
	if type(msg) ~= "string" then
		return vim.notify_original(msg, ...)
	end

	-- Hide the deprecated 'require("lspconfig")' warning
	if msg:match("require%('lspconfig'%)") then
		return
	end

	-- Hide Mason / LSP stack trace warnings
	if msg:match("stack traceback:") then
		return
	end

	-- Otherwise, show normally
	return vim.notify_original(msg, ...)
end
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "josean.plugins" }, { import = "josean.plugins.lsp" } }, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
