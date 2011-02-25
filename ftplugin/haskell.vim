"-----------------"
" Display options "
"-----------------"

"-----------------"
" Tab conversion  "
"-----------------"

" source $HOME/.vim/ftplugin/haskell_indent.vim
" source $HOME/.vim/ftplugin/tslime.vim

set ts=2
set st=2
set sw=2
set expandtab
set ai


"------------------"
" Helper Functions "
"------------------"

function! JustTheModules ()
	let mypath = tempname()
	g/^import.*/y A
	bn mypath
	set buftype=nofile
	set bufhidden=hide
	setlocal noswapfile
	" Somehow paste to the new buffer
	" Save the new buffer
	system("ghci -fglasgow-exts -i. ", mypath)
	bd! mypath
	delete mypath
endfunction

"-----------"
" Shortcuts "
"-----------"

" (b)uild
map <Leader>b :w<CR>:!ghc -fglasgow-exts --make -O2 -L/usr/lib -W '%' -o '%<'<CR>
map <Leader>B :w<CR>:!ghc -fglasgow-exts --make -O2 -L/usr/lib -W '%' -o '%<'

" (i)nterpret
map <Leader>i :w<CR>:!ghci -fglasgow-exts -L/usr/lib -i. %<CR>
map <Leader>I :w<CR>:!ghci -fglasgow-exts -L/usr/lib -i. %

" interperet with just the (m)odule imports
map <Leader>m :w<CR>JustTheModules()<CR>
map <Leader>M :w<CR>JustTheModules()

" (q)uick shell
map <Leader>s :!ghci<CR>
map <Leader>S :!ghci

" (t)est with quickcheck
map <Leader>t :w<CR>:!quickcheck +names %<CR>
map <Leader>T :w<CR>:!quickcheck +names %

" (r)un built version
map <Leader>r :w<CR>:!ghc -fglasgow-exts --make -O2 -L/usr/lib -W '%' -o '%<' && ./%<<CR>
map <Leader>R :w<CR>:!ghc -fglasgow-exts --make -O2 -L/usr/lib -W '%' -o '%<' && ./%<

" (c)un concurrent built version
map <Leader>c :w<CR>:!ghc -fglasgow-exts --make -W -O2 -L/usr/lib -threaded '%' -o '%<' && ./%< +RTS -N2<CR>
map <Leader>C :w<CR>:!ghc -fglasgow-exts --make -W -O2 -L/usr/lib -threaded '%' -o '%<' && ./%< +RTS -N2

" Interpret (a)nd run
map <Leader>a :w<CR>:!runhaskell %<CR>
map <Leader>A :w<CR>:!runhaskell %

" (p)rofile
map <Leader>p :w<CR>:!ghc -fglasgow-exts --make -W -L/usr/lib -prof -auto-all '%' -o '%<' && ./'%<' +RTS -p -RTS && cat '%<.prof'<CR>
map <Leader>P :w<CR>:!ghc -fglasgow-exts --make -W -L/usr/lib -prof -auto-all '%' -o '%<' && ./'%<' +RTS -p -RTS && cat '%<.prof'

" (l)int
map <Leader>l :w<CR>:! hlint --color '%'<CR>
map <Leader>L :w<CR>:! hlint --color '%'

" (s)earch hoogle
map <Leader>s :! hoogle 
map <Leader>S :! hoogle --info "

" Cabal (f)unctions

" (c)onfigure
map <Leader>fc :w<CR>:! cabal configure<CR>
map <Leader>fC :w<CR>:! cabal configure

" (b)uild
map <Leader>fb :w<CR>:! cabal build<CR>
map <Leader>fB :w<CR>:! cabal build

" (i)nstall
map <Leader>fi :w<CR>:! cabal install<CR>
map <Leader>fI :w<CR>:! cabal install

" (r)un
map <Leader>fr :w<CR>:! ./dist/build/*/*(*)<CR>
map <Leader>fR :w<CR>:! ./dist/build/*/*(*)<CR>

" build (a)nd install
map <Leader>fa :w<CR>:! cabal build && cabal install<CR>
map <Leader>fA :w<CR>:! cabal build && cabal install
