local lspconfig = require 'lspconfig'
lspconfig.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        ruff = {
          enabled = true,
          extendSelect = { 'I' },
        },
      },
    },
  },
}
