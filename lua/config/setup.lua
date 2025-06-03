-- vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function(ev)
--         local client = vim.lsp.get_client_by_id(ev.data.client_id)
--         if client.supports_method("textDocument/completion") then
--             vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })
--         end
--     end
-- })
--
-- vim.keymap.set("i", "<c-n>", function()
--     vim.lsp.completion.get()
-- end)


vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
vim.opt.clipboard = 'unnamedplus'
vim.o.tabstop = 4
vim.o.expandtab = true 
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "no"
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }

-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.undofile = true
vim.opt.inccommand = 'split'

vim.opt.timeoutlen = 500
vim.opt.updatetime = 300

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

function LspName()
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return ""
    end
    local client_names = {}
    for _, client in pairs(clients) do
        table.insert(client_names, client.name)
    end
    return "[" .. table.concat(client_names, ", ") .. "]"
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function()
        vim.o.statusline = "%f %y %m %= %l:%c %{v:lua.LspName()}"
    end
})

vim.api.nvim_set_keymap('v', '<Esc>', '<Esc>gvo<Esc>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<leader>sf", "<cmd>source<CR>", opts)

vim.keymap.set("n", "]e", vim.diagnostic.goto_next)
vim.keymap.set("n", "[e", vim.diagnostic.goto_prev)

vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", opts)
vim.keymap.set("n", "<leader>q", "<cmd>confirm q<CR>", opts)
vim.keymap.set("n", "<leader>Q", "<cmd>confirm qall<CR>", opts)
vim.keymap.set("n", "<leader>c", "<cmd>confirm bdelete<CR>", opts)
vim.keymap.set("n", "<leader>n", "<cmd>enew<CR>", opts)
vim.keymap.set("n", "<leader>/", "gcc")
vim.keymap.set("x", "<leader>/", "gc")

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("v", "p", '"_dP', opts)
vim.keymap.set("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

vim.keymap.set("v", "<", "<gv^", opts)
vim.keymap.set("v", ">", ">gv^", opts)
