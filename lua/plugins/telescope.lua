return {
    {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope", -- lazy load: nur wenn :Telescope benutzt wird
  keys = {
    { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<C-p>", "<cmd>Telescope git_files<cr>", desc = "Find git files" },
    { "<leader>ps", function()
        require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
      end, desc = "Grep search" },
  },
  },
  {
      "nvim-telescope/telescope-ui-select.nvim",
      config = function ()
            -- This is your opts table
    require("telescope").setup {
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- even more opts
          }
        }
      }
    }
    -- To get ui-select loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    require("telescope").load_extension("ui-select")
      end
  }
}

