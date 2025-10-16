-- return {
--   {
--     "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       vim.cmd([[colorscheme tokyonight]])
--     end,
--   },
-- }

-- return {
--   {
--     "EdenEast/nightfox.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require("nightfox").setup({
--         options = {
--           transparent = true, -- <── das ist der entscheidende Schalter
--           terminal_colors = true,
--           styles = {
--             comments = "italic",
--             keywords = "bold",
--             functions = "NONE",
--             types = "italic,bold",
--           },
--         },
--       })
--       vim.cmd("colorscheme dayfox") -- oder duskfox, etc.
--     end,
--   },
-- }

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "frappe", -- oder "latte", "macchiato", "mocha"
        transparent_background = true,
        integrations = {
          treesitter = true,
          native_lsp = { enabled = true },
          cmp = true,
          telescope = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}

-- return {
--   {
--     "craftzdog/solarized-osaka.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require("solarized-osaka").setup({
--         transparent = false,
--       })
--       vim.cmd.colorscheme("solarized-osaka") -- ✅ Theme aktivieren
--     end,
--   },
-- }
