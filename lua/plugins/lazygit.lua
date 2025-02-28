return {
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- Set up the keybinding
    vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", { silent = true })
  end,
}
