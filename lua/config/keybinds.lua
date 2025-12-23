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
