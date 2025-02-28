return {
  "ggandor/leap.nvim",
  lazy = false,
  keys = {
    { "s", mode = { "n", "x", "o" }, desc = "Leap Forward to" },
    { "S", mode = { "n", "x", "o" }, desc = "Leap Backward to" },
    { "gs", mode = { "n", "x", "o" }, desc = "Leap from Windows" },
  },
  config = function(_, opts)
    local leap = require "leap"
    for k, v in pairs(opts) do
      leap.opts[k] = v
    end
    leap.add_default_mappings(true)
    -- Unbind `x` and `X` only if they exist
    pcall(vim.keymap.del, { "x", "o" }, "x")
    pcall(vim.keymap.del, { "x", "o" }, "X")
  end,
}
