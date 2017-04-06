function! Clean()
	let bufnu=bufnr("%")
	let bufname=bufname(bufnu)
	let cwdname=getcwd()."/"
	let objname=substitute(bufname,cwdname,"","g")
	let objname=substitute(objname,"\\.c","","g")
	exe "!rm -f ".objname." "."*.o"
endfunction

function! Complie()
	let bufnu=bufnr("%")
	let bufname=bufname(bufnu)
	let cwdname=getcwd()."/"
	let objname=substitute(bufname,cwdname,"","g")
	let objname=substitute(objname,"\\.c","","g")
	let makestr="make ".objname
	exe makestr
endfunction


function! Execute()
	let bufnu=bufnr("%")
	let bufname=bufname(bufnu)
	let cwdname=getcwd()."/"
	let objname=substitute(bufname,cwdname,"","g")
	let objname=substitute(objname,"\\.c","","g")
	if  objname!=findfile(objname,".")
		let makestr="make ".objname
		exe makestr
	endif
	exe "!./".objname
endfunction


function! MakeClean()
	if "Makefile"==findfile("Makefile",".;")
		"echo findfile("Makefile",".;")
		exe "make clean"
	else
		let bufnu=bufnr("%")
		let bufname=bufname(bufnu)
		let cwdname=getcwd()."/"
		let objname=substitute(bufname,cwdname,"","g")
		let objname=substitute(objname,"\\.c","","g")
		exe "!rm -f ".objname." "."*.o"
	endif
endfunction

function! Makelib()
	exe "make clean -C /home/caiwang213/unp3/lib"
	exe "make -C /home/caiwang213/unp3/lib"
endfunction


function! CreateTag() 
	exe "!ctags -R -f /home/caiwang213/.vim/tags/libtags /home/caiwang213/unp3/lib"
endfunction

function! Maketags()
	exe "!ctags -R -f /home/caiwang213/.vim/tags/libtags /home/caiwang213/unp3/lib/*.c"
	echo "ctags successfull!"
endfunction


function! ManK()
	let buf=expand("<cword>")
	exe "ConqueTermSplit man ".buf
endfunction

function! Man2K()
	let buf=expand("<cword>")
	exe "ConqueTermSplit man 2 ".buf
endfunction

function! Man3K()
	let buf=expand("<cword>")
	exe "ConqueTermSplit man 3 ".buf
endfunction

function! Man4K()
	let buf=expand("<cword>")
	exe "ConqueTermSplit man 4 ".buf
endfunction

function! Man5K()
	let buf=expand("<cword>")
	exe "ConqueTermSplit man 5 ".buf
endfunction

function! Man6K()
	let buf=expand("<cword>")
	exe "ConqueTermSplit man 6 ".buf
endfunction

function! Man7K()
	let buf=expand("<cword>")
	exe "ConqueTermSplit man 7 ".buf
endfunction

function! Cscope_s()
	let buf=expand("<cword>")
	exe "cscope find s ".buf
endfunction

function! Cscope_c()
	let buf=expand("<cword>")
	exe "cscope find c ".buf
endfunction

function! Cscope_e()
	let buf=expand("<cword>")
	exe "cscope find e ".buf
endfunction

function! Cscope_f()
	let buf=expand("<cfile>")
	exe "cscope find f ".buf
endfunction

function! Cscope_g()
	let buf=expand("<cfile>")
	exe "cscope find g ".buf
endfunction
