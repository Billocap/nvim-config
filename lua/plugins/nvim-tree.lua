-- Nvim-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-tree/nvim-tree.lua

return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup {
      filters = {
        git_ignored = false,
        custom = {
          '\\.uid$',
        },
      },
    }

    local api = require 'nvim-tree.api'

    vim.keymap.set('n', 'l', function()
      if api.tree.is_tree_buf() then
        local node = api.tree.get_node_under_cursor()

        if node.name ~= '..' then
          api.node.open.edit(node)
        end
      else
        require('origami').l()
      end
    end)

    vim.keymap.set('n', 'h', function()
      if api.tree.is_tree_buf() then
        local node = api.tree.get_node_under_cursor()

        api.node.navigate.parent(node)
      else
        require('origami').h()
      end
    end)

    vim.keymap.set('n', '<C-n>', function()
      api.tree.toggle()
    end)
  end,
}
