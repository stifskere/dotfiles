
-- Unmap any conflicting tab action
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd([[silent! iunmap <tab>]])
		vim.cmd([[tnoremap <Esc> <C-\><C-n>]])
	end,
})
