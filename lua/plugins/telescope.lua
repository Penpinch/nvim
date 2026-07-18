return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make", -- requiere make y gcc, ya los tienes si compilaste treesitter
        },
    },

    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                prompt_prefix = " 🔍 ",
                selection_caret = " ",
                sorting_strategy = "ascending",
                layout_config = {
                    prompt_position = "top",
                },
                mappings = {
                    i = {
                        ["<C-j>"] = "move_selection_next",
                        ["<C-k>"] = "move_selection_previous",
                        ["<Esc>"] = "close",
                    },
                },
            },

            pickers = {
                find_files = {
                    hidden = true, -- muestra archivos ocultos (dotfiles)
                },
            },

            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        })

        telescope.load_extension("fzf")

        local builtin = require("telescope.builtin")
        local map = vim.keymap.set

        map("n", "<leader>ff", builtin.find_files, { desc = "Buscar archivos" })
        map("n", "<leader>fg", builtin.live_grep, { desc = "Grep en proyecto" })
        map("n", "<leader>fb", builtin.buffers, { desc = "Buffers abiertos" })
        map("n", "<leader>fh", builtin.help_tags, { desc = "Ayuda de Neovim" })
        map("n", "<leader>fo", builtin.oldfiles, { desc = "Archivos recientes" })
        map("n", "<leader>fw", builtin.grep_string, { desc = "Buscar palabra bajo el cursor" })
    end,
}
