-- Create a new Neovim floating window
function createFloatingWindow()

  -- create a new empty buffer
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')

  -- get the editor's max width and height
  local editor_width = vim.api.nvim_get_option("columns")
  local editor_height = vim.api.nvim_get_option("lines")

  -- settings for the floating window
  local opts = {
    relative = "editor",
    style = "minimal",
    width = editor_width - 4,
    height = editor_height - 4,
    row = 2,
    col = 2
  }

  -- create a new floating window
  local win = vim.api.nvim_open_win(buf, true, opts)
end
