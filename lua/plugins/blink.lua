return {
    {
        "saghen/blink.cmp",
	    version="*",

	    dependencies={ "rafamadriz/friendly-snippets" },

	    opts={
            keymap={ preset="default" },

		    appearance={ nerd_font_variant="mono" },

		    completion={
			    documentation={ auto_show=true },
                ghost_text={ enabled=true },
		    },

		    sources={ default={"lsp", "path", "snippets", "buffer"} },

            signature={ enabled=true },
	    },
	},
}
