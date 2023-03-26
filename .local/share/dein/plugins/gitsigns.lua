require('gitsigns').setup {
  signcolumn = false,
  numhl = true,
  linehl = true,
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', '<C-g>n', function()
      if vim.wo.diff then return '<C-g>n' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '<C-g>p', function()
      if vim.wo.diff then return '<C-g>p' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map('n', '<C-g>u', gs.reset_hunk)
    map('n', '<C-g>b', function() gs.blame_line{full=true} end)
    map('n', '<C-g>d', gs.preview_hunk)
  end
}
