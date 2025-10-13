return {
  -- 1️⃣  Farbschema
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme gruvbox]])
    end,
  },

  -- 2️⃣  LazyVim aktiv lassen, aber visuelle Sachen abschalten
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  -- 3️⃣  Unerwünschte grafische Plugins deaktivieren
  { "folke/noice.nvim", enabled = false },
  { "nvim-lualine/lualine.nvim", enabled = false },
  { "folke/which-key.nvim", enabled = false },
  { "goolord/alpha-nvim", enabled = false },
  { "nvim-mini/mini.animate", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  { "akinsho/bufferline.nvim", enabled = false },
}
