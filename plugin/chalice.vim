" vim:set ts=8 sts=2 sw=2 tw=0 nowrap:
"
" chalice.vim - 2ch viewer 'Chalice' /
"
" Last Change: 07-Mar-2002.
" Written By:  Muraoka Taro <koron@tka.att.ne.jp>

scriptencoding cp932

" �g����
"   chalice�f�B���N�g����'runtimepath'�ɒʂ��Ă���Vim���N������:Chalice�����s
"     :set runtimepath+=$HOME/chalice
"     :Chalice

" �v���O�C���̖������t���O
if exists('plugin_chalice_disable')
  finish
endif

" �O���[�o���֐�
"   ChaliceIsRunning()
"   ChaliceDebug()

"------------------------------------------------------------------------------
" ���[�U���ݒ�\�ȃO���[�o���ϐ�

" ���[�U��/�����������̖��O�ݒ�
if !exists('g:chalice_username')
  let g:chalice_username = '����������@Vim%Chalice'
endif
if !exists('g:chalice_anonyname')
  let g:chalice_anonyname = ''
endif

" ���[���A�h���X
if !exists('g:chalice_usermail')
  let g:chalice_usermail = ''
endif

" �u�b�N�}�[�N�f�[�^�t�@�C��
if !exists('g:chalice_bookmark')
  let g:chalice_bookmark = ''
endif

" �W�����v�����̍ő�T�C�Y
if !exists('g:chalice_jumpmax')
  let g:chalice_jumpmax = 100
endif

" �����[�h�^�C��
"   g:chalice_reloadinterval_boardlist	�ꗗ�̃����[�h�^�C��(1�T��)
"   g:chalice_reloadinterval_threadlist	�̃����[�h�^�C��(30����)
"   g:chalice_reloadinterval_thread	�X���̃����[�h�^�C��(5����/���g�p)
if !exists('g:chalice_reloadinterval_boardlist')
  let g:chalice_reloadinterval_boardlist = 604800
endif
if !exists('g:chalice_reloadinterval_threadlist')
  let g:chalice_reloadinterval_threadlist = 1800
endif
"   g:chalice_reloadinterval_thread	�X���̃����[�h�^�C��(5����/���g�p)
if !exists('g:chalice_reloadinterval_thread')
  let g:chalice_reloadinterval_thread = 300
endif

" �X���N�x�\��
"   �X��dat�̍ŏI�X�V����ݒ肳�ꂽ����(2����)���o�߂�������񎦂���B
"   g:chalice_threadinfo		�N�x�\���̗L��/�����t���O
"   g:chalice_threadinfo_expire		�N�x�ێ�����(1����)
if !exists('g:chalice_threadinfo')
  let g:chalice_threadinfo = 1
endif
if !exists('g:chalice_threadinfo_expire')
  let g:chalice_threadinfo_expire = 3600
endif

" �}���`���[�U�ݒ�
if !exists('g:chalice_multiuser')
  let g:chalice_multiuser = has('unix') ? 1 : 0
endif

" �O���u���E�U�̎w��(��Windows��)
if !exists('g:chalice_exbrowser')
  let g:chalice_exbrowser = ''
endif

" ���[�U�t�@�C���̈ʒu�ݒ�
if !exists('g:chalice_basedir')
  if g:chalice_multiuser
    if has('win32') || has('mac')
      let g:chalice_basedir = $HOME . '/vimfiles/chalice'
    else
      let g:chalice_basedir = $HOME . '/.vim/chalice'
    endif
  else
    let g:chalice_basedir = substitute(expand('<sfile>:p:h'), '[/\\]plugin$', '', '')
  endif
endif

" PROXY�Ƃ�����������Ɨǂ�����
if !exists('g:chalice_curl_options')
  let g:chalice_curl_options= ''
endif

" gzip���k�g�p�t���O
if !exists('g:chalice_gzip')
  let g:chalice_gzip = 1
endif

" 0�ȏ�ɐݒ肷��ƃf�o�b�O�p�Ƀ��b�Z�[�W�����߂ɓ����Ă�
if !exists('g:chalice_verbose')
  let g:chalice_verbose = 0
endif

" Chalice �N������'columns'��ς��邱�Ƃ��ł���(-1:����)
if !exists('g:chalice_columns')
  let g:chalice_columns = -1
endif

"------------------------------------------------------------------------------
" �萔�l
"   �����̓O���[�o���I�v�V�������ł������Ȃ́B�������̓��[�U�����������Ă���
"   �������Ȃ́B

let s:prefix_board = '  �X���ꗗ '
let s:prefix_thread = '  �X���b�h '
let s:prefix_write = '  �����X�� '
let s:label_vimtitle = 'Chalice �`2�����˂�{���v���O�C���`'
let s:label_boardlist = '�ꗗ'
let s:label_boardcategory_mark = '��'
let s:label_newthread = '[�V�X��]'
let s:label_bookmark = '  �X���̞x'
" ���b�Z�[�W
let s:msg_confirm_appendwrite_yn = '�o�b�t�@�̓��e���������݉\�ł�. �������݂܂���?(yes/no): '
let s:msg_confirm_appendwrite_ync = '�{���ɏ������݂܂���?(yes/no/cancel): '
let s:msg_confirm_replacebookmark = '�K�C�V���cURL�ł�. �u�������܂���?(yes/no/cancel): '
let s:msg_prompt_pressenter = '������ɂ� Enter �������Ă�������.'
let s:msg_warn_oldthreadlist = '�X���ꗗ���Â��\��������܂�. R �ōX�V���܂�.'
let s:msg_warn_bookmark = '�x�͕��鎞�Ɏ����I�ɕۑ�����܂�.'
let s:msg_warn_bmkcancel = '�x�ւ̓o�^�̓L�����Z������܂���.'
let s:msg_wait_threadformat = '�M�l��!! �X���b�h���`���̂��߁A���΂炭���҂���������...'
let s:msg_wait_download = '�_�E�����[�h��...'
let s:msg_error_nocurl = 'Chalice�ɂ͐������C���X�g�[�����ꂽcURL���K�v�ł�.'
let s:msg_error_noconv = 'Chalice���CP932���ŗ��p����ɂ� qkc �������� nkf ���K�v�ł�.'
let s:msg_error_cantjump = '�J�[�\���̍s�ɃA���J�[�͂���܂���. �T��'
let s:msg_error_appendnothread = '�S���@!! �X���b�h���Ȃ�YO!!'
let s:msg_error_creatnoboard = '���w�肵�Ȃ��ƕ��X������������܂���'
let s:msg_error_writebufhead = '�������݃o�b�t�@�̃w�b�_���s���ł�.'
let s:msg_error_writebufbody = '�������݃��b�Z�[�W����ł�.'
let s:msg_error_writeabort = '�������݂𒆎~���܂���.'
let s:msg_error_writecancel = '�������݂��L�����Z�����܂�.'
let s:msg_error_writetitle = '�V�X���ɂ̓^�C�g�����K�v�ł�.'
let s:msg_error_addnothread = '�܂��X�����J���Ă��Ȃ��̂œo�^�o���܂���.'
let s:msg_error_addnothreadlist = '�X���ꗗ����x�֓o�^�o���܂���.'
let s:msg_error_nocachedir = '�L���b�V���f�B���N�g�����쐬�o���܂���.'
let s:msg_chalice_quit = 'Chalice �`�`�`�`�`�`�`�`�I���`�`�`�`�`�`�`�`'
let s:msg_chalice_start = 'Chalice �L�{���k'
" 1�s�w���v
let s:msg_help_boardlist = '(�ꗗ)  <CR>:����  j/k:�I��  h/l:�J�e�S����/�J  R:�X�V'
let s:msg_help_threadlist = '(�X���ꗗ)  <CR>:�X������ j/k:�X���I��  d:dat�폜  R:�X�V'
let s:msg_help_thread = '(�X���b�h)  i:����  I:sage����  a:��������  A:����sage  r:�X�V'
let s:msg_help_bookmark = '(�X���̞x)  <CR>:URL����  h/l:��/�J <C-A>:����  [�ҏW�\]'
let s:msg_help_write = '(��������)  <C-CR>:�������ݎ��s  <C-W>c:����  [�ҏW�\]'

"------------------------------------------------------------------------------
" �萔�l CONSTANT
"   �����ł̂ݎg�p�������

" �f�o�b�O�t���O (DEBUG FLAG)
let s:debug = 1

" 2ch�F�؂̂��߂̕z��
let s:user_agent = 'Monazilla/1.00 Chalice/1.2e'
let s:user_agent_enable = 1
" 2ch�ˑ��f�[�^
let s:encoding = 'cp932'
let s:host = 'www.2ch.net'
let s:remote = '2ch.html'
" 2ch�̃��j���[�擾�p�����f�[�^
let s:menu_host = 'www6.ocn.ne.jp'
let s:menu_remotepath = '~mirv/2chmenu.html'
let s:menu_localpath = 'bbsmenu'
" �E�B���h�E���ʎq
let s:buftitle_boardlist  = 'Chalice_2�����˂�_�ꗗ'
let s:buftitle_threadlist = 'Chalice_2�����˂�_�X���ꗗ'
let s:buftitle_thread	  = 'Chalice_2�����˂�_�X���b�h'
let s:buftitle_write	  = 'Chalice_2�����˂�_��������'
" �������ݎ��̕����R�[�h��������邽�ߒ蕶����
let s:urlencoded_write = '%8F%91%82%AB%8D%9E%82%DE' " ��������
let s:urlencoded_newwrite = '%90V%8BK%83X%83%8C%83b%83h%8D%EC%90%AC' " �V�X��

" �X�N���v�gID���擾
map <SID>xx <SID>xx
let s:sid = substitute(maparg('<SID>xx'), 'xx$', '', '')
unmap <SID>xx

" �N���t���O
let s:opend = 0

" �O���R�}���h���s�t�@�C����
let s:cmd_curl = ''
let s:cmd_conv = ''
let s:cmd_gzip = ''

" MATCH PATTERNS
let s:mx_thread_dat = '^[ !+] \(.\+\) (\(\d\+\)).*\t\+\(\d\+\.dat\)'

" �R�}���h�̐ݒ�
command! Chalice			call <SID>ChaliceOpen()

" �I�[�g�R�}���h�̐ݒ�
augroup Chalice
autocmd!
execute "autocmd BufHidden " . s:buftitle_write . " call <SID>DoWriteBuffer('closing')"
execute "autocmd BufEnter " . s:buftitle_boardlist . " redraw!|call s:EchoH('WarningMsg',s:msg_help_boardlist)|normal! 0"
execute "autocmd BufEnter " . s:buftitle_threadlist . " redraw!|call s:EchoH('WarningMsg',s:opened_bookmark?s:msg_help_bookmark : s:msg_help_threadlist)"
execute "autocmd BufEnter " . s:buftitle_thread . " redraw!|call s:EchoH('WarningMsg',s:msg_help_thread)"
execute "autocmd BufEnter " . s:buftitle_write . " let &undolevels=s:undolevels|call s:EchoH('WarningMsg', s:msg_help_write)"
execute "autocmd BufLeave " . s:buftitle_write . " set undolevels=0"
execute "autocmd BufDelete " . s:buftitle_threadlist . " if s:opened_bookmark|call s:CloseBookmark()|endif"
augroup END

"------------------------------------------------------------------------------
" DEVELOPING FUNCTIONS
" �J���r��֐�

"
" �X����.dat���폜����
"
function! s:DeleteThreadDat()
  call s:GoBuf_ThreadList()
  " �o�b�t�@���X���ꗗ�ł͂Ȃ������ꍇ�A���I��
  if b:host == '' || b:board == ''
    return
  endif

  " �J�[�\���̌��݈ʒu����dat�����擾
  let curline = getline('.')
  if curline =~ s:mx_thread_dat
    let dat = substitute(curline, s:mx_thread_dat, '\3', '')
    " host,board,dat���烍�[�J���t�@�C�����𐶐�
    let local = s:GenerateLocalDat(b:host, b:board, dat)
    " �t�@�C��������Ώ���
    if filereadable(local)
      call delete(local)
      if g:chalice_threadinfo
	call s:FormatThreadInfo(line('.'), line('.'))
      endif
    endif
  endif
endfunction

"
" URL��Chalice�ŊJ��
"
function! s:HandleURL(url, flag)
  " �ʏ��URL�������ꍇ�A�������ŊO���u���E�U�ɓn���Ă���BURL�̌`���݂�2ch
  " �Ȃ�Γ����ŊJ���B
  if a:url !~ '\(http\|ftp\)://[-!#%&+,./0-9:;=?@A-Za-z_~]\+' " URLPAT
    return 0
  endif
  if s:DoesFlagHaveTarget(a:flag, '\cexternal') || !s:Parse2chURL(a:url)
    " �����I�ɊO���u���E�U���g�p����悤�Ɏw�肳�ꂽ��URL���A2ch�ł͂Ȃ���
    call s:OpenURL(a:url)
  else
    if !s:DoesFlagHaveTarget(a:flag, '\cnoaddhist')
      call s:AddHistoryJump(s:ScreenLine(), line('.'))
    endif

    " URL��2ch�Ɣ��f����鎞
    "	s:parse2ch_host, s:parse2ch_board, s:parse2ch_dat��Parse2chURL()����
    "	�ݒ肳���ÖٓI�Ȗ߂�l�B
    call s:UpdateThread('', s:parse2ch_host, s:parse2ch_board, s:parse2ch_dat . '.dat', 'continue')

    if s:parse2ch_range_mode =~ 'r'
      if s:parse2ch_range_mode !~ 'l'
	" �񃊃X�g���[�h
	" �\���͈͌��folding
	if s:parse2ch_range_end != '$'
	  let fold_start = s:GetLnum_Article(s:parse2ch_range_end + 1)  - 1
	  silent! execute fold_start . ',$fold'
	endif
	" �\���͈͑O��folding
	if s:parse2ch_range_start > 1
	  let fold_start = s:GetLnum_Article(s:parse2ch_range_mode =~ 'n' ? 1 : 2) - 1
	  let fold_end = s:GetLnum_Article(s:parse2ch_range_start) - 2
	  silent! execute fold_start . ',' . fold_end . 'fold'
	endif
      else
	" ���X�g���[�h
	" TODO: �\���͈͎w�������
      endif
    endif

    if !s:DoesFlagHaveTarget(a:flag, '\cnoaddhist')
      call s:AddHistoryJump(s:ScreenLine(), line('.'))
    endif
  endif
  return 1
endfunction

"
" URL���O���u���E�U�ɊJ������
"
function! s:OpenURL(url)
  let retval = 0
  if a:url == ''
    return retval
  endif
  let url = escape(a:url, '%#')
  if has('win32')
    " URL���N���b�v�{�[�h�֕��荞��
    let @* = url
    " Windows���ł̊O���u���E�U�N��
    if !has('win95') && url !~ '[&!]'
      " NT�n�ł͂������̕������܂��s�����Ƃ�����
      silent execute '!start /min cmd /c start ' . url
      if s:debug | let @a = '!start /min cmd /c start ' . url | endif
    else
      silent! execute "!start rundll32 url.dll,FileProtocolHandler " . url
      if s:debug | let @a = "!start rundll32 url.dll,FileProtocolHandler " . url | endif
    endif
    let retval = 1
  elseif g:chalice_exbrowser != ''
    " ��Windows���ł̊O���u���E�U�N��
    "
    " ���s�̒u����'&'��'%URL%'�ɒu�����̂�h���B
    " '~'�����O�̒u���p�^�[���Œu�����̂�h��
    let url = escape(url, '&~')
    let excmd = substitute(g:chalice_exbrowser, '%URL%', url, 'g')
    call s:DoExternalCommand(excmd)
    let retval = 1
  endif

  redraw!
  if retval
    let msg =  "Open " . a:url . " with your browser"
  else
    let msg = "Chalice:OpenURL is not implemented:" . a:url
  endif
  call s:EchoH('WarningMsg', msg)
  return retval
endfunction

"
" �������ݓ��̃����N������
"
function! s:HandleJump(flag)
  call s:GoBuf_Thread()
  let mx1 = '>>\(\(\d\+\)\(-\d\+\)\?\)'
  let mx2 = '\(\(h\?ttp\|ftp\)://[-!#%&+,./0-9:;=?@A-Za-z_~]\+\)' " URLPAT

  " �J�[�\�����̃����N��T���o���B�Ȃ���Ό���փT�[�`
  let context = expand('<cword>')
  if context !~ mx1 && context !~ mx2
    let context = strpart(getline('.'), col('.') - 1)
  endif

  if context =~ mx1
    " �X���̋L���ԍ��������ꍇ
    let num = substitute(matchstr(context, mx1), mx1, '\2', '')
    if s:DoesFlagHaveTarget(a:flag, '\cinternal')
      let oldsc = s:ScreenLine()
      let oldcur = line('.')
      let lnum = s:GoThread_Article(num)
      if lnum > 0
	silent! execute lnum . "foldopen!"
	" �Q�ƌ����q�X�g���ɓ����
	call s:AddHistoryJump(oldsc, oldcur)
	" �Q�Ɛ���q�X�g���ɓ����
	call s:AddHistoryJump(s:ScreenLine(), line('.'))
      endif
    elseif s:DoesFlagHaveTarget(a:flag, '\cexternal')
      if b:host != '' && b:board != '' && b:dat != ''
	let num = substitute(matchstr(context, mx1), mx1, '\1', '')
	call s:OpenURL('http://' . b:host . '/test/read.cgi' . b:board . '/' . substitute(b:dat, '\.dat$', '', '') . '/' . num . 'n')
      endif
    endif
  elseif context =~ mx2
    let url = substitute(matchstr(context, mx2), '^ttp', 'http', '')
    return s:HandleURL(url, a:flag)
  else
    call s:EchoH('ErrorMsg', s:msg_error_cantjump)
  endif
endfunction

"
" �X���b�h�̍X�V���s�Ȃ�
"
function! s:UpdateThread(title, host, board, dat, flag)
  call s:GoBuf_Thread()
  if a:title != ''
    " �X���̃^�C�g�����o�b�t�@���ɐݒ�
    let b:title = s:prefix_thread . a:title
    let b:title_raw = a:title
  endif
  " �o�b�t�@�ϐ���host,board,dat����������쐬(�R�s�[�����ǂ�)
  if a:host != ''
    let b:host = a:host
  endif
  if a:board != ''
    let b:board = a:board
  endif
  if a:dat != ''
    let b:dat =  a:dat
  endif
  if b:host == '' || b:board == '' || b:dat == ''
    " TODO: �����G���[�������~����
    return
  endif

  " URL�ƃ_�E�����[�h�p�X�𐶐�
  let local = s:GenerateLocalDat(b:host, b:board, b:dat)
  let remote = b:board . '/dat/' . b:dat
  let prevsize = 0
  " �X���b�h�̓��e���_�E�����[�h
  if !filereadable(local) || !s:DoesFlagHaveTarget(a:flag, '\cnoforce')
    " �t�@�C���̌��̃T�C�Y���o���Ă���
    if filereadable(local)
      let prevsize = getfsize(local)
    endif
    call s:HttpDownload(b:host, remote, local, a:flag)
    " (�K�v�Ȃ��)�X���ꗗ�̃X�������X�V
    if g:chalice_threadinfo
      call s:FormatThreadInfo(1, 0)
      call s:GoBuf_Thread()
    endif
  endif

  " �X���b�h���o�b�t�@�Ƀ��[�h���Đ��`
  call s:ClearBuffer()
  silent! execute "read " . local
  normal! gg"_dd
  if prevsize > 0
    silent! execute 'normal! ' . prevsize . 'go'
    let newarticle = line('.') + 1
  else
    let newarticle = 1
  endif

  " a:title���ݒ肳��Ă��Ȃ����A1�̏������݂���X�����𔻒f����
  if a:title == ''
    let title = substitute(getline(1), '^.\+<>\(.\+\)$', '\1', '')
    if title != ''
      " �X���̃^�C�g�����o�b�t�@���ɐݒ�
      let b:title = s:prefix_thread . title
      let b:title_raw = title
    endif
  endif

  " ���`
  call s:FormatThread()

  if !s:GoThread_Article(newarticle)
    normal! Gzb
  endif
  redraw!
  call s:EchoH('WarningMsg', s:msg_help_thread)
endfunction

"
" ���e���X�V����
"
function! s:UpdateBoard(title, host, board, force)
  call s:CloseBookmark()
  " �X���b�h���X�g�Ɉړ����� 1.�^�C�g�� 2.�z�X�g 3.��ID��ݒ肷��
  call s:GoBuf_ThreadList()
  if a:title != ''
    let b:title = s:prefix_board . a:title
    let b:title_raw = a:title
  else
    let b:title = s:prefix_board . b:title_raw
  else
  endif
  if a:host != ''
    let b:host = a:host
  endif
  if a:board != ''
    let b:board = a:board
  endif
  if b:host == '' || b:board == ''
    " TODO: �����G���[�������~����
    return
  endif

  " �p�X�𐶐����ăX���ꗗ���_�E�����[�h
  let local = s:GenerateLocalSubject(b:host, b:board)
  let remote = b:board . '/subject.txt'
  let updated = 0
  if a:force || !filereadable(local) || localtime() - getftime(local) > g:chalice_reloadinterval_threadlist
    call s:HttpDownload(b:host, remote, local, '')
    let updated = 1
  endif

  " �X���ꗗ���o�b�t�@�Ƀ��[�h���Đ��`
  call s:ClearBuffer()
  silent! execute "read " . local
  " ���`
  call s:FormatBoard()

  " �擪�s�ֈړ�
  silent! normal! gg0

  if !updated
    redraw!
    call s:EchoH('WarningMsg', s:msg_warn_oldthreadlist)
  endif
endfunction

"------------------------------------------------------------------------------
" �b��I�Ɍł܂����֐��Q 
" FIXED FUNCTIONS

function! s:DoesFlagHaveTarget(flag, target)
  return a:flag =~ '\(^\|,\)' . a:target .'\(,\|$\)'
endfunction

" �X�N���[���ɕ\������Ă���擪�̍s�ԍ����擾����
function! s:ScreenLine()
  let wline = winline() - 1
  silent! normal! H
  let retval = line('.')
  while wline > 0
    silent! execute 'normal! gj'
    let wline = wline - 1
  endwhile
  return retval
endfunction

function! s:ScreenLineJump(scline, curline)
  " ��̂̈ʒu�܂ŃW�����v
  let curline = a:curline > 0 ? a:curline - 1 : 0
  silent! execute 'normal! ' . (a:scline + curline) . 'G'
  " �ړI�ʒu�Ƃ̍����v��
  let offset = a:scline - s:ScreenLine()
  if offset < 0
    silent! execute 'normal! ' . (-offset) . "\<C-Y>"
  elseif offset > 0
    silent! execute 'normal! ' . offset . "\<C-E>"
  endif
  " �X�N���[�����ł̃J�[�\���ʒu��ݒ肷��
  silent! execute 'normal! H'
  while curline > 0
    silent! execute 'normal! gj'
    let curline = curline - 1
  endwhile
endfunction

function! s:ClearBuffer()
  "normal! gg"_dG0
  silent! execute '%delete _'
endfunction

"
" �f�B���N�g���쐬�̃��b�p�[
"
function! s:MakeDir(dir)
  let fq = s:GetFileQuote()

  let dir = fq . substitute(a:dir, '[/\\]$', '', '') . fq
  if has('win32') && &shell !~ 'sh'
    call s:DoExternalCommand('mkdir ' . substitute(dir, '/', '\\', 'g'))
  else
    call s:DoExternalCommand('mkdir -p ' . dir)
  endif
endfunction

"
" �n�C���C�g���w�肵�����b�Z�[�W�\��
"
function! s:EchoH(hlname, msgstr)
  execute "echohl " . a:hlname
  echo a:msgstr
  echohl None
endfunction

"
" Chalice�I��
"
function! s:ChaliceClose(flag)
  if !s:opend
    return
  endif
  silent! call s:CommandUnregister()
  " �u�b�N�}�[�N���J����Ă����ꍇ���邱�Ƃŕۑ�����
  if s:opened_bookmark
    call s:CloseBookmark()
  endif
  if s:DoesFlagHaveTarget(a:flag, 'all')
    execute "qall!"
  endif
  let s:opend = 0

  " �ύX�����O���[�o���I�v�V�����̕��A
  let &charconvert = s:charconvert
  let &columns = s:columns
  let &foldcolumn = s:foldcolumn
  let &ignorecase = s:ignorecase
  let &lazyredraw = s:lazyredraw
  let &wrapscan = s:wrapscan
  let &winwidth = s:winwidth
  let &winheight = s:winheight
  let &scrolloff = s:scrolloff
  let &statusline = s:statusline
  let &titlestring = s:titlestring
  let &undolevels = s:undolevels

  silent! execute "bw " . s:buftitle_write
  silent! new
  silent! only!
  silent! redraw

  " �I�����b�Z�[�W
  call s:EchoH('WarningMsg', s:msg_chalice_quit)
endfunction

function! s:CharConvert()
  if v:charconvert_from == 'cp932' && v:charconvert_to == 'euc-jp' && s:cmd_conv != ''
    call s:DoExternalCommand(s:cmd_conv .'<'. v:fname_in .'>'. v:fname_out)
    return 0
  else
    return 1
  endif
endfunction

function! ChaliceDebug()
  echo "s:sid=".s:sid
  echo "s:cmd_curl=".s:cmd_curl
  echo "s:cmd_conv=".s:cmd_conv
  echo "s:cmd_gzip=".s:cmd_gzip
  echo "s:dir_cache=".s:dir_cache
  echo "g:chalice_bookmark=".g:chalice_bookmark
endfunction

"
" ��������`�F�b�N
"
function! s:CheckEnvironment()
  " �Ǝ���path���擾�E�ݒ�
  if has('win32')
    let path = substitute(substitute($PATH, '\\', '/', 'g'), ';', ',', 'g')
  else
    let path = substitute($PATH, ':', ',', 'g')
  endif

  " 'wildignore'��ޔ�
  let wildignore = &wildignore
  set wildignore=
  
  " cURL�̃p�X���擾
  let curl_exe = 'curl' . (has('win32') ? '.exe' : '')
  if globpath(path, curl_exe) != ''
    " cURL��PATH���ɂ���̂ŕ��ʂɎ��s�\
    let s:cmd_curl = 'curl'
  else
    let s:cmd_curl = globpath($VIM, curl_exe)
    if s:cmd_curl == ''
      call s:EchoH('ErrorMsg', s:msg_error_nocurl)
      return 0
    elseif s:cmd_curl =~ ' '
      let fq = s:GetFileQuote()
      let s:cmd_curl = fq . s:cmd_curl . fq
    endif
  endif

  " ��CP932���ł̓R���o�[�^���擾����K�v������B
  if &encoding != 'cp932'
    if globpath(path, 'qkc') != ''
      let s:cmd_conv = 'qkc -e -u'
    else
      if globpath(path, 'nkf') != ''
	let s:cmd_conv = 'nkf -e'
      else
	" qkc/nkf��������Ȃ�
	call s:EchoH('ErrorMsg', s:msg_error_noconv)
	return 0
      endif
    endif
  else
    let s:cmd_conv = ''
  endif

  " gzip��T��
  let gzip_exe = 'gzip' . (has('win32') ? '.exe' : '')
  if globpath(path, gzip_exe) != ''
    let s:cmd_gzip = 'gzip'
  endif

  " �ޔ����Ă�����'wildignore'�𕜋A
  let &wildignore = wildignore

  " �f�B���N�g�����\�z
  if exists('g:chalice_cachedir') && isdirectory(g:chalice_cachedir)
    let s:dir_cache = substitute(g:chalice_cachedir, '[^\/]$', '&/', '')
  else
    let s:dir_cache = g:chalice_basedir . '/cache/'
  endif
  if g:chalice_bookmark == ''
    let g:chalice_bookmark = g:chalice_basedir . '/chalice.bmk'
  endif

  " �L���b�V���f�B���N�g���̕ۏ�
  if !isdirectory(s:dir_cache)
    call s:MakeDir(s:dir_cache)
    if !isdirectory(s:dir_cache)
      redraw!
      call s:EchoH('ErrorMsg', s:msg_error_nocachedir)
      return 0
    endif
  endif

  return 1
endfunction

"
" Chalice�J�n
"
function! s:ChaliceOpen()
  if s:opend
    return
  endif

  " ������̃`�F�b�N
  if !s:CheckEnvironment()
    return
  endif

  " �ύX����O���[�o���I�v�V�����̕ۑ�
  let s:opend = 1
  let s:charconvert = &charconvert
  let s:columns = &columns
  let s:foldcolumn = &foldcolumn
  let s:ignorecase = &ignorecase
  let s:lazyredraw = &lazyredraw
  let s:wrapscan = &wrapscan
  let s:winwidth = &winwidth
  let s:winheight = &winheight
  let s:scrolloff = &scrolloff
  let s:statusline = &statusline
  let s:titlestring = &titlestring
  let s:undolevels = &undolevels

  " �O���[�o���I�v�V������ύX
  if s:cmd_conv != ''
    let &charconvert = s:sid . 'CharConvert()'
  endif
  if g:chalice_columns > 0
    let &columns = g:chalice_columns
  endif
  set foldcolumn=0
  set ignorecase
  set lazyredraw
  set wrapscan
  set winheight=8
  set winwidth=15
  set scrolloff=0
  let &statusline = '%<%{' . s:sid . 'GetBufferTitle()}%=%l/%L'
  let &titlestring = s:label_vimtitle
  set undolevels=0

  call s:CommandRegister()
  call s:OpenAllChaliceBuffers()
  call s:UpdateBoardList(0)
  silent! redraw

  " �J�n���b�Z�[�W�\��
  call s:EchoH('WarningMsg', s:msg_chalice_start)
endfunction

"
" �O���R�}���h�����s
"   verbose���x���ɉ��������@�Ŏ��s����B
"
function! s:DoExternalCommand(cmd)
  let extcmd = a:cmd
  if has('win32') && &shell =~ '\ccmd'
    let extcmd = '"' . extcmd . '"'
  endif
  if g:chalice_verbose < 1
    return system(extcmd)
  elseif g:chalice_verbose < 2
    silent! execute ':!' . extcmd
  else
    execute ':!' . extcmd
  endif
endfunction

"
" ������̐擪�Ɩ����̋󔒂��폜����
"
function! s:TrimSpace(str)
  return substitute(a:str, '^\s\+\|\s\+$', '', '')
endfunction

"
" ���݂̃J�[�\���s�̃X���b�h���J��
"
function! s:OpenThread(...)
  let flag = (a:0 > 0) ? a:1 : 'internal'
  let curline = getline('.')
  let mx2 = '\(http://[-!#%&+,./0-9:;=?@A-Za-z_~]\+\)' " URLPAT

  if curline =~ s:mx_thread_dat
    let host = b:host
    let board = b:board
    let title = substitute(curline, s:mx_thread_dat, '\1', '')
    let dat = substitute(curline, s:mx_thread_dat, '\3', '')
    let url = 'http://' . host . '/test/read.cgi' . board . '/'. substitute(dat, '\.dat$', '', '') . '/l50'
  elseif curline =~ mx2
    let url = matchstr(curline, mx2)
  else
    " fold�̊J���g�O��
    normal! 0za
    return
  endif

  call s:HandleURL(url, flag . ',noaddhist')
  if flag =~ '\cfirstline'
    normal! gg
  endif
  call s:AddHistoryJump(s:ScreenLine(), line('.'))
endfunction

"
" ���݂̃J�[�\���s�̔��J��
"
function! s:OpenBoard(...)
  let board = getline('.')
  let mx = '^ \(\S\+\)\s\+http://\([^/]\+\)\(/\S*\).*$'
  if board !~ mx
    " fold�̊J���g�O��
    normal! 0za
    return
  endif

  let title = substitute(board, mx, '\1', '')
  let host = substitute(board, mx, '\2', '')
  let board = substitute(substitute(board, mx, '\3', ''), '/$', '', '')

  " �f�o�b�O�\���p
  if 0
    let mes = ''
    let mes = mes . "title=" . title . " host=" . host . " board=" . board
    execute "normal! i" . mes "\<CR>"
  else
    if a:0 > 0 && a:1 =~ 'external'
      return s:OpenURL('http://' . host . board . '/')
    endif
    call s:UpdateBoard(title, host, board, 0)
  endif
endfunction

"
" �^����ꂽURL��2ch���ǂ������f����!!
"
function! s:Parse2chURL(url)
  let mx = '^http://\([^/]\+\)/test/read.cgi\(/[^/]\+\)/\(\d\+\)\(.*\)'
  if a:url !~ mx
    return 0
  endif
  let s:parse2ch_host = substitute(a:url, mx, '\1', '')
  let s:parse2ch_board = substitute(a:url, mx, '\2', '')
  let s:parse2ch_dat = substitute(a:url, mx, '\3', '')

  " �\���͈͂�����
  " �Q�l����: http://pc.2ch.net/test/read.cgi/tech/1002820903/
  let range = substitute(a:url, mx, '\4', '')
  let mx_n1 = '^/\(n\=\)\(\d\+\)-\(\d\+\)$'
  let mx_n2 = '^/\(n\=\)\(\d\+\)-$'
  let mx_n3 = '^/\(n\=\)-\(\d\+\)$'
  let mx_n4 = '^/\(n\=l\=\)\(\d\+\)$'
  let article_mode = ''
  let article_start = ''
  let article_end = ''
  if range =~ mx_n1
    let article_mode = 'r' . substitute(range, mx_n1, '\1', '')
    let article_start = substitute(range, mx_n1, '\2', '')
    let article_end = substitute(range, mx_n1, '\3', '')
  elseif range =~ mx_n2
    let article_mode = 'r' . substitute(range, mx_n2, '\1', '')
    let article_start = substitute(range, mx_n2, '\2', '')
    let article_end = '$'
  elseif range =~ mx_n3
    let article_mode = 'r' . substitute(range, mx_n3, '\1', '')
    let article_start = 1
    let article_end = substitute(range, mx_n3, '\2', '')
  elseif range =~ mx_n4
    let article_mode = 'r' . substitute(range, mx_n4, '\1', '')
    let article_start = substitute(range, mx_n4, '\2', '')
    let article_end = article_start
  endif
  let s:parse2ch_range_mode = article_mode
  let s:parse2ch_range_start = article_start
  let s:parse2ch_range_end = article_end

  return 1
endfunction

"
" �C�ӂ̃o�b�t�@�^�C�g����statusline�ŕ\�����邽�߂̃��b�p�[
"
function! s:GetBufferTitle()
  if !exists('b:title')
    return bufname('%')
  else
    return b:title
  endif
endfunction

" s:OpenAllChaliceBuffers
"   Chalice�p�̃o�b�t�@����ʂ�S�ĊJ���Ă��܂�
function! s:OpenAllChaliceBuffers()
  " �X���b�h�p�o�b�t�@���J��
  silent! execute "edit! " . s:buftitle_thread
  setlocal filetype=2ch_thread
  let b:title = s:prefix_thread

  " �ꗗ�p�o�b�t�@���J��
  silent! execute "topleft 15vnew! " . s:buftitle_boardlist
  setlocal filetype=2ch_boardlist
  let b:title = s:label_boardlist

  " �X���b�h�ꗗ�p�o�b�t�@(==��)���J��
  call s:GoBuf_Thread()
  silent! execute "leftabove 10new! " . s:buftitle_threadlist
  setlocal filetype=2ch_threadlist
  let b:title = s:prefix_board
endfunction

"
" HTTP�_�E�����[�h�̊֐�:
"   ������wget�Ɉˑ����Ȃ��悤�ɂ������B
"
function! s:HttpDownload(host, remotepath, localpath, flag)
  redraw!
  call s:EchoH('WarningMsg', s:msg_wait_download)

  let local = a:localpath
  let url = 'http://' . a:host . '/' . substitute(a:remotepath, '^/', '', '')
  let continued = 0
  let compressed = 0

  " �N���I�v�V�����̍\�z��cURL�̎��s
  let fq = s:GetFileQuote()
  let opts = g:chalice_curl_options

  " ��dat�ǂݍ��ݐ����ɑΉ�
  if s:user_agent_enable
    let opts = opts . ' -A ' .fq. s:user_agent .fq
  endif

  " �p�����[�h�̃I�v�V�����ݒ�
  if s:DoesFlagHaveTarget(a:flag, 'continue')
    let size = getfsize(local)
    if size > 0
      let continued = 1
      let opts = opts . ' -C ' . size
    endif
  endif

  " ���k���[�h�̃I�v�V�����ݒ�
  if !continued && g:chalice_gzip && s:cmd_gzip != ''
    let compressed = 1
    let local = local . '.gz'
    let opts = opts . ' -H Accept-Encoding:gzip,deflate'
  endif

  " �R�}���h�\���_�E�����[�h
  let opts = opts . ' -o ' . fq . local . fq . ' ' . fq . url . fq
  call s:DoExternalCommand(s:cmd_curl . ' ' . opts)

  if compressed
    " �𓀒��`
    call s:DoExternalCommand(s:cmd_gzip . ' -d -f ' . fq . local . fq)
    if filereadable(local)
      call rename(local, substitute(local, '\.gz$', '', ''))
    endif
  endif

  redraw!
endfunction

"
" �ꗗ�̃o�b�t�@���X�V
"
function! s:UpdateBoardList(force)
  call s:GoBuf_BoardList()
  let b:title = s:label_boardlist

  let local_menu = s:dir_cache . s:menu_localpath
  " �ꗗ�̓ǂݍ���
  if a:force || !filereadable(local_menu) || localtime() - getftime(local_menu) > g:chalice_reloadinterval_boardlist
    " 2ch�̃t���[����ǂݍ����framedata�Ɋi�[
    let local_frame = tempname()
    call s:HttpDownload(s:host, s:remote, local_frame, '')
    silent! execute '%delete _'
    silent! execute 'read ' . local_frame
    silent! execute "%join"
    let framedata = getline('.')
    silent! execute '%delete _'
    call delete(local_frame)

    " frame�^�O�̉���
    let framedata = substitute(framedata, '^.*\(frame\>[^>]*name="\?menu"\?[^>]*\)>.*$', '\1', '')
    let mx = '^.*src="\?http://\([^/]\+\)/\([^" ]*\)"\?.*$'
    let menu_host = substitute(framedata, mx, '\1', '')
    let menu_remotepath = substitute(framedata, mx, '\2', '')
    if menu_host == ''
      let menu_host = s:menu_host
      let menu_remotepath = s:menu_remotepath
    endif

    " ���j���[�t�@�C���̓Ǎ�
    call s:HttpDownload(menu_host, menu_remotepath, local_menu, '')
  endif

  " �ꗗ�̐��`
  call s:ClearBuffer()
  silent! execute 'read ' . local_menu
  " ���s<BR>��{���̉��s��
  silent! execute "%s/\\c<br>/\r/g"
  " �J�e�S���Ɣւ̃����N�ȊO������
  silent! execute '%g!/^\c<[AB]\>/delete _'
  " �J�e�S���𐮌`
  silent! execute '%s/^<B>\([^<]*\)<\/B>/' . s:label_boardcategory_mark . '\1/'
  " ���𐮌`
  silent! execute '%s/^<A HREF=\([^ ]*\)[^>]*>\([^<]*\)<\/A>/ \2\t\t\t\t\1'
  " �u2ch�����ē��v���폜�c�{���͂����ƃ`�F�b�N���Ȃ���_�������ǁB
  silent! execute '1,/^��/-1delete _'
  "normal! gg"_dd0

  " �e�X�g�I�ւ̃����N��ꗗ�ɖ��ߍ���
  if s:debug
    call append(0, "���e�X�g�I")
    call append(1, " �΂��[\t\t\t\thttp://tora3.2ch.net/butter/")
  endif

  " folding�쐬
  silent! normal! gg
  while 1
    silent! execute '.,/\n\(\��\)\@=\|\%$/fold'
    let prev = line('.')
    silent! normal! j
    if prev == line('.')
      break
    endif
  endwhile
  silent normal! gg
endfunction

"
" Chalice�N���m�F
"
function! ChaliceIsRunning()
  return s:opend
endfunction

function! s:GetFileQuote()
  if &shellxquote == '"'
    return "'"
  else
    return '"'
  endif
endfunction

"------------------------------------------------------------------------------
" MOVE AROUND BUFFER
" �o�b�t�@�ړ��p�֐�

function! s:GetLnum_Article(num)
  call s:GoBuf_Thread()
  if a:num =~ '\cnext'
    let lnum = search('^\d\+  ', 'W')
  elseif a:num =~ '\cprev'
    let lnum = search('^\d\+  ', 'bW')
  else
    let lnum = search('^' . a:num . '  ', 'bw')
  endif
  return lnum
endfunction

function! s:GoThread_Article(num)
  let lnum = s:GetLnum_Article(a:num)
  if lnum
    silent! execute "normal! zt\<C-Y>"
  endif
  return lnum
endfunction

function! s:GoBuf_Write()
  let retval = s:SelectWindowByName(s:buftitle_write)
  if retval < 0
    silent! execute "rightbelow split " . s:buftitle_write
    setlocal filetype=2ch_write
  endif
  return retval
endfunction
function! s:GoBuf_Thread()
  let retval = s:SelectWindowByName(s:buftitle_thread)
  return retval
endfunction
function! s:GoBuf_BoardList()
  let retval = s:SelectWindowByName(s:buftitle_boardlist)
  if retval >= 0
    execute "normal! 15\<C-w>|"
  endif
  return retval
endfunction
function! s:GoBuf_ThreadList()
  let retval = s:SelectWindowByName(s:buftitle_threadlist)
  if retval >= 0
    execute "normal! 10\<C-w>_0"
  endif
  return retval
endfunction

"
" s:SelectWindowByName(name) [global function]
"   Acitvate selected window by a:name.
"
function! s:SelectWindowByName(name)
  let num = bufwinnr(a:name)
  if num >= 0 && num != winnr()
    execute 'normal! ' . num . "\<C-W>\<C-W>"
  endif
  return num
endfunction

"------------------------------------------------------------------------------
" JUMPLIST
" �Ǝ��̃W�����v���X�g

let s:jumplist_current = 0
let s:jumplist_max = 0

function! s:JumplistClear()
  let s:jumplist_current = 0
  let s:jumplist_max = 0
endfunction

function! s:JumplistCurrent()
  return s:jumplist_max > 0 ? s:jumplist_data_{s:jumplist_current} : -1
endfunction

function! s:JumplistAdd(data)
  if s:jumplist_max > 0
    let s:jumplist_current = s:jumplist_current + 1
  else
    let s:jumplist_current = 0
  endif
  let s:jumplist_data_{s:jumplist_current} = a:data
  let s:jumplist_max = s:jumplist_current + 1

  " ���������������Ȃ��悤�ɐ���
  if s:jumplist_max > g:chalice_jumpmax
    let newmax = g:chalice_jumpmax / 2
    let src = s:jumplist_max - newmax
    let dest = 0
    while dest < newmax
      let s:jumplist_data_{dest} = s:jumplist_data_{src}
      let src = src + 1
      let dest = dest + 1
    endwhile
    let s:jumplist_max = newmax
    let s:jumplist_current = newmax - 1
  endif
endfunction

function! s:JumplistNext()
  if s:jumplist_current >= s:jumplist_max - 1
    let s:jumplist_current = s:jumplist_max - 1
    return -1
  endif
  let s:jumplist_current = s:jumplist_current + 1
  let retval = s:jumplist_data_{s:jumplist_current}
  return retval
endfunction

function! s:JumplistPrev()
  if s:jumplist_max <= 0 || s:jumplist_current <= 0
    let s:jumplist_current = 0
    return -1
  endif
  let s:jumplist_current = s:jumplist_current - 1
  let retval = s:jumplist_data_{s:jumplist_current}
  return retval
endfunction

" �_���v
function! s:JumplistDump()
  let i = 0
  call s:EchoH('Title',  'Chalice Jumplist (size=' . s:jumplist_max . ')')
  while i < s:jumplist_max
    let padding = i == s:jumplist_current ? '---->' : '     '
    let numstr = matchstr(padding . i, '......$')
    let indicator = (i == s:jumplist_current) ? ' > ' : '  '
    echo numstr . ': ' . s:jumplist_data_{i}
    let i = i + 1
  endwhile
endfunction

"
" �Ǝ��W�����v���X�g�̃f�o�b�O�p�R�}���h
"
if s:debug
  command! JumplistClear			call <SID>JumplistClear()
  command! -nargs=1 JumplistAdd		call <SID>JumplistAdd(<q-args>)
  command! JumplistPrev			echo "Prev: " . <SID>JumplistPrev()
  command! JumplistNext			echo "Next: " . <SID>JumplistNext()
  command! JumplistDump			call <SID>JumplistDump()
endif

"
" �W�����v�����ɍ��ڂ�ǉ�
"
function! s:AddHistoryJump(scline, curline)
  call s:GoBuf_Thread()
  let packed = b:host . ' ' . b:board . ' ' . b:dat . ' ' . a:scline
  if strpart(s:JumplistCurrent(), 0, strlen(packed)) !=# packed
    call s:JumplistAdd(packed . ' ' . a:curline . ' ' . b:title_raw)
  endif
endfunction

"
" �������W�����v
function! s:DoHistoryJump(flag)
  let data = 0
  if s:DoesFlagHaveTarget(a:flag, '\cnext')
    let data = s:JumplistNext()
  elseif s:DoesFlagHaveTarget(a:flag, '\cprev')
    let data = s:JumplistPrev()
  endif

  let mx = '^\(\S\+\) \(\S\+\) \(\S\+\) \(\S\+\) \(\S\+\).*$'
  if data =~ mx
    " �����f�[�^������
    let host = substitute(data, mx, '\1', '')
    let board = substitute(data, mx, '\2', '')
    let dat = substitute(data, mx, '\3', '')
    let scline = substitute(data, mx, '\4', '')
    let curline = substitute(data, mx, '\5', '')
    " �����ɂ��킹�ăo�b�t�@���ړ�
    call s:GoBuf_Thread()
    if host != b:host || board != b:board || dat != b:dat
      call s:UpdateThread('', host, board, dat, 'continue,noforce')
    endif
    " �X�N���[���\���J�n�s��ݒ聨���s
    call s:ScreenLineJump(scline, 0)
    silent! execute 'normal! ' . curline . 'G'
  endif
endfunction

"------------------------------------------------------------------------------
" URL ENCODING
" URL�G���R�[�h

"
" ���l��16�i����\��������ɕϊ�����B(:help eval-examples���)
"
function! s:Nr2Hex(nr)
  let n = a:nr
  let r = ""
  while n
    let r = '0123456789ABCDEF'[n % 16] . r
    let n = n / 16
  endwhile
  return r
endfunction

"
" �^����ꂽ�������URL�G���R�[�h���ĕԂ��B
"
function! s:URLEncode(instr)
  let len = strlen(a:instr)
  let i = 0
  let outstr = ''
  while i < len
    let ch = a:instr[i]
    if ch =~ '[-*.0-9A-Z_a-z]'
      let outstr = outstr . ch
    elseif ch == ' '
      let outstr = outstr . '+'
    else
      let outstr = outstr . '%' . substitute('0' . s:Nr2Hex(char2nr(ch)), '^.*\(..\)$', '\1', '')
    endif
    let i = i + 1
  endwhile
  return outstr
endfunction

"------------------------------------------------------------------------------
" BOOKMARK FUNCTIONS
" Bookmark���[�`��
"
let s:opened_bookmark = 0

"
" �X���ꗗ�̓��e���폜���A�u�b�N�}�[�N���t�@�C������ǂݍ��ݕ\������B
"
function! s:OpenBookmark()
  if s:opened_bookmark
    return
  endif
  call s:GoBuf_ThreadList()
  let s:opened_bookmark = line('.') ? line('.') : 1
  let b:title = s:label_bookmark
  " �x�f�[�^�̓Ǎ���
  call s:ClearBuffer()
  setlocal filetype=2ch_bookmark
  silent! execute "read " . g:chalice_bookmark
  silent! normal! gg"_dd
  redraw!
  call s:EchoH('WarningMsg', s:msg_warn_bookmark)
endfunction

"
" �u�b�N�}�[�N���t�@�C���ɕۑ����A�o�b�t�@����������B
"
function! s:CloseBookmark()
  if !s:opened_bookmark
    return
  endif
  let s:opened_bookmark = 0
  call s:GoBuf_ThreadList()
  silent! execute "%write! " . g:chalice_bookmark
  call s:ClearBuffer()

  " ft���Z�b�g�����u�ԂɕK�v�ȃo�b�t�@�ϐ�����������Ă��܂��̂ŁA���̑΍�B
  " ���������o�b�t�@�ϐ��� ftplugin/2ch_threadlist.vim �Q��:
  "	b:title, b:title_raw, b:host, b:board
  let title_raw = b:title_raw
  let host = b:host
  let board = b:board
  setlocal filetype=2ch_threadlist
  let b:title_raw = title_raw
  let b:host = host
  let b:board = board
endfunction

function! s:AddBookmark(title, url)
  let winnum = winnr()
  call s:OpenBookmark()
  call s:GoBuf_ThreadList()
  let url = a:url

  " 2�d�o�^��
  normal! gg
  let existedbookmark = search(a:url, 'w')
  normal! 0
  if existedbookmark
    echohl Question
    let last_confirm = input(s:msg_confirm_replacebookmark)
    echohl None
    if last_confirm =~ '^\cy'
      silent! execute ':' . existedbookmark . 'delete _'
    elseif last_confirm !~ '^\cn'
      " �o�^���L�����Z��
      let url = ''
    endif
  endif

  " URL���o�b�t�@�ɏ�����
  if url != ''
    call append(0, a:title . "\t\t\t\t" . url)
  endif

  execute "normal! " . winnum . "\<C-W>\<C-W>"
  if url == ''
    redraw!
    call s:EchoH('WarningMsg', s:msg_warn_bmkcancel)
  endif
endfunction

function! s:ToggleBookmark(flag)
  if !s:opened_bookmark
    call s:OpenBookmark()
  else
    let lnum = s:opened_bookmark
    call s:UpdateBoard('', '', '', 0)
    call s:GoBuf_ThreadList()
    execute "normal! " . lnum . "G0"
  endif
  if s:DoesFlagHaveTarget(a:flag, 'thread')
    call s:GoBuf_Thread()
  elseif s:DoesFlagHaveTarget(a:flag, 'threadlist')
    call s:GoBuf_ThreadList()
  endif
endfunction

function! s:Thread2Bookmark(target)
  if a:target =~ 'thread'
    " �X���b�h����x�ɓo�^
    call s:GoBuf_Thread()
    if b:host == '' || b:board == '' || b:dat == ''
      redraw!
      call s:EchoH('ErrorMsg', s:msg_error_addnothread)
      return
    endif
    let dat = substitute(b:dat, '\.dat$', '', '')
    if b:title_raw == ''
      let title = b:host . b:board . '/' . dat
    else
      let title = b:title_raw
    endif
  elseif a:target =~ 'threadlist'
    " �X���ꗗ����x�ɓo�^
    call s:GoBuf_ThreadList()
    let curline = getline('.')
    let mx = '^ \(.\+\) (\d\+)\s\+\(\d\+\)\.dat'
    if b:host == '' || b:board == '' || curline !~ mx
      redraw!
      call s:EchoH('ErrorMsg', s:msg_error_addnothreadlist)
      return
    endif
    let title = substitute(curline, mx, '\1', '')
    let dat = substitute(curline, mx, '\2', '')
  endif

  let url = 'http://' . b:host . '/test/read.cgi' . b:board . '/' . dat
  redraw!
  if 0
    echo "title=" . title . " url=" . url
  else
    call s:AddBookmark(title, url)
  endif
endfunction

"------------------------------------------------------------------------------
" WRITE BUFFER
" �������݃o�b�t�@���[�`��
"

let s:opened_writebuffer = 0

"
" �������ݗp�o�b�t�@���J��
"
function! s:OpenWriteBuffer(...)
  " �t���O�ɉ����ē����Asage�������ݒ�
  let newthread = 0
  let username = g:chalice_username
  let usermail = g:chalice_usermail
  if a:0 > 0
    if a:1 =~ 'anony'
      let username = g:chalice_anonyname
      let usermail = ''
    endif
    if a:1 =~ 'sage'
      let usermail = 'sage'
    endif
    if a:1 =~ 'new'
      let newthread = 1
    endif
  endif

  " �X���b�h�o�b�t�@���� host, board, dat ���擾
  if !newthread
    " �ʏ�̏�������
    call s:GoBuf_Thread()
    if b:host == '' || b:board == '' || b:dat == ''
      call s:EchoH('ErrorMsg', s:msg_error_appendnothread)
      return 0
    endif
    let title = b:title_raw
    let key = substitute(b:dat, '\.dat$', '', '')
  else
    " TODO �V�K��������
    call s:GoBuf_ThreadList()
    if b:host == '' || b:board == ''
      call s:EchoH('ErrorMsg', s:msg_error_creatnoboard)
      return 0
    endif
    let title = ''
    let key = localtime()
  endif
  let host = b:host
  let bbs = substitute(b:board, '^/', '', '')

  " �o�b�t�@�̍쐬
  call s:GoBuf_Write()
  if !newthread
    let b:title = s:prefix_write . title
  else
    let b:title = s:prefix_write . s:label_newthread
  endif
  let b:title_raw = title
  let b:host = host
  let b:bbs = bbs
  let b:key = key
  let b:newthread = newthread
  call s:ClearBuffer()

  redraw
  if 0
    " �f�o�b�O�\��
    let mes = ''
    let mes = mes . 'title=' . title . "\<CR>"
    let mes = mes . 'b:host=' . b:host . "\<CR>"
    let mes = mes . 'b:bbs=' . b:bbs . "\<CR>"
    let mes = mes . 'b:key=' . b:key . "\<CR>"
    execute "normal! i" . mes . "\<ESC>"
  else
    let def = ''
    let def = def . 'Title: ' . title . "\<CR>"
    let def = def . 'From: ' . username . "\<CR>"
    let def = def . 'Mail: ' . usermail . "\<CR>"
    let def = def . "--------\<CR>"
    execute "normal! i" . def . "\<ESC>"
  endif
  let s:opened_write = 1
  redraw!
  call s:EchoH('WarningMsg', s:msg_help_write)
  startinsert
endfunction

"
" ��������!!�B�������ݓ��e�����������`�F�b�N���Ă��珑�����݁B
"
function! s:DoWriteBuffer(flag)
  if !s:opened_write
    return 0
  endif
  call s:GoBuf_Write()
  let newthread = b:newthread
  " �������ݎ��s
  let write_result =  s:DoWriteBufferStub(a:flag)

  " �������݌�̃o�b�t�@����
  if s:DoesFlagHaveTarget(a:flag, '\cclosing')
    let s:opened_write = 0
  elseif write_result != 0
    let s:opened_write = 0
    call s:GoBuf_Write()
    execute ":close"
  endif

  if !s:opened_write
    if !newthread
      "call s:GoBuf_Thread()
      "normal! zb
    else
      " �V�X���쐬��(���݂͎g���Ȃ�)
      call s:GoBuf_ThreadList()
    endif
  endif
  return 1
endfunction

function! s:DoWriteBufferStub(flag)
  let force_close = s:DoesFlagHaveTarget(a:flag, '\cclosing')
  call s:GoBuf_Write()
  redraw!

  " �f�o�b�O�\��
  if 0
    echo 'b:title_raw=' . b:title_raw
    echo 'b:host=' . b:host
    echo 'b:bbs=' . b:bbs
    echo 'b:key=' . b:key
  endif

  " �������݃o�b�t�@�w�b�_�̑Ó�������
  let title = getline(1)
  let name = getline(2)
  let mail = getline(3)
  let sep = getline(4)
  " �f�o�b�O�\��
  if 0
    echo 'title=' . title
    echo 'name=' . name
    echo 'mail=' . mail
    echo 'sep=' . sep
  endif
  if title !~ '^Title:\s*' || name !~ '^From:\s*' || mail !~ '^Mail:\s*' || sep != '--------'
    call s:EchoH('ErrorMsg', s:msg_error_writebufhead)
    if force_close
      echohl MoreMsg
      call input(s:msg_prompt_pressenter)
      echohl None
    endif
    return 0
  endif
  let title = s:TrimSpace(substitute(title, '^Title:', '', ''))
  let name = s:TrimSpace(substitute(name, '^From:', '',''))
  let mail = s:TrimSpace(substitute(mail, '^Mail:', '',''))

  " �V�X���쐬���Ƀ^�C�g����ݒ肵�����m�F
  if b:newthread && title == ''
    call s:EchoH('ErrorMsg', s:msg_error_writetitle)
    if force_close
      echohl MoreMsg
      call input(s:msg_prompt_pressenter)
      echohl None
    endif
    return 0
  endif

  " �{���擪�̋󔒍s���폜
  normal! 5G
  while line('.') > 4
    if getline('.') !~ '^\s*$'
      break
    endif
    normal! "_dd
  endwhile

  " �{�������̋󔒍s���폜
  normal! G
  while line('.') > 4
    if getline('.') !~ '^\s*$'
      break
    endif
    normal! "_dd
  endwhile

  " �{�������邩���`�F�b�N
  if line('$') < 5
    call s:EchoH('ErrorMsg', s:msg_error_writebufbody)
    if force_close
      echohl MoreMsg
      call input(s:msg_prompt_pressenter)
      echohl None
    endif
    return 0
  endif

  " �{�����烁�b�Z�[�W���擾
  let message = getline(5)
  let curline = 6
  let lastline = line('$')
  while curline <= lastline
    let message = message . "\n" . getline(curline)
    let curline = curline + 1
  endwhile
  " ���p�X�y�[�X��&nbsp;�ɒu��
  let message = substitute(message, ' ', '\&nbsp;', 'g')

  if 0
    echo "RAW MESSAGE=".message
    echo "MESSAGE=" . s:URLEncode(message)
    call input('---PAUSE---')
  endif

  " (�K�v�Ȃ��)�����R�[�h��euc-jp����cp932�ɕϊ�
  if &encoding != s:encoding && has('iconv')
    let title = iconv(title, &encoding, s:encoding)
    let name = iconv(name, &encoding, s:encoding)
    let mail = iconv(mail, &encoding, s:encoding)
    let message = iconv(message, &encoding, s:encoding)
  endif

  " �������݃f�[�^�`�����N���쐬
  "   ���p���ׂ��f�[�^�ϐ�: name, mail, message, b:bbs, b:key, localtime()
  "   �Q�lURL: http://members.jcom.home.ne.jp/monazilla/document/write.html
  let chunk = ''
  if !b:newthread
    let chunk = chunk . 'submit=' . s:urlencoded_write
  else
    let chunk = chunk . 'subject=' . s:URLEncode(title)
    let chunk = chunk . '&submit=' . s:urlencoded_newwrite
  endif
  let chunk = chunk . '&FROM=' . s:URLEncode(name)
  let chunk = chunk . '&mail=' . s:URLEncode(mail)
  let chunk = chunk . '&MESSAGE=' . s:URLEncode(message)
  let chunk = chunk . '&bbs=' . b:bbs
  " �X���b�h�쐬�̎��̓O���j�b�W�b�������Ă���?
  if !b:newthread
    let chunk = chunk . '&key=' . b:key
    let chunk = chunk . '&time=' . localtime()
  else
    let chunk = chunk . '&time=' . b:key
  endif

  " �������ݑO�̍Ō�̊m�F
  echohl Question
  if force_close
    " �ʏ�̊m�F
    let last_confirm = input(s:msg_confirm_appendwrite_yn)
    echohl None
    if last_confirm !~ '^\cy'
      redraw!
      call s:EchoH('ErrorMsg', s:msg_error_writeabort)
      echohl MoreMsg
      call input(s:msg_prompt_pressenter)
      echohl None
      return -1
    endif
  else
    " �I�����ɃL�����Z��������m�F
    let last_confirm = input(s:msg_confirm_appendwrite_ync)
    echohl None
    if last_confirm =~ '^\cn'
      redraw!
      call s:EchoH('ErrorMsg', s:msg_error_writeabort)
      return -1
    elseif last_confirm !~ '^\cy'
      redraw!
      call s:EchoH('WarningMsg', s:msg_error_writecancel)
      return 0
    endif
  endif

  let tmpfile = tempname()
  redraw!
  execute "redir! > " . tmpfile 
  silent echo chunk
  redir END
  " �������݃R�}���h�̔��s
  "   �K�v�ȃf�[�^�ϐ�: tmpflie, b:host, b:bbs
  redraw!
  " �N���I�v�V�����̍\�z��cURL�̎��s
  let fq = s:GetFileQuote()
  let opts = g:chalice_curl_options
  if s:user_agent_enable
    let opts = opts . ' -A ' .fq. s:user_agent .fq
  endif
  let opts = opts . ' -b NAME= -b MAIL='
  let opts = opts . ' -d @' . fq .tmpfile . fq
  let opts = opts . ' -e http://' . b:host . '/' . b:bbs . '/index2.html'
  let opts = opts . ' http://' . b:host . '/test/bbs.cgi'
  call s:DoExternalCommand(s:cmd_curl . ' ' . opts)
  " ��n��
  call delete(tmpfile)
  if !b:newthread
    call s:UpdateThread('', '', '', '', 'continue,force')
  else
    call s:UpdateThread(title,  b:host , '/' . b:bbs, b:key . '.dat', '')
  endif
  return 1
endfunction

"------------------------------------------------------------------------------
" FILENAMES
" �t�@�C�����̐���

function! s:GenerateLocalDat(host, board, dat)
  return s:dir_cache . 'dat_' . a:host . substitute(a:board, '/', '_', 'g') . '_' . substitute(a:dat, '\.dat$', '', '')
endfunction

function! s:GenerateLocalSubject(host, board)
  return s:dir_cache . 'subject_' . a:host . substitute(a:board, '/', '_', 'g')
endfunction

"------------------------------------------------------------------------------
" FORMATTING
" �e�y�C���̐��`

"
" endline��0���w�肷��ƃo�b�t�@�̍Ō�B
"
function! s:FormatThreadInfo(startline, endline)
  call s:GoBuf_ThreadList()
  " �o�b�t�@���X���ꗗ�ł͂Ȃ������ꍇ�A���I��
  if b:host == '' || b:board == ''
    return
  endif

  let i = a:startline
  let lastline = a:endline ? a:endline : line('$')
  if s:debug | let @a = 'i='.i.' lastline='.lastline | endif

  " �e�X����dat�t�@�C�������݂��邩�`�F�b�N���A���݂���ꍇ�ɂ͍ŏI�擾����
  " ���`�F�b�N���A����ɂ���ċ����̎d����ς���B
  " 1. dat�����݂��ߋ�chalice_threadinfo_expire���ɍX�V ��!���s����
  " 2. dat�����݂��ߋ�chalice_threadinfo_expire�O�ɍX�V ��+���s����
  while i <= lastline
    let curline = getline(i)
    if curline =~ s:mx_thread_dat
      let dat = substitute(curline, s:mx_thread_dat, '\3', '')
      let local = s:GenerateLocalDat(b:host, b:board, dat)
      " �t�@�C�������݂���Ȃ�΃t�@�C�������擾
      if filereadable(local)
	let lasttime = getftime(local)
	let indicator = localtime() - lasttime > g:chalice_threadinfo_expire ? '+' : '!'
	let time = strftime("%Y/%m/%d %H:%M:%S", lasttime)
      else
	let indicator = ' '
	let time = ''
      endif
      " �^�C�g���Ə������ݐ����擾
      let title = substitute(curline, s:mx_thread_dat, '\1', '')
      let point = substitute(curline, s:mx_thread_dat, '\2', '')
      " ���C���̓��e���ω����Ă�����ݒ�
      let newline = indicator . ' ' . title . ' (' . point . ') ' . time . "\t\t\t\t" . dat
      if curline !=# newline
	call setline(i, newline)
      endif
    endif
    let i = i + 1
  endwhile
endfunction

function! s:FormatBoard()
  " �X���f�[�^(.dat)�ł͂Ȃ��s���폜
  silent! execute '%g!/^\d\+\.dat/delete _'
  " .dat�����B��
  silent! execute '%s/^\(\d\+\.dat\)<>\(.*\)$/  \2\t\t\t\t\1'
  " ���ꕶ���ׂ�
  silent! execute '%s/&amp;/\&/g'
  silent! execute '%s/&gt;/>/g'
  silent! execute '%s/&lt;/</g'

  if g:chalice_threadinfo
    call s:FormatThreadInfo(1, 0)
  endif
endfunction

function! s:FormatThread()
  " �҂��Ăˁ����b�Z�[�W
  call s:EchoH('WarningMsg', s:msg_wait_threadformat)
  let max = 7
  if g:chalice_verbose > 0 | call s:EchoH('WarningMsg', '0/'.max) | endif

  " �e�������݂ɔԍ���U��
  let i = 1
  let endline = line('$')
  while i <= endline
    call setline(i, i . '<>' . getline(i))
    let i = i + 1
  endwhile
  if g:chalice_verbose > 0 | call s:EchoH('WarningMsg', '1/'.max."\n") | endif

  " �������ݎ����̐؂蕪��
  "   �X����dat�̃t�H�[�}�b�g�́A���O�ɍs���ɍs(�L��)�ԍ���t���Ă���̂�:
  "	�ԍ�<>���O<>���[��<>����<>�{��<>�X����
  "   �ƂȂ�B�X�����͐擪�̂�
  if 1
    " \{-}�̎g�p�ł��Ȃ葬���Ȃ��Ă���Ǝv���邪�c���t�@�����X�R�[�h���c��
    let m1 = '\s*\(.\{-}\)\s*<>' " \{-}�͍ŒZ�}�b�`
    let mx = '^' .m1.m1.m1.m1.m1. '\s*\(.*\)$'
  else
    " �x�����X�^�b�N�G���[�ł͗����Ȃ�
    let mx = '^\(\d\+\)<>\(.*\)<>\(.*\)<>\(.*\)<>\(.*\)<>\(.*\)$'
  endif
  let out = '\r--------\r\1  From:\2  Date:\4  Mail:\3\r  \5'
  "silent! execute '%s/\s*<>\s*/<>/g'
  if g:chalice_verbose > 0 | call s:EchoH('WarningMsg', '2/'.max."\n") | endif
  silent! execute '%s/' . mx . '/' . out
  if g:chalice_verbose > 0 | call s:EchoH('WarningMsg', '3/'.max."\n") | endif
  " �{���̉��s����
  silent! execute '%s/\s*<br>\s*/\r  /g'
  if g:chalice_verbose > 0 | call s:EchoH('WarningMsg', '4/'.max."\n") | endif

  " <A>�^�O����
  silent! execute '%s/<\/\?a[^>]*>//g'
  if g:chalice_verbose > 0 | call s:EchoH('WarningMsg', '5/'.max."\n") | endif
  " �l�L���b�v��<b>�^�O����
  silent! execute '%s/\s*<\/\?b>//g'
  if g:chalice_verbose > 0 | call s:EchoH('WarningMsg', '6/'.max."\n") | endif
  " ���ꕶ���ׂ�
  silent! execute '%s/&gt;/>/g'
  silent! execute '%s/&lt;/</g'
  silent! execute '%s/&quot;/"/g'
  silent! execute '%s/&nbsp;/ /g'
  silent! execute '%s/&amp;/\&/g'
  if g:chalice_verbose > 0 | call s:EchoH('WarningMsg', '7/'.max."\n") | endif

  " �S�~�s����
  normal! gg"_dd
endfunction

"------------------------------------------------------------------------------
" COMMAND REGISTER
" �R�}���h�o�^���[�`��
"   ���I�ɓo�^�\�ȃR�}���h�͓��I�ɓo�^����
"

function! s:CommandRegister()
  command! ChaliceQuit			call <SID>ChaliceClose('')
  command! ChaliceQuitAll		call <SID>ChaliceClose('all')
  command! ChaliceGoBoardList		call <SID>GoBuf_BoardList()
  command! ChaliceGoThreadList		call <SID>GoBuf_ThreadList()
  command! ChaliceGoThread		call <SID>GoBuf_Thread()
  command! -nargs=1 ChaliceGoArticle	call <SID>GoThread_Article(<q-args>)
  command! -nargs=? ChaliceOpenBoard	call <SID>OpenBoard(<f-args>)
  command! -nargs=? ChaliceOpenThread	call <SID>OpenThread(<f-args>)
  command! ChaliceHandleJump		call <SID>HandleJump('internal')
  command! ChaliceHandleJumpExt		call <SID>HandleJump('external')
  command! ChaliceReloadBoardList	call <SID>UpdateBoardList(1)
  command! ChaliceReloadThreadList	call <SID>UpdateBoard('', '', '', 1)
  command! ChaliceReloadThread		call <SID>UpdateThread('', '', '', '', 'force')
  command! ChaliceReloadThreadInc	call <SID>UpdateThread('', '', '', '', 'continue,force')
  command! ChaliceDoWrite		call <SID>DoWriteBuffer('')
  command! -nargs=? ChaliceWrite	call <SID>OpenWriteBuffer(<f-args>)
  command! -nargs=1 ChaliceHandleURL	call <SID>HandleURL(<q-args>, 'internal')
  command! -nargs=1 ChaliceBookmarkToggle	call <SID>ToggleBookmark(<q-args>)
  command! -nargs=1 ChaliceBookmarkAdd	call <SID>Thread2Bookmark(<q-args>)
  command! ChaliceJumplist		call <SID>JumplistDump()
  command! ChaliceJumplistNext		call <SID>DoHistoryJump('next')
  command! ChaliceJumplistPrev		call <SID>DoHistoryJump('prev')
  command! ChaliceDeleteThreadDat	call <SID>DeleteThreadDat()
endfunction

function! s:CommandUnregister()
  delcommand ChaliceQuit
  delcommand ChaliceQuitAll
  delcommand ChaliceGoBoardList
  delcommand ChaliceGoThreadList
  delcommand ChaliceGoThread
  delcommand ChaliceGoArticle
  delcommand ChaliceOpenBoard
  delcommand ChaliceOpenThread
  delcommand ChaliceHandleJump
  delcommand ChaliceHandleJumpExt
  delcommand ChaliceReloadBoardList
  delcommand ChaliceReloadThreadList
  delcommand ChaliceReloadThread
  delcommand ChaliceReloadThreadInc
  delcommand ChaliceWrite
  delcommand ChaliceHandleURL
  delcommand ChaliceBookmarkToggle
  delcommand ChaliceBookmarkAdd
  delcommand ChaliceJumplist
  delcommand ChaliceJumplistNext
  delcommand ChaliceJumplistPrev
  delcommand ChaliceDeleteThreadDat
endfunction
