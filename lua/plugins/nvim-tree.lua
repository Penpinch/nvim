return {
  "nvim-tree/nvim-tree.lua",
  version="*",
  lazy=false,
  dependencies={
    "nvim-tree/nvim-web-devicons",
  },
  config=function()
    require("nvim-tree").setup({
      view={
        width=30,
      },
      renderer={
        group_empty=true,
        icons={
          show={
            file=true,
            folder=true,
            folder_arrow=true,
            git=true,
          },
        },
      },
      filters={
        dotfiles=false,
      },
      git={
        enable=true,
      },
    })

    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc="Toggle file explorer" })
  end,
}
