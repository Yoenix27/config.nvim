local function load_template()
  local template_dir = vim.fn.stdpath("config") .. "/templates/"
  local ft = vim.bo.filetype
  local template = template_dir .. ft .. "_template." .. ft

  if vim.fn.filereadable(template) == 0 then
    vim.notify("No template found for filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  local content = vim.fn.readfile(template)
  for i, line in ipairs(content) do
    content[i] = line:gsub("%$%(DATE%)", os.date("%a %d %b %Y %H:%M"))
  end
  vim.api.nvim_buf_set_lines(0, 0, -1, false, content)
end

vim.keymap.set("n", "<leader>ct", load_template, { desc = "Load template" })
