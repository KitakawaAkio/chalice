" vim:set ts=8 sts=2 sw=2 tw=0:
"
" - 2ch viewer 'Chalice' /
"
" Last Change: 28-Nov-2001.
" Written By:  Muraoka Taro <koron@tka.att.ne.jp>

scriptencoding cp932

" Chalice�̋N���m�F
if !ChaliceIsRunning()
  finish
endif

" ���ʐݒ�̓ǂݍ���
runtime! ftplugin/2ch.vim

setlocal number
setlocal tabstop=32
let b:title = ''
let b:title_raw = ''
let b:host = ''
let b:board = ''

"
" �L�[�}�b�s���O
"
nnoremap <silent> <buffer> <S-Tab>	:ChaliceGoBoardList<CR>
nnoremap <silent> <buffer> <C-Tab>	:ChaliceGoThread<CR>

nnoremap <silent> <buffer> <CR>		:ChaliceOpenThread<CR>
nnoremap <silent> <buffer> <S-CR>	:ChaliceOpenThread external<CR>
nnoremap <silent> <buffer> <C-CR>	:ChaliceOpenThread firstline<CR>
nnoremap <silent> <buffer> R		:ChaliceReloadThreadList<CR>
nnoremap <silent> <buffer> d		:ChaliceDeleteThreadDat<CR>
nnoremap <silent> <buffer> ~		:ChaliceBookmarkAdd threadlist<CR>

"nnoremap <silent> <buffer> i		:ChaliceWrite new<CR>
"nnoremap <silent> <buffer> I		:ChaliceWrite new,sage<CR>
"nnoremap <silent> <buffer> a		:ChaliceWrite new,anony<CR>
"nnoremap <silent> <buffer> A		:ChaliceWrite new,anony,sage<CR>

nnoremap <buffer> <2-LeftMouse>		:ChaliceOpenThread<CR>

nnoremap <buffer> <C-f>			<C-f>0
nnoremap <buffer> <C-b>			<C-b>0

setlocal foldmethod=manual
