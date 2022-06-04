set number cursorline expandtab
set ts=2 sts=2 sw=2

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

nnoremap <C-n> :NERDTree<CR>


call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Any valid git URL is allowed
" Multiple Plug commands can be written in a single line using | separators
" On-demand loading
Plug 'preservim/nerdtree'

" Using a non-default branch
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plugin options

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
Plug 'https://github.com/joshdick/onedark.vim.git'

" Initialize plugin system
call plug#end()

colorscheme onedark

lua << END
require('lualine').setup()
END

