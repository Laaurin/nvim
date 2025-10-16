-- ~/.config/nvim/lua/config/lsp.lua

local Util = require("lazyvim.util")
local lspconfig = require("lspconfig")

local on_attach = Util.lsp.on_attach
local capabilities = Util.lsp.capabilities

-- dynamisch globaler npm path
local npm_global = vim.fn.trim(vim.fn.system("npm root -g"))

if vim.fn.isdirectory(npm_global .. "/typescript/lib") == 0 then
  vim.notify("⚠️ TypeScript SDK nicht gefunden unter: " .. npm_global .. "/typescript/lib", vim.log.levels.WARN)
  print("typescript sdk nicht gefunden")
end

-- TypeScript / JavaScript
lspconfig.ts_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" },
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = npm_global .. "/@vue/typescript-plugin",
        languages = { "vue" },
      },
    },
  },
})
--
--  Python (pyright)
local venv_python = vim.fn.getcwd() .. "/.venv/bin/python"

if vim.fn.executable(venv_python) == 1 then
  vim.g.python3_host_prog = venv_python

  -- LSP für IntelliSense
  lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      python = {
        pythonPath = venv_python,
      },
    },
  })
  --
else
  lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
  --
end

-- Volar für Vue
--[[lspconfig.volar.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "typescript",
    "javascript",
    "javascriptreact",
    "typescriptreact",
    "vue",
  },
  init_options = {
    typescript = {
      tsdk = npm_global .. "/typescript/lib",
    },
    vue = {
      hybridMode = false,
    },
  },
})]]
--

-- Sonstige Basisserver
for _, lsp in ipairs({ "html", "cssls", "eslint", "clangd" }) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
