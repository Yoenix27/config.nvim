-- Only apply to C# files
if vim.bo.filetype ~= "cs" then
  return
end

-- Check if buffer is empty and file is Program.cs
local filename = vim.fn.expand("%:t")
if vim.fn.line('$') == 1 and vim.fn.getline(1) == '' and filename == "Program.cs" then
  local template_path = vim.fn.stdpath("config") .. "/templates/csharp_template.cs"
  
  if vim.fn.filereadable(template_path) == 1 then
    local content = vim.fn.readfile(template_path)
    
    -- Generate class name from directory name (for the template variables)
    local dirname = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    local classname = "Program"  -- Fixed as Program since we're using Program.cs
    
    -- Replace template variables
    for i, line in ipairs(content) do
      content[i] = line:gsub("%$%(DATE%)", os.date("%a %d %b %Y %H:%M"))
                     :gsub("%$%(CLASSNAME%)", classname)
                     :gsub("%$%(FILENAME%)", filename)
                     :gsub("%$%(NAMESPACE%)", dirname)
    end
    
    -- Apply template to buffer
    vim.api.nvim_buf_set_lines(0, 0, -1, false, content)
    
    -- Move cursor to a good position
    vim.api.nvim_win_set_cursor(0, {6, 0})
  end
end

-- Set C# specific settings
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = true
vim.bo.smartindent = true

-- Set compiler for C#
vim.cmd("compiler csharp")

-- Key mappings for C# development
local opts = { noremap = true, silent = true, buffer = true }
vim.keymap.set('n', '<leader>c', '<cmd>make<CR>', opts)
vim.keymap.set('n', '<leader>r', '<cmd>!dotnet run<CR>', opts)
