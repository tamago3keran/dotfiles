set completeopt-=preview

call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('ui', 'native')
call ddc#custom#patch_global('sources', ['around', 'nvim-lsp'])
call ddc#custom#patch_global('sourceOptions', #{
      \   _: #{
      \     matchers: ['matcher_head'],
      \     sorters: ['sorter_rank']
      \   },
      \   around: #{
      \     mark: '[A]'
      \   },
      \   nvim-lsp: #{
      \     mark: '[L]',
      \     forceCompletionPattern: '\.\w*|:\w*|->\w*',
      \   }
      \ })
call ddc#enable()
