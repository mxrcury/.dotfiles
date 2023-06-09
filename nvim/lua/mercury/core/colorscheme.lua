local status, _ = pcall(vim.cmd, "colorscheme lighthaus")

if not status then
  print("Colorscheme not found.")
  return
end
