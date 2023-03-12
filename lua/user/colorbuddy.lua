local status_ok, colorbuddy = pcall(require, "colorbuddy")
if not status_ok then
    return
end

colorbuddy.colorscheme('cobalt2')
