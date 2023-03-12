local status_ok, colorizer = pcall(require, "nvim-colorizer")
if not status_ok then
  return
end

colorizer.setup {}
