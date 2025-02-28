return {
	-- Bufferline for tab display
	{
		"akinsho/bufferline.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"famiu/bufdelete.nvim", -- Add bufdelete as dependency
		},
		version = "*",
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					numbers = "none",
					close_command = "Bdelete! %d", -- Use Bdelete from bufdelete.nvim
					right_mouse_command = "Bdelete! %d",
					left_mouse_command = "buffer %d",
					indicator = {
						icon = "▎",
						style = "icon",
					},
					buffer_close_icon = "󰅖",
					modified_icon = "●",
					close_icon = "",
					left_trunc_marker = "",
					right_trunc_marker = "",
					diagnostics = "nvim_lsp",
					diagnostics_indicator = function(count, level)
						local icon = level:match("error") and " " or " "
						return " " .. icon .. count
					end,
					offsets = {
						{
							filetype = "neo-tree",
							text = "File Explorer",
							separator = true,
						},
					},
					separator_style = "thin",
					always_show_bufferline = true,
				},
			})

			-- Tab and Shift-Tab to navigate between buffers
			vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
			vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })

			vim.keymap.set("n", "<leader>bd", function()
				pcall(vim.cmd.Bdelete)
			end, { silent = true, desc = "Delete current buffer" })
		end,
	},
}
