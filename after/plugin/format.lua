vim.g.ale_fixers = {
  javascript = { 'prettier' },
  typescript = { 'prettier' },
  typescriptreact = { 'prettier' },
  javascriptreact = { 'prettier' },
  svelte = { 'prettier' },
  astro = { 'prettier' },
  json = { 'prettier' },
  css = { 'prettier' },
  scss = { 'prettier' },
  html = { 'prettier' },
  markdown = { 'prettier' },
  yaml = { 'prettier' },
  graphql = { 'prettier' },
  vue = { 'prettier' },
  lua = { 'stylua' },
  rust = { 'rustfmt' },
  python = { 'black' },
}
vim.g.ale_linters = { rust = { 'cargo' } }
vim.g.ale_fix_on_save = 1
vim.g.ale_linters_explicit = 1
