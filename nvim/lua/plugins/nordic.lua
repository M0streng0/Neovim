return {
  "AlexvZyl/nordic.nvim",
  lazy = false,
  priority = 999,
  config = function()
    require("nordic").load()
  end,
}
