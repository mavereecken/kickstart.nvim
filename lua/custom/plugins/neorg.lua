return {
  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    -- config = true,
    opts = {
      rocks = { 'magick' },
    },
  },
  {
    'nvim-neorg/neorg',
    dependencies = { 'luarocks.nvim', 'jmbuhr/otter.nvim' },
    lazy = false,
    version = '*',
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.concealer'] = {},
          ['core.dirman'] = {
            config = {
              workspaces = {
                notes = '~/notes',
                gna = '~/projects/gna/2024_gna_analysis/notes',
              },
            },
          },
          ['core.integrations.otter'] = {},
          ['core.completion'] = {
            config = {
              engine = 'nvim-cmp',
            },
          },
          -- ['core.latex.renderer'] = {}, -- this requires nvim 0.10
        },
      }
    end,
  },
}
