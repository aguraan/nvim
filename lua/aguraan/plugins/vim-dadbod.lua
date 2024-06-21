return {
  "tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-completion",
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", lazy = true },
    },
    init = function()
      vim.cmd([[hi NotificationInfo guifg=#65D1FF guibg=#292e42]])
      vim.cmd([[hi NotificationWarning guifg=#FFDA7B guibg=#292e42]])
      vim.cmd([[hi NotificationError guifg=#FF4A4A guibg=#292e42]])

      vim.g.db_ui_use_nerd_fonts = 1
    end,
  }
}
