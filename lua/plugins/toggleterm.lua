return {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",

    config = function()
        require("toggleterm").setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,

            open_mapping = [[<C-ñ>]], 

            direction = "horizontal",

            shade_terminals = true,
            start_in_insert = true,
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = true,
            close_on_exit = true,

            highlights = {
                FloatBorder = { guifg = "#7A0941", guibg = "NONE", },
            },

            float_opts = {
                -- border = "curved", 
                border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║", },
                winblend = 0,
            },
        })

        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
            vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
        end

        vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

        local Terminal = require("toggleterm.terminal").Terminal

        local float_term = Terminal:new({ direction = "float" })
        function _G.toggle_float_term()
            float_term:toggle()
        end
        vim.keymap.set("n", "<leader>tf", toggle_float_term, { desc = "Terminal flotante" })

        vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Terminal vertical" })

        vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Terminal horizontal" })
    end,
}
