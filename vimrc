syntax on
"新しい行のインデントを現在行と同じにする
set autoindent
"バックアップファイルを作るディレクトリ
set backupdir=$HOME/vimbackup
"ファイル選択ダイアログの初期ディレクトリを開いているファイルと同じディレクトリに設定
set browsedir=buffer
"ヤンクしたテキストをデスクトップのクリップボードにコピー
set clipboard=unnamed
"Vi互換をオフ
set nocompatible
"スワップファイル用のディレクトリ
set directory=$HOME/vimbackup
"タブの代わりに空白文字を挿入する
set expandtab
"編集中のファイルを保存せずに他のファイルへ切り替え可能にする
set hidden
"インクリメンタルサーチを行う
set incsearch
"検索結果をハイライトする
set hlsearch
"タブ文字、行末など不可視文字を表示する
"set list
"listで表示される文字のフォーマットを指定する
"set listchars=eol:$,tab:>\ ,extends:<
"行番号を表示する
set number
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループしない
"set nowrapscan

"ファイル内の<Tab>文字を画面上の見た目で何文字分に展開するか
set tabstop=8
"シフトオペレータ(>>や<<)などで挿入/削除されるインデントの幅
set shiftwidth=2
"入力された<Tab>文字をスペースに展開しない
"set noexpandtab

"ペースト時にインデントしない
"有効にするとautoindentやend補完が効かなくなる
"set paste
set pastetoggle=<C-e>

"edgemotion
map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)

"行末の空白をハイライトする
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\t\+\|\s\+$/
augroup END

" nerdtree
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 2
"let g:NERDTreeDirArrows=0
let NERDTreeWinSize = 25
nnoremap <silent><C-e> :NERDTreeToggle<CR>
if !argc()
  autocmd vimenter * NERDTree|normal gg3j
endif
autocmd QuickFixCmdPost *grep* cwindow

let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
    vmap <Leader>y "+y
    vmap <Leader>d "+d
    nmap <Leader>p "+p
    nmap <Leader>P "+P
    vmap <Leader>p "+p
    vmap <Leader>P "+P

let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" ----------------------------------------------------
"   neobundle
" ----------------------------------------------------
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

  " add plugins
NeoBundle 'haya14busa/vim-edgemotion'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'

NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'cohama/agit.vim'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'hrsh7th/vim-versions'
NeoBundle 'fuenor/JpFormat.vim'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'JuliaLang/julia-vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'othree/html5.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/rest.vim'
NeoBundle 'fatih/vim-go'
NeoBundle 'vim-scripts/po.vim'
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'PProvost/vim-ps1'
NeoBundle 'hotwatermorning/auto-git-diff'
NeoBundle 'ConradIrwin/vim-bracketed-paste'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'myokoym/insert-git-log.vim'
NeoBundle 'tyru/open-browser.vim'

let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers=['rubocop', 'mri']

filetype plugin on

call neobundle#end()

  filetype plugin indent on

  NeoBundleCheck
