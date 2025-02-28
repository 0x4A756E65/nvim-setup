return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzf-native.nvim", -- Optional: for better performance
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				-- Ignore .gitignored files
				file_ignore_patterns = {
					"^.git/",
					"node_modules/",
					"build/",
					"dist/",
				},
				mappings = {
					i = {
						-- Add common actions in insert mode
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
			},
			pickers = {
				live_grep = {
					additional_args = function()
						return { "--hidden" } -- Search hidden files
					end,
				},
			},
		})

		-- Optional: load fzf native for better performance
		pcall(telescope.load_extension, "fzf")

		-- Keymappings
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })

		-- New: Search in current buffer
		vim.keymap.set("n", "<leader>fb", builtin.current_buffer_fuzzy_find, { desc = "Find in current buffer" })

		-- Additional useful keymaps
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find keymaps" })
	end,
}
