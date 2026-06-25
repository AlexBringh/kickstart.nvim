vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.fbs",
  command = "setfiletype fbs",
})
