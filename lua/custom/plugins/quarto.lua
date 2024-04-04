return {
  {
    'quarto-dev/quarto-nvim',
    opts = {
      keymap = {
        rename = '<leader>rn',
      },
    },
    dependencies = { {
      'jmbuhr/otter.nvim',
      opts = {},
    } },
  },
}
