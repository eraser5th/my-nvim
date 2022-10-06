local M = {}
M.setup = function()
  vim.opt.listchars:append("space:⋅")

  require("indent_blankline").setup({
    -- for example, context is off by default, use this to turn it on
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    show_trailing_blankline_indent = true,
  })
end
return M
