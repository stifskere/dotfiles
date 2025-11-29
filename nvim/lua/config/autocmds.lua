
-- Unmap any conflicting tab action
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd([[silent! iunmap <tab>]])
		vim.cmd([[tnoremap <Esc> <C-\><C-n>]])
	end,
})

-- Override for terraform files.
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
	pattern = {"*.tf", "*.tfvars"},
	callback = function()
		vim.bo.filetype = "terraform"
	end
})

-- Define the tabulation to 4 spaces for ALL files.
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.bo.expandtab = false
        vim.bo.tabstop = 4
        vim.bo.shiftwidth = 4
        vim.bo.softtabstop = 4
    end
})
