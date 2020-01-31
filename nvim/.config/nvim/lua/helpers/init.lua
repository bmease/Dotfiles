-- Create a new Neovim floating window
function createFloatingWindow(background)

  -- create a new empty buffer
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')

  -- get the editor's max width and height
  local editor_width = vim.api.nvim_get_option('columns')
  local editor_height = vim.api.nvim_get_option('lines')

  -- settings for the floating window
  local opts = {
    relative = 'editor',
    style = 'minimal',
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

function create_floating_window_borders()
  -- create a new empty buffer
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')

  -- get the editor's max width and height
  local editor_width = vim.api.nvim_get_option('columns')
  local editor_height = vim.api.nvim_get_option('lines')

  -- settings for the floating window
  local opts = {
    relative = 'editor',
    style = 'minimal',
    width = editor_width - 4,
    height = editor_height - 4,
    row = 2,
    col = 2
  }

  -- add border lines to the buffer
  local lines = create_border_lines()
  vim.api.nvim_buf_set_lines(buf, 0, editor_height - 5, false, lines)

  local win = create_floating_window_from_buffer(buf, opts)
  
  return win
end

function create_floating_window_from_buffer(buf, opts)
  -- create a new floating window and enter it
  local win = vim.api.nvim_open_win(buf, true, opts)

  -- add highlight
  vim.api.nvim_win_set_option(win, 'winhl', 'Normal:Floating')

  return win
end

function create_border_lines(width, height, options)
  local top_left = options.top_left or '┌'
  local top_right = options.top_right or '┐'
  local bottom_left = options.bottom_left or '└'
  local bottom_right = options.bottom_right or '┘'
  local horizontal_seperator = options.horizontal_seperator or '─'
  local vertical_seperator = options.vertical_seperator or '│'
  local empty_seperator = options.empty_seperator or ' '

  -- generate a single border line
  function buildLine(first, sep, last)
    return first .. string.rep(sep, width - 2) .. last
  end

  -- border line text
  local lines = {}

  -- top border
  lines[#lines+1] = buildLine(top_left, horizontal_seperator, top_right)

  -- main body borders
  for i = 2, height - 2 do
    lines[i] = buildLine(vertical_seperator, empty_seperator, vertical_seperator)
  end

  -- bottom border
  lines[#lines+1] = buildLine(bottom_left, horizontal_seperator, bottom_right)

  return lines
end

function floatingWindowBorders()
  -- create a new empty buffer
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')


  -- get the editor's max width and height
  local editor_width = vim.api.nvim_get_option('columns')
  local editor_height = vim.api.nvim_get_option('lines')

  -- settings for the floating window
  local opts = {
    relative = 'editor',
    style = 'minimal',
    width = editor_width - 4,
    height = editor_height - 4,
    row = 2,
    col = 2
  }

  -- set border text
  local border_text = {
    top_left = '┌',
    top_right = '┐',
    bottom_left = '└',
    bottom_right = '┘',
    horizontal_seperator = '─',
    vertical_seperator = '│',
  }

  -- generate a single border line
  function buildLine(first, sep, last)
    return first .. string.rep(sep, opts.width - 2) .. last
  end

  -- border line text
  local lines = {}

  -- top border
  lines[#lines+1] = buildLine(border_text.top_left, border_text.horizontal_seperator, border_text.top_right)

  -- main body borders
  for i = 2, opts['height'] - 2 do
    lines[i] = buildLine(border_text.vertical_seperator, " ", border_text.vertical_seperator)
  end

  -- bottom border
  lines[#lines+1] = buildLine(border_text.bottom_left, border_text.horizontal_seperator, border_text.bottom_right)

  -- add border lines to the buffer
  vim.api.nvim_buf_set_lines(buf, 0, editor_height - 5, false, lines)

  -- create a new floating window and enter it
  local win = vim.api.nvim_open_win(buf, true, opts)
  
  -- add highlight
  vim.api.nvim_win_set_option(win, 'winhl', 'Normal:Floating')

  return win
end
