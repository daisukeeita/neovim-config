return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin-latte]])
    end,
    opts = {
      transparent_background = true,
      integrations = {
        neotree = true,
        treesitter = true,
        blink_cmp = { style = 'bordered' },
      }
    }
  },
}
