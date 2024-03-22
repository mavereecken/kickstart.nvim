return {
  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    config = true,
  },
  {
    'nvim-neorg/neorg',
    dependencies = { 'luarocks.nvim' },
    build = ':Neorg sync-parsers',
    -- tag = "*",
    lazy = true, -- enable lazy load
    ft = 'norg', -- lazy load on file type
    cmd = 'Neorg', -- lazy load on command
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {}, -- Loads default behaviour
          ['core.concealer'] = {}, -- Adds pretty icons to your documents
          ['core.dirman'] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = '~/notes',
                gna = '~/projects/gna/notes/',
              },
            },
          },
        },
      }
    end,
  },
}
