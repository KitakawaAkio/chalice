" vim:set ts=8 sts=2 sw=2 tw=0:
"
" - 2ch viewer 'Chalice' /
"
" Last Change: 25-Nov-2001.
" Written By:  Muraoka Taro <koron@tka.att.ne.jp>

scriptencoding cp932

" Chalice�̋N���m�F
if !ChaliceIsRunning()
  finish
endif

" ���ʐݒ�̓ǂݍ���
runtime! ftplugin/2ch.vim

"
" ���[�J���ϐ��̐ݒ�
"
setlocal tabstop=8
setlocal wrap
let b:title = ''
let b:title_raw = ''
let b:host = ''
let b:board = ''
let b:dat = ''

"
" �L�[�}�b�s���O
"
nnoremap <silent> <buffer> <S-Tab>	:ChaliceGoThreadList<CR>
nnoremap <silent> <buffer> <C-Tab>	:ChaliceGoBoardList<CR>

nnoremap <silent> <buffer> <CR>		:ChaliceHandleJump<CR>
nnoremap <silent> <buffer> <S-CR>	:ChaliceHandleJumpExt<CR>
nnoremap <silent> <buffer> R		:ChaliceReloadThread<CR>
nnoremap <silent> <buffer> r		:ChaliceReloadThreadInc<CR>
nnoremap <silent> <buffer> ~		:ChaliceBookmarkAdd thread<CR>
nnoremap <silent> <buffer> <C-I>	:ChaliceJumplistNext<CR>
nnoremap <silent> <buffer> <C-O>	:ChaliceJumplistPrev<CR>

nnoremap <silent> <buffer> i		:ChaliceWrite<CR>
nnoremap <silent> <buffer> I		:ChaliceWrite sage<CR>
nnoremap <silent> <buffer> a		:ChaliceWrite anony<CR>
nnoremap <silent> <buffer> A		:ChaliceWrite anony,sage<CR>
nnoremap <silent> <buffer> o		:ChaliceWrite<CR>
nnoremap <silent> <buffer> O		:ChaliceWrite sage<CR>

nnoremap <silent> <buffer> p		<C-b>
nnoremap <silent> <buffer> <		:call search('^\d\+', 'bW')<CR>zt
nnoremap <silent> <buffer> ,		:call search('^\d\+', 'bW')<CR>zt
nnoremap <silent> <buffer> >		:call search('^\d\+', 'W')<CR>zt
nnoremap <silent> <buffer> .		:call search('^\d\+', 'W')<CR>zt
nnoremap <silent> <buffer> K		<C-y>
nnoremap <silent> <buffer> J		<C-e>

nnoremap <buffer> <2-LeftMouse>		:ChaliceHandleJump<CR>
