" vim:set ts=8 sts=2 sw=2 tw=0:
"
" datutil.vim
"
" Last Change: 10-May-2002.
" Written By:  MURAOKA Taro <koron@tka.att.ne.jp>

scriptencoding cp932
if exists('plugin_datutil_disable')
  finish
endif
let s:debug = 1

"------------------------------------------------------------------------------
" INTERFACES:
"   :call Dat2Text()

"------------------------------------------------------------------------------
" IMPEMENTATION POINT:

function! s:GetMx_bbs2ch()
  " 2ch�X���b�h�A�t�H�[�}�b�g�p�^�[��

  " �������ݎ����̐؂蕪��
  "   �X����dat�̃t�H�[�}�b�g�́A���O�ɍs���ɍs(�L��)�ԍ���t���Ă���̂�:
  "	�ԍ�<>���O<>���[��<>����<>�{��<>�X����
  "   �ƂȂ�B�X�����͐擪�̂�
  let m1 = '\(.\{-}\)<>' " \{-}�͍ŒZ�}�b�`
  let mx = '^\(\d\+\)<>'.m1.m1.m1.'\s*\(.\{-\}\)\s*<>\s*\(.*\)$'
  return mx
endfunction

function! s:GetMx_bbsmodoki()
  let m1 = '\([^,]*\),'
  let mx = '^\(\d\+\)<>' . m1.m1.m1.m1 . '\s*\(.*\)$'
  return mx
endfunction

function! s:FormatArticle(linestr)
  let retval = substitute(a:linestr, s:mx_article, '\r--------\r\1  From:\2  Date:\4  Mail:\3\r  \5', '')
  let retval = substitute(retval, ' \?<br> \?', '\r  ', 'g')
  let retval = substitute(retval, '<\/\?a[^>]*>', '', 'g')
  let retval = substitute(retval, '\s*<\/\?b>', '', 'g')
  let retval = substitute(retval, '\c<\/\?font[^>]*>', '', 'g')
  if exists('b:dat2text_format') && b:dat2text_format ==# 'modoki'
    let retval = substitute(retval, '���M', ',', 'g')
  endif
  return retval
endfunction

function! s:Dat2Text_loop(linestr)
  if s:dat2text_verbose && s:dat2text_count % 100 == 0
    echohl WarningMsg
    echo s:dat2text_count .'/'. b:datutil_last_article_num
    echohl None
  endif
  let retval = s:FormatArticle(a:linestr)
  let s:dat2text_count = s:dat2text_count + 1
  return escape(retval, '\\')
endfunction

function! Dat2Text(...)
  let flags = a:0 > 0 ? a:1 : ''
  let s:dat2text_count = 1
  let s:dat2text_verbose = AL_hasflag(flags, 'verbose') ? 1 : 0
  " �X���b�h�t�H�[�}�b�g�p�^�[��������
  let firstline = '0<>' . getline(1)
  if firstline =~ s:GetMx_bbs2ch()
    let s:mx_article = s:GetMx_bbs2ch()
    let b:dat2text_format = '2ch'
  elseif firstline =~ s:GetMx_bbsmodoki()
    let s:mx_article = s:GetMx_bbsmodoki()
    let b:dat2text_format = 'modoki'
  else
    let s:mx_article = s:GetMx_bbs2ch()
    let b:dat2text_format = 'default'
  endif

  " ��ŕ\���ʒu�𒲐����邽��
  let curline = line('.')
  " �K�v�Ȃ�΃o�b�t�@�T�C�Y���擾����
  let not_filesize = 0
  if !exists('b:datutil_datsize')
    let not_filesize = 1
    let b:datutil_datsize = line2byte(line('$') + 1)
  endif
  " ������datutil���ŏ�ɐݒ肷��
  let b:datutil_last_article_num = line('$')
  let b:datutil_title = substitute(firstline, s:mx_article, '\6', '')

  %s/^.*$/\=s:Dat2Text_loop(s:dat2text_count."<>".submatch(0))/
  " �w�b�_�[���쐬
  call setline(1, 'Title: '. b:datutil_title)
  let size_kb = (b:datutil_datsize / 1024) . 'KB'
  call append(1, 'Size: ' . size_kb . (not_filesize ? ' (NOT FILESIZE)' : ''))
  call append(2, '') " HTML��MAIL�w�b�_�[���ɂ��Ă���
  call AL_decode_entityreference('%')

  call AL_del_lastsearch()
  unlet s:dat2text_count
  unlet s:dat2text_verbose
  " �K�v�Ȃ�΃J�[�\���ʒu�𐮌`�O�ɂ������L���ֈړ�
  if AL_hasflag(flags, 'keepline')
    call search('^'.curline.' ', 'w')
  endif
  redraw!

  return b:datutil_title
endfunction

if s:debug
  function! Test_Dat2Text(...)
    let flags = a:0 > 0 ? a:1 : ''
    setlocal buftype=nofile nowrap
    call Dat2Text(flags)
  endfunction
endif
