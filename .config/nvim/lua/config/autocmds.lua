-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd([[
augroup snake_syn
    autocmd!
    autocmd Filetype snakemake set tabstop=4 shiftwidth=4 commentstring=#\ %s
    autocmd Filetype snakemake syn keyword pythonBuiltinObj paths
    autocmd Filetype snakemake highlight link pythonBuiltinObj Identifier
    autocmd Filetype snakemake highlight link pythonBuiltinFunc Function
    autocmd Filetype snakemake highlight link pythonBuiltinType Structure
augroup end
]])
