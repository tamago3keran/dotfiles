call ddu#custom#patch_global(#{
    \   ui: 'ff',
    \   uiParams: #{
    \     ff: #{
    \       split: 'floating',
    \       prompt: '> ',
    \       winCol: &columns / 8,
    \       winHeight: 40,
    \       winRow: &lines / 4 - 8,
    \       winWidth: &columns * 3 / 4,
    \     }
    \   },
    \   sourceOptions: #{
    \     _: #{
    \       sorters: ['sorter_alpha'],
    \     },
    \   },
    \   filterParams: #{
    \     matcher_substring: #{
    \       highlightMatched: 'Title',
    \     },
    \     matcher_ignore_files: #{
    \       ignoreGlobs: ['.git'],
    \     },
    \   },
    \   kindOptions: #{
    \     file: #{
    \       defaultAction: 'open',
    \     },
    \   }
    \ })

call ddu#custom#patch_local('buffer', #{
    \   sourceOptions: #{
    \     buffer: #{
    \       matchers: ['matcher_substring'],
    \     },
    \   },
    \ })

call ddu#custom#patch_local('filer', #{
    \   ui: 'filer',
    \   sourceOptions: #{
    \     _: #{
    \       columns: ['devicon_filename'],
    \       matchers: ['matcher_ignore_files'],
    \     },
    \   },
    \   columnParams: #{
    \     devicon_filename: #{
    \       indentationWidth: 2,
    \     },
    \   },
    \ })

call ddu#custom#patch_local('grep', #{
    \   sourceOptions: #{
    \     rg: #{
    \       matchers: ['converter_display_word', 'matcher_substring'],
    \     },
    \   },
    \   sourceParams: #{
    \     rg: #{
    \       args: ['--hidden', '--column'],
    \     },
    \   },
    \ })

call ddu#custom#patch_local('file_rec', #{
    \   sourceOptions: #{
    \     file_rec: #{
    \       matchers: ['matcher_substring'],
    \     },
    \   },
    \   sourceParams: #{
    \     file_rec: #{
    \       ignoredDirectories: ['.git', 'vendor']
    \     },
    \   },
    \   uiParams: #{
    \     ff: #{
    \       startFilter: v:true,
    \     }
    \   }
    \ })

nnoremap [ddu] <Nop>
nmap <C-d> [ddu]
nnoremap <silent> [ddu]b <Cmd>call ddu#start({'name': 'buffer', 'sources': [{'name': 'buffer'}]})<CR>
nnoremap <silent> [ddu]f <Cmd>call ddu#start({'name': 'filer', 'sources': [{'name': 'file', 'params': {}}]})<CR>
nnoremap <silent> [ddu]g <Cmd>call ddu#start({'name': 'grep', 'sources': [{'name': 'rg', 'params': {'input': input('Pattern: ')}}]})<CR>
nnoremap <silent> [ddu]p <Cmd>call ddu#start({'name': 'file_rec', 'sources': [{'name': 'file_rec'}]})<CR>

autocmd TabEnter,CursorHold,FocusGained <buffer> call ddu#ui#filer#do_action('checkItems')

autocmd FileType ddu-filer call s:ddu_filer_my_settings()
function! s:ddu_filer_my_settings() abort
  nnoremap <buffer><silent><expr> <CR>
    \ ddu#ui#get_item()->get('isTree', v:false) ?
    \ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow'})<CR>" :
    \ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open'})<CR>"
  nnoremap <buffer><silent><expr> o
    \ ddu#ui#get_item()->get('isTree', v:false) ?
    \ "<Cmd>call ddu#ui#filer#do_action('expandItem', {'mode': 'toggle'})<CR>" :
    \ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open'})<CR>"
  nnoremap <buffer><silent> s <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open', 'params': {'command': 'vsplit'}})<CR>
  nnoremap <buffer><silent> t <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open', 'params': {'command': 'tabnew'}})<CR>
  nnoremap <buffer><silent> <Space> <Cmd>call ddu#ui#filer#do_action('toggleSelectItem')<CR>
  nnoremap <buffer><silent> <Esc> <Cmd>call ddu#ui#filer#do_action('quit')<CR>
  nnoremap <buffer><silent> u <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow', 'params': {'path': '..'}})<CR>
  nnoremap <buffer><silent> c <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'copy'})<CR>
  nnoremap <buffer><silent> p <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'paste'})<CR>
  nnoremap <buffer><silent> d <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'delete'})<CR>
  nnoremap <buffer><silent> r <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'rename'})<CR>
  nnoremap <buffer><silent> mv <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'move'})<CR>
  nnoremap <buffer><silent> n <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'newFile'})<CR>
  nnoremap <buffer><silent> mk <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'newDirectory'})<CR>
  nnoremap <buffer><silent> yy <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'yank'})<CR>
endfunction

autocmd FileType ddu-ff call s:ddu_my_settings()
function! s:ddu_my_settings() abort
  nnoremap <buffer><silent> <CR> <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
  nnoremap <buffer><silent> o <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
  nnoremap <buffer><silent> s <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'open', 'params': {'command': 'vsplit'}})<CR>
  nnoremap <buffer><silent> t <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'open', 'params': {'command': 'tabnew'}})<CR>
  nnoremap <buffer><silent> i <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
  nnoremap <buffer><silent> <Space> <Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>
  nnoremap <buffer><silent> <Esc> <Cmd>call ddu#ui#ff#do_action('quit')<CR>
endfunction

autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
  inoremap <buffer><silent> <CR> <Esc><Cmd>close<CR>
  inoremap <buffer><silent> <Esc> <Esc><Cmd>close<CR>
endfunction

augroup transparent-windows
  autocmd!
  autocmd FileType ddu-ff set winblend=15
  autocmd FileType ddu-ff-filter set winblend=15
augroup END
