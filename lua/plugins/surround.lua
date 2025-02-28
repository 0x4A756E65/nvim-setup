return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      -- You can customize keymaps here if needed
      -- Default keymaps:
      -- Normal mode: ys{motion}{char} to add surroundings
      -- Visual mode: S{char} to add surroundings
      -- Delete surroundings: ds{char}
      -- Change surroundings: cs{target}{replacement}
    })
  end,
}
