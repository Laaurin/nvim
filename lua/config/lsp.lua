-- ~/.config/nvim/lua/config/lsp.lua

local Util = require("lazyvim.util")
local lspconfig = require("lspconfig")

local on_attach = Util.lsp.on_attach
local capabilities = Util.lsp.capabilities

-- 🧹 vue_ls deaktivieren, falls LazyVim oder Mason ihn lädt
if lspconfig.vue_ls then
  lspconfig.vue_ls = nil
end

-- 🪄 dynamisch globaler npm path
local npm_global = vim.fn.trim(vim.fn.system("npm root -g"))

if vim.fn.isdirectory(npm_global .. "/typescript/lib") == 0 then
  vim.notify("⚠️ TypeScript SDK nicht gefunden unter: " .. npm_global .. "/typescript/lib", vim.log.levels.WARN)
  print("typescript sdk nicht gefunden")
end

-- ⚡ TypeScript / JavaScript
lspconfig.ts_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" }, -- ohne vue!
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

-- ⚡ Volar für Vue
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

-- ⚡ Sonstige Basisserver
for _, lsp in ipairs({ "html", "cssls", "eslint", "clangd" }) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
