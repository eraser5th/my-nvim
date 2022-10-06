local M = {}

M.setup = function()
  local lsp_provider = function()
    local clients = vim.lsp.get_active_clients()
    local Table = require("module.Table")
    local clients_str = Table.join(
      Table.map(clients, function(client, _)
        return client.name
      end),
      " "
    )

    return clients_str
  end

  require("lualine").setup({
    options = {
      icons_enabled = true,
      theme = "duskfox",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = { "NvimTree" },
        winbar = { "NvimTree", "Terminal" },
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", lsp_provider, "diagnostics" },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "progress", "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {
      lualine_a = {
        {
          "tabs",
          max_length = vim.o.columns,
          mode = 2, -- 0: Shows tab_nr, 1: Shos tab_name, 2: Shows tab_nr + tab_name
        },
      },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    winbar = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = { "encoding", "fileformat" },
      lualine_z = { "filetype" },
    },
    inactive_winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    extensions = {},
  })
end

return M
