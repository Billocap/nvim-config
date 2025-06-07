return {
  'stevearc/overseer.nvim',
  config = function()
    require('overseer').setup {
      -- Patch nvim-dap to support preLaunchTask and postDebugTask
      dap = true,
      -- Configure the task list
      task_list = {
        -- Set keymap to false to remove default behavior
        -- You can add custom keymaps here as well (anything vim.keymap.set accepts)
        bindings = {
          ['g?'] = 'ShowHelp',
          ['<CR>'] = 'RunAction',
          ['<C-e>'] = 'Edit',
          ['o'] = 'Open',
          ['<C-v>'] = 'OpenVsplit',
          ['<C-s>'] = 'OpenSplit',
          ['<C-f>'] = 'OpenFloat',
          ['<C-q>'] = 'OpenQuickFix',
          ['p'] = 'TogglePreview',
          ['l'] = 'IncreaseDetail',
          ['h'] = 'DecreaseDetail',
          ['L'] = false,
          ['H'] = false,
          ['['] = 'DecreaseWidth',
          [']'] = 'IncreaseWidth',
          ['{'] = 'PrevTask',
          ['}'] = 'NextTask',
          ['<C-k>'] = false,
          ['<C-j>'] = false,
          ['q'] = 'Close',
        },
      },
      task_launcher = {
        -- Set keymap to false to remove default behavior
        -- You can add custom keymaps here as well (anything vim.keymap.set accepts)
        bindings = {
          i = {
            ['<C-s>'] = 'Submit',
            ['<C-c>'] = 'Cancel',
          },
          n = {
            ['<CR>'] = 'Submit',
            ['<C-s>'] = 'Submit',
            ['q'] = 'Cancel',
            ['?'] = 'ShowHelp',
          },
        },
      },
      task_editor = {
        -- Set keymap to false to remove default behavior
        -- You can add custom keymaps here as well (anything vim.keymap.set accepts)
        bindings = {
          i = {
            ['<CR>'] = 'NextOrSubmit',
            ['<C-s>'] = 'Submit',
            ['<Tab>'] = 'Next',
            ['<S-Tab>'] = 'Prev',
            ['<C-c>'] = 'Cancel',
          },
          n = {
            ['<CR>'] = 'NextOrSubmit',
            ['<C-s>'] = 'Submit',
            ['<Tab>'] = 'Next',
            ['<S-Tab>'] = 'Prev',
            ['q'] = 'Cancel',
            ['?'] = 'ShowHelp',
          },
        },
      },
      -- Configure where the logs go and what level to use
      -- Types are "echo", "notify", and "file"
      log = {
        {
          type = 'echo',
          level = vim.log.levels.WARN,
        },
        {
          type = 'file',
          filename = 'overseer.log',
          level = vim.log.levels.WARN,
        },
      },
    }
  end,
}
