return {
	{
		"folke/snacks.nvim",
		opts = {
			explorer = {
				enabled = false
			}
		}
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		    "nvim-tree/nvim-web-devicons",
		    "MunifTanjim/nui.nvim",
		},
		lazy = false,
		config = function()
			require("neo-tree").setup({
				filesystem = {
					filtered_items = {
						always_show = { ".github", ".gitignore", ".dockerignore" }
					}
				},
			})
		end
	}
}
