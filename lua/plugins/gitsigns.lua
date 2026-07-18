return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        require("gitsigns").setup({
            signs = {
                add          = { text = "│" },
                change       = { text = "│" },
                delete       = { text = "_" },
                topdelete    = { text = "‾" },
                changedelete = { text = "~" },
                untracked    = { text = "┆" },
            },

            current_line_blame = true,

            on_attach = function(bufnr)
                local gs = require("gitsigns")

                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
                end

                map("n", "]c", function()
                    if vim.wo.diff then return "]c" end
                    vim.schedule(gs.next_hunk)
                    return "<Ignore>"
                end, "Siguiente hunk")

                map("n", "[c", function()
                    if vim.wo.diff then return "[c" end
                    vim.schedule(gs.prev_hunk)
                    return "<Ignore>"
                end, "Hunk anterior")

                map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
                map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
                map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
                map("n", "<leader>hb", gs.blame_line, "Blame línea")
                map("n", "<leader>hd", gs.diffthis, "Diff contra index")

                map({ "o", "x" }, "ih", gs.select_hunk, "Seleccionar hunk")
            end,
        })
    end,
}
