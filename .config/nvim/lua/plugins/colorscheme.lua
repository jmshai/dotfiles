return {
  {
    "neanias/everforest-nvim",
    priority = 1000,
    lazy = false,
    init = function()
      vim.o.background = "dark"
    end,
    config = function()
      require("everforest").setup({
        background = "soft",
      })
      vim.cmd("colorscheme everforest")
    end,
  },
}
