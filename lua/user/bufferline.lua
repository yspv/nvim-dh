local status_ok, buffeline = pcall(require, "bufferline")
if not status_ok then
  return
end

buffeline.setup {
  options = {
    offsets = {{ filetype = "NvimTree", text = "Explorer", padding = 1 }},
  }
}
