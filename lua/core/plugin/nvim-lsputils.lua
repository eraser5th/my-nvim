local M = {}

M.setup = function()
  vim.lsp.handlers["textDocument/codeAction"] =
    require("lsputil.codeAction").code_action_handler

  vim.lsp.handlers["textDocument/references"] =
    require("lsputil.locations").references_handler

  vim.lsp.handlers["textDocument/definition"] =
    require("lsputil.locations").definition_handler

  vim.lsp.handlers["textDocument/declaration"] =
    require("lsputil.locations").declaration_handler

  vim.lsp.handlers["textDocument/typeDefinition"] =
    require("lsputil.locations").typeDefinition_handler

  vim.lsp.handlers["textDocument/implementation"] =
    require("lsputil.locations").implementation_handler

  vim.lsp.handlers["textDocument/documentSymbol"] =
    require("lsputil.symbols").document_handler

  vim.lsp.handlers["workspace/symbol"] =
    require("lsputil.symbols").workspace_handler

  vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, {
      border = "single",
    })

  local border_chars = {
    TOP_LEFT = "┌",
    TOP_RIGHT = "┐",
    MID_HORIZONTAL = "─",
    MID_VERTICAL = "│",
    BOTTOM_LEFT = "└",
    BOTTOM_RIGHT = "┘",
  }
  vim.g.lsp_utils_location_opts = {
    height = 24,
    mode = "editor",
    preview = {
      title = "Location Preview",
      border = true,
      border_chars = border_chars,
    },
    keymaps = {
      n = {
        ["<C-n>"] = "j",
        ["<C-p>"] = "k",
      },
    },
  }
  vim.g.lsp_utils_symbols_opts = {
    height = 24,
    mode = "editor",
    preview = {
      title = "Symbols Preview",
      border = true,
      border_chars = border_chars,
    },
    prompt = {},
  }
end

return M
