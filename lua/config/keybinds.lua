vim.g.mapleader = " "
vim.g.maplocalleader = "."
vim.keymap.set("n", "<leader>e", vim.cmd.Oil)
--Competitive Programming
vim.keymap.set("n", "<localleader>t", "<cmd>CompetiTest run<CR>")
vim.keymap.set("n", "<localleader>rc", "<cmd>CompetiTest receive contest<CR>")
vim.keymap.set("n", "<localleader>rp", "<cmd>CompetiTest receive problem<CR>")
vim.keymap.set("n", "<localleader>at", "<cmd>CompetiTest add_testcase<CR>")
vim.keymap.set("n", "<localleader>et", "<cmd>CompetiTest edit_testcase<CR>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/bin/tmux-sessionizer<CR>")
vim.keymap.set("n", "<localleader>j", ":Compile<CR>")
-- toggle fugitive
local function toggle_fugitive()
    local winids = vim.api.nvim_list_wins()
    for _, id in ipairs(winids) do
        local bufnr = vim.api.nvim_win_get_buf(id)
        if vim.api.nvim_buf_get_name(bufnr):match("fugitive://") then
            vim.api.nvim_win_close(id, false)
            return
        end
    end
    vim.cmd("Git")
end
vim.keymap.set("n", "<leader>gs", toggle_fugitive)
