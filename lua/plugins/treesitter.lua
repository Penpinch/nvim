return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",

    config = function()
        local ts = require("nvim-treesitter")

        local parsers = {
            "c",
            "cpp",
            "lua",
            "vim",
            "vimdoc",
            "bash",
            "markdown",
            "markdown_inline",
        }

        ts.install(parsers)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(args.match) or args.match
                local ok = pcall(vim.treesitter.start, args.buf, lang)
                if ok then
                    if args.match ~= "c" and args.match ~= "cpp" then
                        vim.bo[args.buf].indentexpr = "v:lua.vim.treesitter.indentexpr()"
                    end
                end
            end,
        })
    end,
}
