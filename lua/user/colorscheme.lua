local colorscheme = "rose-pine-moon"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end


-- Set colorscheme after options

