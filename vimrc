syntax on
"新しい行のインデントを現在行と同じにする
set autoindent
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
"行番号を表示する
set number
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"ファイル内の<Tab>文字を画面上の見た目で何文字分に展開するか
set tabstop=2
"シフトオペレータ(>>や<<)などで挿入/削除されるインデントの幅
set shiftwidth=2
"行末の空白をハイライトする
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\t\+\|\s\+$/
augroup END

augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
set spelllang=en,cjk
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
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

nmap <Leader><Leader> V

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

call plug#begin('~/.vim/plugins')
Plug 'yuratomo/w3m.vim'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell.vim'
Plug 'myokoym/insert-git-log.vim'
call plug#end()
