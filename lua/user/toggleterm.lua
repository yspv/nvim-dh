local status_ok, toggteterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggteterm.setup {
  size = 60,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "vertical",
	close_on_exit = true,
	shell = vim.o.shell,
  float_opt = {
    border = "curver"
  },
}

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-n>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-e>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-i>', [[<C-\><C-n><C-W>l]], opts)
end

--vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
