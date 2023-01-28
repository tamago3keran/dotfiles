function copy()
  require('osc52').copy_register('+')
end

vim.api.nvim_create_autocmd('TextYankPost', {callback = copy})

require('osc52').setup {}
