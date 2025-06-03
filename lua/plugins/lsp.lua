return { 
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        {
            'L3MON4D3/LuaSnip',
            build = (function()
                return 'make install_jsregexp'
            end)(),
            dependencies = {
                {
                  'rafamadriz/friendly-snippets',
                  config = function()
                    require('luasnip.loaders.from_vscode').lazy_load()
                  end,
                },
            },
        },
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    config = function()
        local cmp = require 'cmp'
        local luasnip = require 'luasnip'
        luasnip.config.setup {}

        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            enabled = function()
                local disabled = false
                disabled = disabled or (vim.api.nvim_get_option_value('buftype', { buf = 0 }) == 'prompt')
                disabled = disabled or (vim.fn.reg_recording() ~= '')
                disabled = disabled or (vim.fn.reg_executing() ~= '')
                disabled = disabled or require('cmp.config.context').in_treesitter_capture('comment')
                return not disabled
            end,
            completion = { completeopt = 'menu,menuone,noinsert', autocomplete = false },
            mapping = cmp.mapping.preset.insert {
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<CR>'] = cmp.mapping.confirm { select = true },
                ['<C-n>'] = cmp.mapping.complete {},
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'path' },
                { name = 'nvim_lsp_signature_help' },
            },
        }
    end,
}
