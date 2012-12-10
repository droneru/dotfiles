colorscheme desert
syntax on
" Подсветка строки, в которой находится в данный момент курсор
set cursorline
" Отключаем панель инструментов
set guioptions-=T
" Всегда отображать статусную строку для каждого окна
set laststatus=2
" установить keymap, чтобы по Ctrl+^ переключался на русский и обратно
set keymap=russian-jcukenwin 
" по умолчанию - латинская раскладка
set iminsert=0
" по умолчанию - латинская раскладка при поиске
set imsearch=0
" игнорировать регистр при поиске
set ic
" подсвечивать поиск
set hls
" использовать инкрементальный поиск
set is
" ширина текста 
"set textwidth=80
" минимальная высота окна пусть будет 0 (по умолчанию - 1)
set winminheight=0
" всегда делать активное окно максимального размера
set noequalalways
set winheight=9999
" настраиваю для работы с русскими словами (чтобы w, b, * понимали
" русские слова)
set iskeyword=@,48-57,_,192-255
" задать размер табуляции в четыре пробела
set ts=4
set autoindent
" отображение выполняемой команды
set showcmd 
" перенос по словам, а не по буквам
set linebreak
set dy=lastline
" вставлять средней кнопкой мыши
set mouse=r
"setlocal spell spelllang=ru_yo,en_us
"set number  нумерация строк
set nocompatible      " обойдёмся без стандартного vi
set nobackup
set noswapfile
" hotkeys============================
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

