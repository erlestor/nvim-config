require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Ctrl+S to save no amtter the mode
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Shift + j/k to go to places down/up
map("n", "<S-j>", "5j")
map("n", "<S-k>", "5k")

-- signature (eg. see type of something in typescript with gh)
map("n", "gh", vim.lsp.buf.hover)

-- move selected lines up and down with shift + j/k
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- step centered when jumping half page with ctrl + d/u
-- or when going next/previous search result
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- paste over text without overriding register with deleted text
map("x", "<leader>p", '"_dP')

-- copy to clipboard
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')

-- delete to clipboard
map("n", "<leader>d", '"_d')
map("v", "<leader>d", '"_d')

-- dont press Q lol
map("n", "Q", "nop")

-- replace each instance of the word you're on
map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- show diagnostics (error) window
map("n", "gl", function()
  local bufnr, _ = vim.diagnostic.open_float()
  vim.api.nvim_buf_set_option(bufnr, "filetype", vim.o.filetype)
end)

-- open lazygit
map("n", "<leader>gg", ":LazyGit<CR>")
