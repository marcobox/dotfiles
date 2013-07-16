"" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif
"
"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif
set nobackup		" Do no make backup copy of the files
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set modeline		" Allow the use of modeline
set number		" Shows number of the tile to the left of the window
set splitright		" New windows are opened to the right side instead of left
set history=500		" Sets command line history to a longer history than
			" default

" By default, pressing <TAB> in command mode will choose the first possible
" completion with no indication of how many others there might be.
" The following configuration lets you see what your other options are                                 			
set wildmenu
" To have the completion behave similarly to a shell, i.e. complete only up to
" the point of ambiguity (while still showing you what your options are), also
" add the following:
set wildmode=list:longest

" Set leader char to <SPACE> that is much easier to use
let mapleader="<SPACE>"

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
" commented this useless crap
if has('mouse')
 set mouse=a
endif
" Force the use of max 8 colors only even in terminals (or GUI) that allows
" more
if &t_Co >= 8 || has("gui_running")
	set t_Co=256
endif

" We select another color scheme that allow us to ready easier the scripts
colorscheme elflord
"
" Setting clipboard=unnamed will copy all selected text on system clipboard
" If you don't want this feature but still be able to copy on clipboard when
" you want, then use a '"*' before the copy command (es. *y *yy *d *dd *x *c
" etc. with a leading '"')
set clipboard=unnamed

" keybinds control space to C-N (autocompleting) during insert mode
if has("gui_running")
	inoremap <C-Space> <C-N>
else
	" Somehow in console <Nul> equals to <C-Space>
	inoremap <Nul> <C-N>
endif

" This setting make reconizing of different keypress much faster but it breaks
" most of the time the mapping of 2 consecutive keys so we disabled it
" set timeout ttimeout timeoutlen=20

" First we map vim Function key F21-F37 to keyboard Function keys F21-F37
" NOTE: to create the ALT key below '^[' use <C-v><C-[>
set <F21>=[35~
set <F22>=[36~
set <F23>=[37~
set <F24>=[38~
set <F25>=[39~
set <F26>=[40~
set <F27>=[41~
set <F28>=[42~
set <F29>=[43~
set <F30>=[44~
set <F31>=[45~
set <F32>=[46~
set <F33>=[47~
set <F34>=[48~
set <F35>=[49~
set <F36>=[50~
set <F37>=[51~
" Now we can assign these keys to our combination using set

" map binds to normal mode.
" map! binds to insert and command mode.

" The following Keybindings are composed by 2 commands: the first
" bind the FN key to the <A-N> combination (must be the same of 
" urxvt in .Xdefault), the second binds the <A-N> key to the action
" we want to do. Note that we could directly map the FN key to the
" action we want (provide we configured urxvt like before) but this
" way we can use the if construct to avoid remapping of the alt keys
" when we are in gvim because alt keys work there out of the box

" We bing Alt + h/j/k/l for movement during insert mode
if !has('gui-running')
	map <F21> <A-h>
	map <F22> <A-j>
	map <F23> <A-k>
	map <F24> <A-l>
	map! <F21> <A-h>
	map! <F22> <A-j>
	map! <F23> <A-k>
	map! <F24> <A-l>
endif
map <A-h> <Left>
map <A-j> <Down>
map <A-k> <Up>
map <A-l> <Right>
map! <A-h> <Left>
map! <A-j> <Down>
map! <A-k> <Up>
map! <A-l> <Right>
" Alt + x works like <Del> button in insert mode
" Ins and del for insert and nomal mode with Alt + a and Alt + e
if !has('gui-running')
	map <F25> <A-x>
	map <F26> <A-a>
	map <F27> <A-e>
	map! <F25> <A-x>
	map! <F26> <A-a>
	map! <F27> <A-e>
endif
map <A-x> <Del>
map <A-a> <Home>
map <A-e> <End>
map! <A-x> <Del>
map! <A-a> <Home>
map! <A-e> <End>
" PgDown and PgUp in insert mode with C-b and C-f (also they bring you
" back to normal mode. We don't need to remap these with function keys
" because control keys works good.
imap <C-f> <Esc><C-f>
imap <C-b> <Esc><C-b>

" Other useful Keybingds

if !has('gui-running')
	map <F28> <A-t>
endif
map <A-t> :tabnew<CR>


if !has('gui-running')
	map <C-L>1 <C-1>
	map <C-L>2 <C-2>
	map <C-L>3 <C-3>
	map <C-L>4 <C-4>
	map <C-L>5 <C-5>
	map <C-L>6 <C-6>
	map <C-L>7 <C-7>
	map <C-L>8 <C-8>
	map <C-L>9 <C-9>
	map <C-L>0 <C-0>
	map! <C-L>1 <C-1>
	map! <C-L>2 <C-2>
	map! <C-L>3 <C-3>
	map! <C-L>4 <C-4>
	map! <C-L>5 <C-5>
	map! <C-L>6 <C-6>
	map! <C-L>7 <C-7>
	map! <C-L>8 <C-8>
	map! <C-L>9 <C-9>
	map! <C-L>0 <C-0>
endif
map <C-1> :tabnext 1<CR>
map <C-2> :tabnext 2<CR>
map <C-3> :tabnext 3<CR>
map <C-4> :tabnext 4<CR>
map <C-5> :tabnext 5<CR>
map <C-6> :tabnext 6<CR>
map <C-7> :tabnext 7<CR>
map <C-8> :tabnext 8<CR>
map <C-9> :tabnext 9<CR>
map <C-0> :tabnext 10<CR>
map! <C-1> <Esc>:tabnext 1<CR>
map! <C-2> <Esc>:tabnext 2<CR>
map! <C-3> <Esc>:tabnext 3<CR>
map! <C-4> <Esc>:tabnext 4<CR>
map! <C-5> <Esc>:tabnext 5<CR>
map! <C-6> <Esc>:tabnext 6<CR>
map! <C-7> <Esc>:tabnext 7<CR>
map! <C-8> <Esc>:tabnext 8<CR>
map! <C-9> <Esc>:tabnext 9<CR>
map! <C-0> <Esc>:tabnext 10<CR>

" Enable 'Paste Mode' with F12. Paste Mode allow to paste text in vim
" while temporaly disabling auto-indent that can make the pasted code
" become a mess. Further we can integrate the paste mode effect by 
" autosend <F12> to toggle it from xbindkey or from copy mode
" of tmux (algr-p)
nnoremap <F12> :set paste! paste?<CR>
set pastetoggle=<F12>



" Enable setting window titles in Tmux used inside urxvt ( to find these
" values just run vim in urxvt without tmux and check the value of t_ts and
" t_fs

set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}
"autocmd BufEnter * let &titlestring = expand("%:t")
"Fixes for Tmux
if &term == "screen-it"
	" these 2 values fix some terminfo sequences that allow vim to change
	" the title bar
	set t_ts=]2
	set t_fs=
	" Allow Ctrl+PgUp/PgDn in tmux
	set t_kN=[6;*~
	set t_kP=[5;*~
	" Fixes S-Left/Right/Up/Down in Tmux
	set <S-Left>=[1;2D
	set <S-Right>=[1;2C
	set <S-Up>=[1;2A
	set <S-Down>=[1;2B
	" Fixes the C-Left/Right/Up/Down mapping. Note: in our terminal it this fixes
	" will still doesn't work because we keybinded them to different key
	" sequences that are used by Tmux.
	set <C-Left>=[1;5D
	set <C-Right>=[1;5C
	"set <C-Up>=[1;5A
	"set <C-Down>=[1;5B
endif

" Fixes for urxvt
if &term =~? "rxvt"
	" fixes the S-Left/Right/Up/Down mapping
	set <S-Left>=[d
	set <S-Right>=[c
	set <S-Up>=[a
	set <S-Down>=[b
	" Fixes the C-Left/Right/Up/Down mapping. Note: in our terminal it this fixes
	" will still not work because we keybinded them to different key
	" sequences that are used by Tmux.
	set <C-Left>=Od
	set <C-Right>=Oc
	"set <C-Up>=Oa
	"set <C-Down>=Ob
endif

" Add a custom command to make it easier to use SudoWrite
command Ws SudoWrite

" Switch the "'" command with "`" command since the result of the (unmapped `
" is more useful
nnoremap ' `
nnoremap ` '

" Toggle case sensitive search (disabled by default) ic abbreviates ignorecase
" With smartcase if you type a pattern with uppercase it'll become case
" sensitive. Remeber that you can enagle/disable case sensitive search per
" pattern by preceding it with \C (case sensitive enabled) or \c (case
" sensitive 
set ignorecase 
set smartcase
noremap <F6> :set ignorecase! ignorecase?<CR>

" Hides highlighted text after a succeful searh (default is turned off at
" start)
nohlsearch
noremap <F7> :nohlsearch<CR>

" Toggle Wrapping on and off and binds it to <F8>
func SaveAutoWrap ()
	if &textwidth == 0
		if exists("b:oldTextWitdh")
			let &textwidth = b:oldTextWitdh
			echo "Autowrap restored"
		else
			echo "Autowrap already disabled for this buffer"
		endif
	else
		let b:oldTextWitdh = &textwidth
		set textwidth=0
		echo "Autowrap disabled"
	endif
endf
nnoremap <F8> :call SaveAutoWrap()<CR>


" Set autowrap for comments only and set wrapping for comments equal to 78
" (this way it'll be compatible with tinier screens)
set formatoptions=q,c
set textwidth=78
" For Text only files we enable this also for normal test and not just
" comments
" Note: this does not work with asciidoc syntax type so we redefined it in
" .vim/after/syntax/asciidoc.vim
autocmd FileType text setlocal formatoptions=q,c,t,n

" With Y we can copy everything ifrom cursor untill the end of the line
" (default Y copies the whole line)
noremap Y y$

" We change the use of the ~ and make it a  command but ~~ will change the
" case of only one char and not the whole line (if typed fast enought). If you
" want to change the whole line instead you can use either visual mode or wait
" timeoutlen (default 1 sec) before type ~ again for defaul behaviour
" (note the use of nnoremap instead of noremap: since we want it to work only
" in normal mode and not also in insert mode we use it this way)
"set tildeop
"nnoremap ~~ ~ll

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow NESTING of AUTOCMDS to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Bind <F1> and Shift-<F1> to next/previous error in quick fix
map <F1> :lnext<CR>
map! <F1> <Esc>:lnext<CR>
map [23~ :lprevious<CR>
map! [23~ <Esc>:lnext<CR>

" When using "set list" to show tabs it will show every tab will be displayed as
" ">---" (with more or less "-") and trailing white space as "-".
set listchars=tab:>-,trail:-

" Increase the size of the command window
set cmdheight=3

" When showing commands with diff always use vertical splits
set diffopt+=vertical

" Cscope Settings (not needed because we'll use cscope plugin)

"if has("cscope")
"	set csprg=cscope
"	set csto=0
"	set cst
"	set nocsverb
"	set cscopequickfix=s-,c-,d-,i-,t-,e-
"	" add any database in current directory
"	if filereadable("cscope.out")
"		cs add cscope.out
"		" else add database pointed to by environment
"	elseif $CSCOPE_DB != ""
"		cs add $CSCOPE_DB
"	endif
"	set csverb
"endif

" Maps <F3> with the tag button
map <F2> <C-]>
" Maps <F3> to the Ctag search button (it opens it into a new window)
map <F3> <C-w><C-]>
" Maps <A-F3> to the Ctag search button (it opens it into a vertical window)
map [1;3R :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Maps C-x to C-t to make easy the access
map <C-x> <C-t>

" This will look in the current directory for 'tags', and work up the tree
" towards root until one is found. 
set tags+=/usr/include/tags,tags;/
" Map to <F4> the generation of tags file in the current directory and
" recursively
map <F4> :silent !ctags -R<CR>

" Enable the Man command and the \K keybind that splits window and opens the
" man page
runtime ftplugin/man.vim
" Remove MANPAGER env variable in vim because it doesn't work well with :Man
let $MANPAGER=''

" K will open a man page using :Man command in a new tab
func CreateManPage (manPage)
	tabnew
	exec ("Man ".a:manPage)
	" Since the :Man command split the window and then open the man page
	" we need to expand the window again using <C-W>o keys. The use of
	" exec is needed because is the only way to insert special characters
	" like the <C-W> key sequence
	exec "normal \<C-W>o"
	" Set a mapping that works only in the man page buffer and that binds
	" the q with the :quit command
	map <buffer> q :quit<CR>
endfu
map K :call CreateManPage(expand("<cword>"))<CR>

" The % key will switch between opening and closing brackets. By sourcing
" matchit.vim, it can also switch among e.g. if/elsif/else/end, between
" opening and closing XML tags, and more
runtime macros/matchit.vim

" We add a new command to compile a file with gcc with custom arguments
func GccCompile (cmdopts)
	write
	let b:oldmakeprg=&l:makeprg
	exec 'let &l:makeprg="gcc ' . a:cmdopts.'"'
	" echo &l:makeprg
	make
	let &l:makeprg=b:oldmakeprg
	unlet b:oldmakeprg
endfu
command -nargs=+ Gcc :call GccCompile("<args>")
" Command to show the name of the current file
command Cfile :echo expand('%:p')
" Temporany fix before I understand what is going on with vim (gvim) and the
" letter è
noremap! è è
noremap! ì ì
" This function is used to prepare the repl environment used by slime
" it need as parameter a script that return the ID of the pane where
" the repl will run. In particular the pane_id must be the unique identifier
" obtainable by using the option '-F "#D"' in the ltmux cmd
func SetupSlimeEnv(cmdname)
	if exists("g:slime_default_config")
		let replcmd = g:slime_default_config["replcmd"]
		let target_pane = g:slime_default_config["target_pane"]
		call system( "ltmux kill-pane -t " . shellescape(target_pane) )
		unlet g:slime_default_config
		" Exits if the replcmd is the same (this way we can toggle
		" the effect
		if replcmd == a:cmdname
			return
		endif
	end
	let paneName = system(a:cmdname)
	let paneName = substitute(paneName, "\n", "", "g")
	let g:slime_default_config = { "socket_name": "default", "target_pane" : paneName, "replcmd" : a:cmdname}
endfu

command -nargs=* SlimeEnvSetup :call SetupSlimeEnv(<q-args>)

noremap <F9> :SlimeEnvSetup replnode<CR>


" Enable vim Pathogen Plugin
execute pathogen#infect()

" Settings for Slime

let g:slime_target = "tmux"
" This line is needed because using input from TMUX wasn't working
let g:slime_paste_file = "/tmp/.slime_paste"

let g:syntastic_always_populate_loc_list=1

set tabstop=5
nmap <F5> :TagbarToggle<CR>

" Change the way The + appears (needed because our terminal doesn support full UTF8
let g:NERDTreeDirArrows=0
