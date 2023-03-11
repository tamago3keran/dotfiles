let g:copilot_filetypes = {
      \ '*': v:false,
      \ 'lua': v:true,
      \ 'vim': v:true,
      \ }

nnoremap [copilot] <Nop>
nmap <C-c> [copilot]
nnoremap [copilot]e :Copilot enable<CR>
nnoremap [copilot]d :Copilot disable<CR>
nnoremap <silent> [copilot]p :Copilot panel<CR>
nnoremap <silent> [copilot]s :Copilot status<CR>
