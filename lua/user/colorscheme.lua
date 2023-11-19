local colorscheme = "solarized-flat"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end


-- Preto
vim.cmd("hi! link SignColumn Normal")
--vim.cmd("hi! link Comment Error")

vim.cmd("hi LineNr guibg=none")
vim.cmd("hi VertSplit guibg=none")
--vim.cmd("hi WinSeparator guibg=none")
--vim.cmd("hi @punctuation guifg=#839496")
--vim.cmd("hi @operator guifg=#839496")
--vim.cmd("hi @variable guifg=#839496")

-- Set colorscheme after options

