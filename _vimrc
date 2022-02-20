" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Dec 17
"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	      for Haiku:  ~/config/settings/vim/vimrc
"	    for OpenVMS:  sys$login:.vimrc

set nocompatible
set langmenu=none     " 解决英文环境下图标提示信息显示乱码
" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
set shell=C:\WINDOWS\System32\WindowsPowerShell\v1.0\powershell.exe\ -ExecutionPolicy\ Bypass

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                常见问题                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 解决 git_validate 问题(或者注释上面的set shell)
if has('win32')
  " https://github.com/junegunn/vim-plug/issues/852#issuecomment-696431055
  set shell=cmd.exe
endif
"set iminsert=2    "解决切换输入法问题(Ctrl + space 就可以切换了)
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936    " 解决文件乱码问题
set termencoding=utf-8
set encoding=utf-8
"language messages en_US.utf-8    "解决consle提示信息输出乱码

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                基本配置                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set vb t_vb=    "关闭警告声
au GuiEnter * set t_vb=
set shortmess=atI    "启动时不显示援助索马里儿童提示
set clipboard+=unnamed    "与windows共享剪贴板
set nobackup    "取消自动备份及产生swp文件
set nowb
set noswapfile
set noundofile
filetype on    "打开文件类型检测功能
set autoread    "当文件被外部改变时自动读取
set splitbelow    "ternimal在下面打开
set termwinsize=10x0    "ternimal启动窗口大小
" open terminal below all splits(test?)
"cabbrev bterm bo term
" disable vim to examine zipped files
let g:loaded_zipPlugin= 1
let g:loaded_zip      = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   外观                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"source $VIMRUNTIME/delmenu.vim    " 界面修改为英文
"source $VIMRUNTIME/menu.vim
let $LANG = 'en'
set number    "显示行号
set guifont=DroidSansMono_Nerd_Font:h11
"set guifont=DroidSansMono_NF:h11
"colorscheme delek    "主题
colorscheme flattened_dark
set guioptions-=m    "hidden menu bar
set guioptions-=T    "hidden toolbar
set guioptions-=r    "hidden the right scrollbar
set guioptions-=L    "hidden the left scrollbar
"set guioptions-=b
"set guioptions+=b    "水平滚动条
set listchars=tab:>-,trail:.    " tab 字符的显示样式，且行末不显示字符
set list    " 显示Tab字符
set laststatus=2
" StatusLine
set statusline=%<%.50F\             "显示文件名和文件路径 (%<应该可以去掉)
set statusline+=%=%y%m%r%h%w\        "显示文件类型及文件状态
set statusline+=%{&ff}\[%{&fenc}]\   "显示文件编码类型
set statusline+=row:%l/%L,col:%c\    "显示光标所在行和列
set statusline+=%3p%%\            "显示光标前文本所占总文本的比例
set showtabline=1  " always show tabs in gvim, but not vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   编辑                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set mouse=a    "支持使用鼠标
set expandtab    "Tab 转为空格
set tabstop=4
set softtabstop=4       "回退的长度
set shiftwidth=4        "每一级缩进的长度
filetype indent on     "不同文件类型采用不同缩进
set autoindent     "按下回车键后，保持与上一行的缩进一致
"set smartindent     "智能缩进
"set cindent        "采用C语言缩进方式
"set noautoindent     "取消自动缩进(test)
"set cursorline     "光标所在的当前行高亮
"命令模式下，底部操作指令按下 Tab 键自动补全
"第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令
set wildmenu
set wildmode=longest:list,full
set nowrap    "取消换行
"syntax on    "语法高亮

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   netrw                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:netrw_browse_split = 4     " Changing how files are opened
let g:netrw_liststyle = 3     "设置目录列表的样式：树形
let g:netrw_winsize = 24     "设置文件浏览器窗口宽度为 n%
let g:netrw_banner = 0    "Removing the banner
let g:netrw_altv = 1 " 控制 v 分裂的窗口位于右边
"let g:netrw_preview = 1 " 'p'预览默认是水平分割, 此项设置使之垂直分割
let g:netrw_alto = 0 " 控制预览窗口位于左侧或右侧, 与 netrw_preview 共同作用

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              自定义函数                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"编译运行
map <F5> :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'python'
        "exec ":set splitbelow<CR>:split<CR>"
        "exec "silent !python3 %"
        exec "!python3 %"
    elseif &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'text'
        exec "silent !plantuml % -tpng"
    elseif &filetype == 'dot'
        exec "silent !dot % -T png -o %<.png"
    endif
endfunc


" 自动补全和删除括号
:inoremap ( ()<ESC>i
:inoremap { {}<ESC>i
:inoremap [ []<ESC>i
:inoremap < <><ESC>i
":inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
func! DeleteBoth()
	if (getline('.')[col('.') - 2] == '(' && getline('.')[col('.') - 1] == ')')||(getline('.')[col('.') - 2] == '[' && getline('.')[col('.') - 1] == ']') || (getline('.')[col('.') - 2] == '"' && getline('.')[col('.') - 1] == '"') ||(getline('.')[col('.') - 2] == "'" && getline('.')[col('.') - 1] == "'") || (getline('.')[col('.') - 2] == '{' && getline('.')[col('.') - 1] == '}')||(getline('.')[col('.') - 2] == '<' && getline('.')[col('.') - 1] == '>')
		return "\<ESC>2s"
	else
		return "\<BS>"
	endif
endfunc
" 用退格键删除一个左括号时同时删除对应的右括号
inoremap <BS> <c-r>=DeleteBoth()<CR>
" 输入一个字符时，如果下一个字符也是括号，则删除它，避免出现重复字符
function! RemoveNextDoubleChar(char)
    let l:line = getline(".")
    let l:next_char = l:line[col(".")] " 取得当前光标后一个字符
 
    if a:char == l:next_char
        execute "normal! l"
    else
        execute "normal! a" . a:char . ""
    end
endfunction
inoremap ) <ESC>:call RemoveNextDoubleChar(')')<CR>a
inoremap ] <ESC>:call RemoveNextDoubleChar(']')<CR>a
inoremap } <ESC>:call RemoveNextDoubleChar('}')<CR>a
inoremap > <ESC>:call RemoveNextDoubleChar('>')<CR>a

" GuiTabel
" set up tab labels with tab number, buffer name, number of windows
function! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor
  " Append the tab number
  let label .= v:lnum.': '
  " Append the buffer name
  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
  if name == ''
    " give a name to no-name documents
    if &buftype=='quickfix'
      let name = '[Quickfix List]'
    else
      let name = '[No Name]'
    endif
  else
    " get only the file name
    let name = fnamemodify(name,":t")
  endif
  let label .= name
  " Append the number of windows in the tab page
  let wincount = tabpagewinnr(v:lnum, '$')
  return label . '  [' . wincount . ']'
endfunction
set guitablabel=%{GuiTabLabel()}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   插件                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('$VIM/vimfiles/plugged')
Plug 'scrooloose/nerdtree', { 'on': [] }
Plug 'ryanoasis/vim-devicons', { 'on': [] }
Plug 'mattn/emmet-vim', { 'on': [] }
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'jiangmiao/auto-pairs', { 'on': [] }
"Plug 'neoclide/coc.nvim', {'branch': 'release', 'on': [] }
Plug 'honza/vim-snippets', { 'on': [] }
Plug 'SirVer/ultisnips', { 'on': [] }
Plug 'Valloric/YouCompleteMe', { 'on': [] }

" 500 毫秒后调用 LoadPlug，且只调用一次, 见 `:h timer_start()`
call timer_start(200, 'LoadPlug')

function! LoadPlug(timer) abort
  " 手动加载插件
  call plug#load('vim-devicons')
  call plug#load('emmet-vim')
  "call plug#load('coc.nvim')
  call plug#load('YouCompleteMe')
  call plug#load('nerdtree')
  autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif  " Open NERDTree on each new tab.
  call plug#load('vim-snippets')
  "call plug#load('auto-pairs')
  call plug#load('ultisnips')
endfunction

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                插件配置                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"nerdtree
"开启快捷键
map <F3> :NERDTreeClose<CR>
map <F3> :NERDTreeToggle<CR>
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1     "显示隐藏文件
let g:NERDTreeDirArrowExpandable = '▸'     "树的显示图标
let g:NERDTreeDirArrowCollapsible = '▾'
"let g:NERDTreeShowLineNumbers=1  " 显示行号
let g:NERDTreeWinSize=24    " window size
"emmet-vim
let g:user_emmet_leader_key='<C-E>'     " 设置快捷键

" auto-pairs
"let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''",'<':'>'}

" Coc
" Use <C-l> for trigger snippet expand.
"imap <C-l> <Plug>(coc-snippets-expand)

" YCM
let g:ycm_key_list_stop_completion = ['<enter>']        " stop list completion
" 回车即选中当前项
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
" 跳转到定义处
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 从第1个键入字符就开始罗列匹配项
"let g:ycm_min_num_of_chars_for_completion=1
"youcompleteme  默认tab  s-tab 和 ultisnips 冲突
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
let g:ycm_key_invoke_completion = '<M-;>'
" 警告和错误
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=0
" 禁用/开启clangd
let g:ycm_use_clangd =0
" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \ 'cs' : 1,
      \}
let g:ycm_cache_omnifunc=0        " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
"let g:ycm_open_loclist_on_ycm_diags = 0     " 底面打开提示文件
let g:ycm_add_preview_to_completeopt="popup"
" ultisnips
"let g:UltiSnipsExpandTrigger="<enter>"

