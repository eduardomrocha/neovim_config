-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- javascript, typescript
      -- require "none-ls.code_actions.eslint_d",
      -- require "none-ls.formatting.eslint_d",
      -- require "none-ls.diagnostics.eslint_d",

      -- css, scss, less, sass
      -- null_ls.builtins.formatting.stylelint,
      -- null_ls.builtins.diagnostics.stylelint,

      -- golang
      -- null_ls.builtins.formatting.golines,
      -- null_ls.builtins.diagnostics.revive,

      -- html
      -- null_ls.builtins.formatting.tidy,
      -- null_ls.builtins.diagnostics.tidy,

      -- lua
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.diagnostics.selene,

      -- markdown
      -- null_ls.builtins.formatting.markdownlint,
      -- null_ls.builtins.diagnostics.markdownlint,

      -- python
      null_ls.builtins.formatting.isort.with { extra_args = { "--line-width", "120" } },
      null_ls.builtins.diagnostics.mypy,
      require("none-ls.diagnostics.ruff").with {
        extra_args = {
          "--line-length",
          "120",
          "--select",
          "C90,I,E,W,PL", -- mccabe, isort, pycodestyle, pylint
        },
      },

      -- yaml, graphql, json
      -- null_ls.builtins.formatting.prettierd.with {
      --   filetypes = {
      --     "yaml",
      --     "graphql",
      --     "json",
      --   },
      -- },
      -- null_ls.builtins.diagnostics.yamllint,

      -- dockerfile
      -- null_ls.builtins.diagnostics.hadolint,
    }
    return config -- return final config table
  end,
}
