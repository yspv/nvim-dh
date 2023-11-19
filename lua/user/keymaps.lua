local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Inssert key is changed to l/L
keymap("n", "l", "i", opts)
keymap("n", "L", "I", opts)
keymap("n", "F", "E", opts)
keymap("n", "f", "e", opts)
-- Navigation
keymap("n", "k", "h", opts)
keymap("n", "n", "j", opts)
keymap("n", "e", "k", opts)
keymap("n", "i", "l", opts)

-- Split Screen
keymap("n", "|", "<C-w>v", opts)
keymap("n", "_", "<C-w>s", opts)

-- Better window navigation
keymap("n", "<C-k>", "<C-w>h", opts)
keymap("n", "<C-n>", "<C-w>j", opts)
keymap("n", "<C-e>", "<C-w>k", opts)
keymap("n", "<C-i>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-i>", ":bnext<CR>", opts)
keymap("n", "<S-k>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-n>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-e>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Navigation
keymap("v", "k", "h", opts)
keymap("v", "n", "j", opts)
keymap("v", "e", "k", opts)
keymap("v", "i", "l", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-n>", ":m .+1<CR>==", opts)
keymap("v", "<A-e>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "N", ":move '>+1<CR>gv-gv", opts)
keymap("x", "E", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-n>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-e>", ":move '<-2<CR>gv-gv", opts)

-- Nvim-Tree --
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- Keyboard Shortcuts --
keymap("n", "<leader>b", "<cmd>BufferLinePickClose<CR>", opts) -- Close Buffer
keymap("n", "<leader>w", "<cmd>w!<cr>", opts)       -- Save File
keymap("i", "<C-e>", "<ESC>wa", opts)              -- Move curser end of word
keymap("i", "<C-,>", "<ESC>bi", opts)              -- Move cursor begin of word 
keymap("n", "<leader>g", "<S-g>", opts)            -- Go to line
--keymap("i", "<M>", "<C-o>", opts)
-- Terminal --
-- Better terminal navigation
keymap("t", "<C-k>", [[<C-\><C-n><C-W>h]], opts)
--keymap("t", "<C-n>", [[<C-\><C-n><C-W>j]], opts)
--keymap("t", "<C-e>", [[<C-\><C-n><C-W>k]], opts)
--keymap("t", "<C-i>", [[<C-\><C-n><C-W>l]], opts)
