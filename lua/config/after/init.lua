local on_attach = function(client, buffer)
	if client:supports_method("textDocument/documentSymbol") then
		require("nvim-navic").attach(client, buffer)
	end
end

vim.lsp.config("*", {
	on_attach = on_attach,
})
-- NOTE: Due to unknown reason ts_ls will use default config even applied "*" ones, so need to add this to override it
vim.lsp.config("ts_ls", {
	on_attach = on_attach,
})
