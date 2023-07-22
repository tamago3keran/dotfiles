let g:copilot_no_maps = v:true

let g:copilot_filetypes = {
      \ '*': v:false,
      \ 'javascript': v:true,
      \ 'typescript': v:true,
      \ }

nnoremap [copilot] <Nop>
nmap <C-c> [copilot]
nnoremap [copilot]e :Copilot enable<CR>
nnoremap [copilot]d :Copilot disable<CR>
nnoremap <silent> [copilot]p :Copilot panel<CR>
nnoremap <silent> [copilot]s :Copilot status<CR>
