return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      blue = "#65D1FF",
      green = "#3EFFDC",
      violet = "#FF61EF",
      yellow = "#FFDA7B",
      red = "#FF4A4A",
      fg = "#c3ccdc",
      -- bg = "#112638",
      bg = "#292e42",
      inactive_bg = "#2c3043",
    }

    local util = require("lspconfig.util")
    -- get root dir of current project
    local function get_root_dir()
      local root = util.root_pattern(".git")(vim.fn.expand("%:p:h"))
      if root == nil then
        return [[no project]]
      end
      return vim.fn.fnamemodify(root, ":t")
    end

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.semilightgray },
        c = { bg = colors.inactive_bg, fg = colors.semilightgray },
      },
    }

    local custom_tokyonight = require("lualine.themes.tokyonight")

    -- enable transparency
    -- custom_tokyonight.normal.c.bg = nil
    -- custom_tokyonight.inactive.c.bg = nil

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        -- theme = my_lualine_theme,
        theme = custom_tokyonight,
      },
      sections = {
        lualine_x = {
          { get_root_dir },
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
      extensions = {'quickfix', 'fugitive', 'nvim-tree'},
    })
  end,
}
