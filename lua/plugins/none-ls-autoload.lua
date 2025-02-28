return {
	"zeioth/none-ls-autoload.nvim",
	event = "BufEnter",
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
		"zeioth/none-ls-external-sources.nvim",
	},
	opts = {
		methods = {
			diagnostics = true,
			formatting = true,
			code_actions = true,
			completion = true,
			hover = true,
		},
		external_sources = {
			-- diagnostics
			"none-ls-external-sources.diagnostics.eslint",
			-- formatting
			"none-ls-external-sources.formatting.eslint",
			-- code actions
			"none-ls-external-sources.code_actions.eslint",
		},
	},
}
