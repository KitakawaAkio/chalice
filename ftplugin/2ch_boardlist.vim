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

setlocal tabstop=7
let b:title = ''

"
" �L�[�}�b�s���O
"
nnoremap <silent> <buffer> <S-Tab>	:ChaliceGoThread<CR>
nnoremap <silent> <buffer> <C-Tab>	:ChaliceGoThreadList<CR>

nnoremap <silent> <buffer> <CR>		:ChaliceOpenBoard<CR>
nnoremap <silent> <buffer> <S-CR>	:ChaliceOpenBoard external<CR>
nnoremap <silent> <buffer> R		:ChaliceReloadBoardList<CR>

nnoremap <silent> <buffer> l		zo
nnoremap <silent> <buffer> h		zc
nnoremap <silent> <buffer> <BS>		0

nnoremap <buffer> <2-LeftMouse>		:ChaliceOpenBoard<CR>

"
" folding�ݒ�
"

" �X�N���v�gID���擾
map <SID>xx <SID>xx
let s:sid = substitute(maparg('<SID>xx'), 'xx$', '', '')
unmap <SID>xx

function! s:FoldText()
  let entry = v:foldend - v:foldstart
  return substitute(getline(v:foldstart), '^��', '��', ''). ' (' . entry . ') '
endfunction

execute 'setlocal foldtext=' . s:sid .'FoldText()'
