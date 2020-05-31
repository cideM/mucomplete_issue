call plug#begin("~/.cache/nvim/plugged")
Plug 'lifepillar/vim-mucomplete'
Plug 'neovim/nvim-lsp'
call plug#end()
set completeopt+=menuone
let g:mucomplete#chains = { 'go' : ['omni', 'c-n', 'keyn'] }
PlugInstall

autocmd Filetype go setlocal omnifunc=v:lua.vim.lsp.omnifunc

set statusline=METHOD%{get(g:,'mucomplete_current_method','')}

lua << EOF
require'nvim_lsp'.gopls.setup{}
EOF
