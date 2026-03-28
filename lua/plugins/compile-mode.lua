return {
    "ej-shafran/compile-mode.nvim",
    version = "^5.0.0",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "m00qek/baleia.nvim",
    },
    config = function()
        vim.g.compile_mode = {
            default_command = {
                python = "python %",
                lua = "lua %",
                javascript = "node %",
                typescript = "node %",
                c = "cc ",
                cpp = "g++ ",
                java = "javac ",
                go = "go run ",
            },
            bang_expansion = true,
            baleia_setup = true,
        }

        vim.api.nvim_create_autocmd({ "BufWinEnter", "BufNew" }, {
            pattern = "*compilation*",
            callback = function()
                vim.schedule(function()
                    vim.cmd("wincmd J")
                end)
            end,
        })
    end,
}
