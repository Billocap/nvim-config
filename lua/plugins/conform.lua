return {
  -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format {
          async = true,
          lsp_format = 'fallback',
        }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = {
        'stylua',
      },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use 'stop_after_first' to run the first available formatter from the list
      json = {
        'prettier',
      },
      javascript = {
        'prettier',
      },
      javascriptreact = {
        'prettier',
      },
      typescript = {
        'prettier',
      },
      typescriptreact = {
        'prettier',
      },
      css = {
        'prettier',
      },
      gdscript = {
        'gdformat',
      },
      clang = {
        'clang-format',
        'ast-grep',
        stop_after_first = true,
      },
      cpp = {
        'clang-format',
        'ast-grep',
        stop_after_first = true,
      },
    },
  },
}
