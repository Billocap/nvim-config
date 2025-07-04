return {
  config = function()
    -- [[ Basic Keymaps ]]
    --  See `:help vim.keymap.set()`

    -- Clear highlights on search when pressing <Esc> in normal mode
    --  See `:help hlsearch`
    vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

    -- Diagnostic keymaps
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

    -- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
    -- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
    -- is not what someone will guess without a bit more experience.
    --
    -- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
    -- or just use <C-\><C-n> to exit terminal mode
    vim.keymap.set('t', '<C-x>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

    -- Keybinds to make split navigation easier.
    --  Use CTRL+<hjkl> to switch between windows
    --
    --  See `:help wincmd` for a list of all window commands
    vim.keymap.set('n', '<C-h>', '<C-w><C-h>', {
      desc = 'Move focus to the left window',
      noremap = true,
    })
    vim.keymap.set('n', '<C-l>', '<C-w><C-l>', {
      desc = 'Move focus to the right window',
      noremap = true,
    })
    vim.keymap.set('n', '<C-j>', '<C-w><C-j>', {
      desc = 'Move focus to the lower window',
      noremap = true,
    })
    vim.keymap.set('n', '<C-k>', '<C-w><C-k>', {
      desc = 'Move focus to the upper window',
      noremap = true,
    })

    -- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
    vim.keymap.set('n', 'H', '<C-w>H', { desc = 'Move window to the left' })
    vim.keymap.set('n', 'L', '<C-w>L', { desc = 'Move window to the right' })
    vim.keymap.set('n', 'J', '<C-w>J', { desc = 'Move window to the lower' })
    vim.keymap.set('n', 'K', '<C-w>K', { desc = 'Move window to the upper' })

    vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Saves the changes in the current buffer' })

    vim.keymap.set('n', '<Tab>', ':bnext<CR>')
    vim.keymap.set('n', '<S-Tab>', ':bprev<CR>')
    vim.keymap.set('n', '<leader>X', ':q<CR>', { silent = true, desc = 'Closes current window' })

    vim.keymap.set({ 'n', 'i' }, '<leader>k', vim.lsp.buf.hover, {
      silent = true,
      noremap = true,
      desc = 'Fetches the documentation fo a specific item',
    })
  end,
}
