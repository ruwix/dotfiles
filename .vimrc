set noexpandtab " Make sure that every file uses real tabs, not spaces
set shiftround  " Round indent to multiple of 'shiftwidth'
set smartindent " Do smart indenting when starting a new line
set autoindent  " Copy indent from current line, over to the new line
set number
set relativenumber
set t_Co=256

" Set the tab width
let s:tabwidth=2
exec 'set tabstop='    .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth

" Sudo trick
command WriteWithSudo w !sudo tee % > /dev/null
cnoreabbrev ww WriteWithSudo

" TEMP
map <Left> :echo 'Bruh'<CR>
map <Right> :echo 'Bruh'<CR>
map <Up> :echo 'Bruh'<CR>
map <Down> :echo 'Bruh'<CR>

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'Chiel92/vim-autoformat'
	Plugin 'xuhdev/vim-latex-live-preview'
	Plugin 'lervag/vimtex'
	Plugin 'vim-pandoc/vim-pandoc'
	Plugin 'vim-pandoc/vim-pandoc-syntax'
	Plugin 'PotatoesMaster/i3-vim-syntax'
call vundle#end()


let g:formatdef_my_shfmt = "shfmt -i 2 -ci"
let g:formatters_shell = ['my_shfmt']

syntax on
colorscheme material


function! MLA(name, period, class, lastname)
	let date = substitute(system('date +"$A %-d %B %Y"'), '^\_s*\(.\{-}\)\_s*$', '\1', '')
	silent! execute "r ~/.vim/templates/mla.tex"
	:%s/\[:NAME:\]/\=a:name/g
	:%s/\[:PERIOD:\]/\=a:period/g
	:%s/\[:CLASS:\]/\=a:class/g
	:%s/\[:DATE:\]/\=date/g
	:%s/\[:LASTNAME:\]/\=a:lastname/g
endfunction
command! MLA :call MLA("Grant Pauker", "2", "Essex Seminar English","Pauker")

command! FileToClipboard normal! gg"+yG
cnoreabbrev copy FileToClipboard

cnoreabbrev Q q!
set nrformats+=alpha