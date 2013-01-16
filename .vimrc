set nocompatible "обойдёмся без стандартного vi
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on

Bundle 'c9s/bufexplorer'
Bundle 'scrooloose/nerdtree'
Bundle 'wincent/Command-T'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
Bundle 'garbas/vim-snipmate'

colorscheme wombat
syntax on 
set cursorline " Подсветка строки, в которой находится в данный момент курсор
set guioptions-=T " Отключаем панель инструментов
set guioptions-=m " Отключаем меню
set laststatus=2 " Всегда отображать статусную строку для каждого окна
set keymap=russian-jcukenwin  " установить keymap, чтобы по Ctrl+^ переключался на русский и обратно
set iminsert=0 " по умолчанию - латинская раскладка
set imsearch=0 " по умолчанию - латинская раскладка при поиске
set ic " игнорировать регистр при поиске
set hls " подсвечивать поиск
set is " использовать инкрементальный поиск
set winminheight=0 " минимальная высота окна пусть будет 0 (по умолчанию - 1)
" всегда делать активное окно максимального размера
set noequalalways
set winheight=9999
set iskeyword=@,48-57,_,192-255 " настраиваю для работы с русскими словами (чтобы w, b, * понимали русские слова)
" задать размер табуляции в четыре пробела
set ts=4
set autoindent
set showcmd " отображение выполняемой команды
set linebreak " перенос по словам, а не по буквам
set dy=lastline
set mouse=r " вставлять средней кнопкой мыши
set nobackup
set noswapfile
" hotkeys============================
map <C-n> :NERDTreeToggle<CR>

nmap <F3> <Esc>:BufExplorer<cr>
vmap <F3> <esc>:BufExplorer<cr>
imap <F3> <esc>:BufExplorer<cr>
" следующий буфер
nmap <C-i> :bn<cr>
vmap <C-i> <esc>:bn<cr>i
imap <C-i> <esc>:bn<cr>i

imap <F11> <Esc>:set<Space>nu!<CR>a
nmap <F11> :set<Space>nu!<CR>
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i
map <S-tab> :tabprevious<cr>
nmap <S-tab> :tabprevious<cr>
imap <S-tab> <ESC>:tabprevious<cr>i
map <C-tab> :tabnext<cr>
nmap <C-tab> :tabnext<cr>
imap <C-tab> <ESC>:tabnext<cr>i
nmap <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr>
nmap <C-K> 5k
nmap <C-J> 5j
imap <F6> <Esc>:make<cr>a
nmap <F6> :make<cr>
imap <F7> <Esc>:make<Space>clean<cr>a
nmap <F7> :make<Space>clean<cr>
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv

" Переключение раскладок и индикация выбранной
" в данный момент раскладки.
" -->
    " Переключение раскладок будет производиться по <C-F>
    "
    " При английской раскладке статусная строка текущего окна будет синего
    " цвета, а при русской - зеленого.

    function MyKeyMapHighlight()
        if &iminsert == 0
            hi StatusLine ctermfg=DarkBlue guifg=DarkBlue
        else
            hi StatusLine ctermfg=DarkGreen guifg=DarkGreen
        endif
    endfunction

    " Вызываем функцию, чтобы она установила цвета при запуске Vim'a
    call MyKeyMapHighlight()

    " При изменении активного окна будет выполняться обновление
    " индикации текущей раскладки
    au WinEnter * :call MyKeyMapHighlight()

    cmap <silent> <F1> <C-^>
    imap <silent> <F1> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
    nmap <silent> <F1> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
    vmap <silent> <F1> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv
" <--

