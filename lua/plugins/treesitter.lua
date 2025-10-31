return {
    "nvim-treesitter/nvim-treesitter",  -- Fixed plugin name
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")  -- Fixed require path
        configs.setup({
            highlight = {
                enable = true,
            },
            indent = { enable = true },
            autotag = { enable = true },  -- Fixed: "autotag" not "autotage"
            ensure_installed = {
                "lua",     -- Fixed: "lua" not "lus"
                "tsx",
                "typescript", 
                "php",
                "javascript",  -- Recommended addition
                "html",        -- Recommended addition
                "css",         -- Recommended addition
                "json",        -- Recommended addition
            },
            auto_install = true,  -- Changed to true for better experience
        })
    end
}
