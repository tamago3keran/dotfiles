set completeopt-=preview

call ddc#custom#patch_global('ui', 'pum')
call ddc#custom#patch_global('sources', ['around', 'copilot', 'nvim-lsp'])
call ddc#custom#patch_global('sourceOptions', #{
      \   _: #{
      \     matchers: ['matcher_head'],
      \     sorters: ['sorter_rank']
      \   },
      \   around: #{
      \     mark: '[A]'
      \   },
      \   copilot: #{
      \     mark: '[C]'
      \   },
      \   nvim-lsp: #{
      \     mark: '[L]',
      \     forceCompletionPattern: '\.\w*|:\w*|->\w*',
      \   }
      \ })
call ddc#enable()
