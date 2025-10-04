return {
  -- fzf binary helper
  {
    "junegunn/fzf",
    run = function()
      vim.fn["fzf#install"]()
    end,
  },
  -- fzf.vim integration
  { "junegunn/fzf.vim" },
}

