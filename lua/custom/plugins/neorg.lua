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
  {
    '3rd/image.nvim',
    dependencies = { 'luarocks.nvim' },
    opts = {
      backend = 'kitty', -- Kitty will provide the best experience, but you need a compatible terminal
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { 'markdown', 'vimwiki', 'quarto' }, -- markdown extensions (ie. quarto) can go here
        },
        neorg = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { 'norg' },
        },
      }, -- do whatever you want with image.nvim's integrations
      max_width = 100, -- tweak to preference
      max_height = 20, -- ^
      max_height_window_percentage = math.huge, -- this is necessary for a good experience
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true,
      window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', '' },
    },
  },
  {
    'benlubas/molten-nvim',
    version = '^1.0.0', -- use version <2.0.0 to avoid breaking changes
    dependencies = { '3rd/image.nvim' },
    build = ':UpdateRemotePlugins',
    init = function()
      -- these are examples, not defaults. Please see the readme
      vim.g.molten_image_provider = 'image.nvim'
      --vim.g.molten_output_win_max_height = 20
      vim.keymap.set('n', '<localleader>ji', ':MoltenInit<CR>', { silent = true, desc = 'Initialize the plugin' })
      vim.keymap.set('n', '<localleader>je', ':MoltenEvaluateOperator<CR>', { silent = true, desc = 'run operator selection' })
      vim.keymap.set('n', '<localleader>jl', ':MoltenEvaluateLine<CR>', { silent = true, desc = 'evaluate line' })
      vim.keymap.set('n', '<localleader>jr', ':MoltenReevaluateCell<CR>', { silent = true, desc = 're-evaluate cell' })
      vim.keymap.set('n', '<localleader>jo', ':noautocmd MoltenEnterOutput<CR>', { silent = true, desc = 'show/enter output' })
      vim.keymap.set('v', '<localleader>jv', ':<C-u>MoltenEvaluateVisual<CR>gv', { silent = true, desc = 'evaluate visual selection' })
    end,
  },
}
