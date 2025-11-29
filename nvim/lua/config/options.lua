local merge = require("utils.deep_merge")

-- VIM OPTIONS

local vim_options = {
	opt = {
		expandtab = false,
		tabstop = 4,
		shiftwidth = 4,
		softtabstop = 4,
	},

	g = {
		autoformat = false,
		mapleader = ",",

		did_ident_on = 1,
		did_load_filetypes = 1,
	},

	o = {
		shell = "/home/memw/.cargo/bin/nu",
	},
}

merge.deep_merge(vim, vim_options)

-- MODULE OPTIONS

-- NOTE: refer to each module documentation.

require("config.modules.workspace_lsp_config").setup({
	rust_analyzer = {
		resolver_config = {
			aliases = { "rust" },
		},
	},

	just = {},
	dockerls = {},
	terraformls = {
		client_config = {
			cmd = { "terraform-ls", "serve" },
			filetypes = { "terraform", "terraform-vars", "tfvars", "tf", "hcl" },
		},
	},
	uvls = {
		client_config = {
			filetypes = { "py" }
		}
	}
})
