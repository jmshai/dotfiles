return {
  "lervag/vimtex",
  lazy = false,
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- PDF Viewer settings
	vim.g.vimtex_view_method = 'general'
    vim.g.vimtex_view_general_viewer = 'zathura'

    
	-- Compiler settings
    vim.g.vimtex_compiler_method = "latexmk"
    
    -- Configure latexmk options
    vim.g.vimtex_compiler_latexmk = {
      build_dir = '',
      callback = 1,
      continuous = 1,
      executable = 'latexmk',
      hooks = {},
      options = {
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
      },
    }
    
    -- TOC (Table of Contents) settings
    vim.g.vimtex_toc_config = {
      name = 'TOC',
      layers = {'content', 'todo', 'include'},
      split_width = 25,
      todo_sorted = 0,
      show_help = 1,
      show_numbers = 1,
    }
    
    -- Quickfix settings (error window)
    vim.g.vimtex_quickfix_mode = 0  -- Don't auto-open quickfix on errors
    
    -- Conceal settings (hides LaTeX syntax for cleaner view)
    vim.g.vimtex_syntax_conceal = {
      accents = 1,
      ligatures = 1,
      cites = 1,
      fancy = 1,
      spacing = 0,
      greek = 1,
      math_bounds = 0,
      math_delimiters = 1,
      math_fracs = 1,
      math_super_sub = 1,
      math_symbols = 1,
      sections = 0,
      styles = 1,
    }
  end
}
