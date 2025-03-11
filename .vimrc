syntax on
filetype plugin on
filetype indent on
set nocompatible
filetype on
set hlsearch
set ignorecase
set number
set timeoutlen=100
set laststatus=2

let mapleader = ","
call plug#begin()
Plug 'sainnhe/everforest'
Plug 'romainl/vim-cool'
Plug 'vim-airline/vim-airline'
Plug 'liuchengxu/vim-which-key'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/vim-lsp'
Plug 'dense-analysis/ale'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" {{{
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting

  nnoremap <silent> <leader><space> :Files<CR>
" }}}
Plug 'ryanoasis/vim-devicons'
call plug#end()

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
autocmd InsertLeave * write 
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END
let g:which_key_map = {}
let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : [':resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : [':resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-right']    ,
      \ 'b' : [':e#'     , 'previous window']    ,
      \ }
let g:which_key_map['t'] = {
      \ 'name' : '+tabs' ,
      \ 'n' : [':tabnew'       , 'new-tab']           ,
      \ 'c' : [':tabclose'     , 'close-tab']         ,
      \ 'o' : [':tabonly'      , 'close-other-tabs']  ,
      \ 'h' : [':tabprevious'  , 'previous-tab']      ,
      \ 'l' : [':tabnext'      , 'next-tab']          ,
      \ 'f' : [':tabfirst'     , 'first-tab']         ,
      \ 'F' : [':tablast'      , 'last-tab']          ,
      \ 'm' : [':tabmove'      , 'move-tab']          ,
      \ '1' : [':tabnext 1'    , 'go-to-tab-1']       ,
      \ '2' : [':tabnext 2'    , 'go-to-tab-2']       ,
      \ '3' : [':tabnext 3'    , 'go-to-tab-3']       ,
      \ '4' : [':tabnext 4'    , 'go-to-tab-4']       ,
      \ '5' : [':tabnext 5'    , 'go-to-tab-5']       ,
      \ '6' : [':tabnext 6'    , 'go-to-tab-6']       ,
      \ '7' : [':tabnext 7'    , 'go-to-tab-7']       ,
      \ '8' : [':tabnext 8'    , 'go-to-tab-8']       ,
      \ '9' : [':tabnext 9'    , 'go-to-tab-9']       ,
      \ }
let g:which_key_map['l'] = {
      \ 'name' : '+Lsp' ,
      \ 'h' : [':LspHover', 'hover'] ,
      \ 'd' : [':LspDefinition', 'definition'] ,
      \ 'r' : [':LspReferences', 'references'] ,
      \}
let g:which_key_use_floating_win = '1'
let g:which_key_floating_opts = { 'width': '100', 'col': '100'}
let g:which_key_max_size = '10'
let g:which_key_sep = '->'
call which_key#register(',', "g:which_key_map")
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
nnoremap <silent> , :WhichKey ','<CR>
  " Important!!
        if has('termguicolors')
          set termguicolors
        endif

        " For dark version.
        set background=dark

        " For light version.
        " Set contrast.
        " This configuration option should be placed before `colorscheme everforest`.
        " Available values: 'hard', 'medium'(default), 'soft'
        let g:everforest_background = 'hard'

        " For better performance
        let g:everforest_better_performance = 1

        colorscheme everforest
noremap <leader>g :Rg<cr>
let g:airline#extensions#tabline#formatter = 'jsformatter'
" Enable ALE
let g:ale_linters = {'go': ['golangci-lint']}
let g:ale_fixers = {'go': ['gofmt', 'goimports']}
let g:ale_go_golangci_lint_package = 1  " Use installed golangci-lint

" Automatically lint on save and insert mode leave
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
let g:airline_powerline_fonts = 1

function! GoPLSCheck()
  echom "Running: gopls check *.go"

  " Run gopls check and capture output
  let l:output = systemlist('gopls check *.go')

  " Debugging: Show raw output
  echom "Raw output received:"
  for line in l:output
    echom line
  endfor

  " Clear the quickfix list
  call setqflist([], 'r')

  " Initialize an empty quickfix list
  let qf = []

  " Regex pattern to match the output format
  for line in l:output
    let l:match = matchlist(line, '\v^(.*):(\d+):(\d+)-\d+:\s*(.*)$')

    if !empty(l:match)
      let l:file = l:match[1]
      let l:lnum = l:match[2] + 0
      let l:col = l:match[3] + 0
      let l:msg = l:match[4]

      " Determine type: 'E' for errors, 'W' for warnings
      let l:type = 'W' " Default to warning
      if l:msg =~? 'error\|undefined\|cannot\|failed'
        let l:type = 'E'
      endif

      echom "Matched: File=" . l:file . " Line=" . l:lnum . " Col=" . l:col . " Msg=" . l:msg . " Type=" . l:type

      call add(qf, {
            \ 'filename': l:file,
            \ 'lnum': l:lnum,
            \ 'col': l:col,
            \ 'text': l:msg,
            \ 'type': l:type })
    else
      echom "Skipping unmatched line: " . line
    endif
  endfor

  " Set the quickfix list
  if !empty(qf)
    call setqflist(qf, 'r')
    echom "Quickfix list updated!"
    copen
  else
    echom "No issues found."
  endif
endfunction


" Define a Vim command
command! GoPLSCheck call GoPLSCheck()
