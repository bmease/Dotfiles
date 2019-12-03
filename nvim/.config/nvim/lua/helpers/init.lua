-- Create a new Neovim floating window
function createFloatingWindow(background)

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

  -- if background then
  --   local bgopts = {
  --     relative = "editor",
  --     style = "minimal",
  --     width = editor_width - 3,
  --     height = editor_height - 3,
  --     row = 1,
  --     col = 1
  --   }
  --
  --   -- create a background window
  --   local bgbuf = vim.api.nvim_create_buf(false, true)
  --   local bgwin = vim.api.nvim_open_win(bgbuf, false, bgopts)
  --   vim.api.nvim_win_set_option(bgwin, 'winhl', 'Normal:FloatingBG')
  --
  --   -- vim.api.nvim_command('au BufWipeout <buffer> exe "bw "' .. buf)
  --   --
  --   -- vim.api.nvim_buf_attach(buf, false, {
  --   --   on_detach = function() vim.api.nvim_win_close(bgwin, true) end
  --   -- })
  --   --
  --   -- vim.api.nvim_win_close(bgwin, true)
  -- end

  -- create a new floating window and enter it
  local win = vim.api.nvim_open_win(buf, true, opts)
  
  -- add highlight
  vim.api.nvim_win_set_option(win, 'winhl', 'Normal:Floating')

  return win
end

function floatingWindowCommand(...)
  local commands = {...}
  print(commands)
end
