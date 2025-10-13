-- lua/plugins/lsp/python.lua
local util = require("lspconfig.util")

require("lspconfig").pyright.setup {
  root_dir = util.root_pattern("pyproject.toml", "setup.py", "requirements.txt", ".git"),
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
    },
  },
  before_init = function(_, config)
    -- automatisch venv im Projektordner finden
    local venv = vim.fn.finddir(".venv", config.root_dir .. ";")
    if venv ~= "" then
      config.settings.python.pythonPath = config.root_dir .. "/.venv/bin/python"
    else
      -- fallback: system python
      config.settings.python.pythonPath = vim.fn.exepath("python3") or vim.fn.exepath("python")
    end
  end,
}
-- lua/plugins/lsp/python.lua
local util = require("lspconfig.util")

require("lspconfig").pyright.setup {
  root_dir = util.root_pattern("pyproject.toml", "setup.py", "requirements.txt", ".git"),
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
    },
  },
  before_init = function(_, config)
    -- automatisch venv im Projektordner finden
    local venv = vim.fn.finddir(".venv", config.root_dir .. ";")
    if venv ~= "" then
      config.settings.python.pythonPath = config.root_dir .. "/.venv/bin/python"
    else
      -- fallback: system python
      config.settings.python.pythonPath = vim.fn.exepath("python3") or vim.fn.exepath("python")
    end
  end,
}

