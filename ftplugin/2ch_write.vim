" vim:set ts=8 sts=2 sw=2 tw=0:
"
" - 2ch viewer 'Chalice' /
"
" Last Change: 17-Apr-2002.
" Written By:  Muraoka Taro <koron@tka.att.ne.jp>

scriptencoding cp932

" Chalice�̋N���m�F
if !ChaliceIsRunning()
  finish
endif

" ���ʐݒ�̓ǂݍ���
runtime! ftplugin/2ch.vim

setlocal comments=b:>,b:#
setlocal expandtab
setlocal formatoptions-=r
setlocal tabstop=4 shiftwidth=4 softtabstop=4
setlocal nowrap

" �����݃R�}���h
nnoremap <buffer> <C-CR>		:ChaliceDoWrite<CR>
nnoremap <buffer> <C-C><CR>		:ChaliceDoWrite<CR>

nunmap <buffer> q
nunmap <buffer> Q

nunmap <buffer> <C-A>
nunmap <buffer> <BS>
nunmap <buffer> <C-H>
nunmap <buffer> <C-X>

nunmap <buffer> u
nunmap <buffer> m
nunmap <buffer> U
nunmap <buffer> M
nunmap <buffer> <Space>
nunmap <buffer> <S-Space>
nunmap <buffer> p
