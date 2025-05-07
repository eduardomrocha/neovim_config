if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "olexsmir/gopher.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- "nvim-treesetter/nvim-treesitter",
  },
  config = function()
    require("gopher").setup({
      commands = {
        go = " go",
        gomodifytags = "gomodifytags",
        gotests = "~/go/bin/gotests",
        impl = "impl",
        iferr = "iferr",
      }
    })
  end,
  opts = {},
  event = "VeryLazy",
}
