" vim:set ts=8 sts=2 sw=2 tw=0 nowrap:
"
" chalice.vim - 2ch viewer 'Chalice' /
"
" Last Change: 07-May-2002.
" Written By:  MURAOKA Taro <koron@tka.att.ne.jp>

scriptencoding cp932
let s:version = '1.3'

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

" �X���N�x
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

" �O���u���E�U�̎w��
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

if !exists('g:chalice_menu_url')
  let g:chalice_menu_url = ''
endif

" PROXY�Ƃ�����������Ɨǂ�����
if !exists('g:chalice_curl_options')
  let g:chalice_curl_options= ''
endif

" Cookie�g��?
if !exists('g:chalice_curl_cookies')
  let g:chalice_curl_cookies = 1
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

if !exists('g:chalice_foldmarks')
  let g:chalice_foldmarks = ''
endif

" �X�e�[�^�X���C���ɍ��ڂ�ǉ����邽�߂̕ϐ�
if !exists('g:chalice_statusline')
  let g:chalice_statusline = ''
endif

" (��0�̎�)'q'�ɂ��Chalice�I�����Ɉӎv�m�F�����Ȃ�
if !exists('g:chalice_noquery_quit')
  let g:chalice_noquery_quit = 1
endif

" (��0�̎�)�J�L�R���s�̈ӎv�m�F�����Ȃ�
if !exists('g:chalice_noquery_write')
  let g:chalice_noquery_write = 0
endif

" �N�����̏�Ԃ�ݒ肷��(bookmark,offline)
if !exists('g:chalice_startupflags')
  let g:chalice_startupflags = ''
endif

" redraw! �ɂ��ĕ`���}������(�x���[������)
if !exists('g:chalice_noredraw')
  let g:chalice_noredraw = 0
endif

if !exists('g:chalice_writeoptions')
  let g:chalice_writeoptions = 'amp,nbsp'
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
let s:label_newthread = '[�V�X��]'
let s:label_bookmark = '  �X���̞x'
let s:label_offlinemode = '�I�t���C�����[�h'
" ���b�Z�[�W
let s:msg_confirm_appendwrite_yn = '�o�b�t�@�̓��e���������݉\�ł�. �������݂܂���?(yes/no): '
let s:msg_confirm_appendwrite_ync = '�{���ɏ������݂܂���?(yes/no/cancel): '
let s:msg_confirm_replacebookmark = '�K�C�V���cURL�ł�. �u�������܂���?(yes/no/cancel): '
let s:msg_confirm_quit = '�{����Chalice���I�����܂���?(yes/no): '
let s:msg_prompt_pressenter = '������ɂ� Enter �������Ă�������.'
let s:msg_warn_netline_on = '�I�t���C�����[�h���������܂���'
let s:msg_warn_netline_off = '�I�t���C�����[�h�ɐؑւ��܂���'
let s:msg_warn_oldthreadlist = '�X���ꗗ���Â��\��������܂�. R �ōX�V���܂�.'
let s:msg_warn_bookmark = '�x�͕��鎞�Ɏ����I�ɕۑ�����܂�.'
let s:msg_warn_bmkcancel = '�x�ւ̓o�^�̓L�����Z������܂���.'
let s:msg_wait_threadformat = '�M�l��!! �X���b�h���`���̂��߁A���΂炭���҂���������...'
let s:msg_wait_download = '�_�E�����[�h��...'
let s:msg_error_nocurl = 'Chalice�ɂ͐������C���X�g�[�����ꂽcURL���K�v�ł�.'
let s:msg_error_nogzip = 'Chalice�ɂ͐������C���X�g�[�����ꂽgzip���K�v�ł�.'
let s:msg_error_noconv = 'Chalice���CP932���ŗ��p����ɂ� qkc �������� nkf ���K�v�ł�.'
let s:msg_error_cantjump = '�J�[�\���̍s�ɃA���J�[�͂���܂���. �T��'
let s:msg_error_appendnothread = '�S���@!! �X���b�h���Ȃ�YO!!'
let s:msg_error_creatnoboard = '���w�肵�Ȃ��ƕ��X������������܂���'
let s:msg_error_writebufhead = '�������݃o�b�t�@�̃w�b�_���s���ł�.'
let s:msg_error_writebufbody = '�������݃��b�Z�[�W����ł�.'
let s:msg_error_writeabort = '�������݂𒆎~���܂���.'
let s:msg_error_writecancel = '�������݂��L�����Z�����܂�.'
let s:msg_error_writetitle = '�V�X���ɂ̓^�C�g�����K�v�ł�.'
let s:msg_error_addnoboardlist = '�ꗗ����x�֓o�^�o���܂���.'
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
let s:debug = 0

" 2ch�F�؂̂��߂̕z��
let s:user_agent = 'Monazilla/1.00 Chalice/' . s:version
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
" �X�N���v�g�̃f�B���N�g�����擾
let s:scriptdir = expand('<sfile>:p:h')

" �N���t���O
let s:opened = 0
let s:opened_write = 0
let s:dont_download = 0

" �O���R�}���h���s�t�@�C����
let s:cmd_curl = ''
let s:cmd_conv = ''
let s:cmd_gzip = ''

" MATCH PATTERNS
let s:mx_thread_dat = '^[ !+] \(.\+\) (\(\d\+\)).*\t\+\(\d\+\%(_\d\+\)\?\.\%(dat\|cgi\)\)'

" �R�}���h�̐ݒ�
command! Chalice			call <SID>ChaliceOpen()

" �I�[�g�R�}���h�̐ݒ�
augroup Chalice
autocmd!
execute "autocmd BufDelete " . s:buftitle_write . " call <SID>DoWriteBuffer('closing')"
execute "autocmd BufEnter " . s:buftitle_boardlist . " call s:Redraw('force')|call s:EchoH('WarningMsg',s:msg_help_boardlist)|normal! 0"
execute "autocmd BufEnter " . s:buftitle_threadlist . " call s:Redraw('force')|call s:EchoH('WarningMsg',s:opened_bookmark?s:msg_help_bookmark : s:msg_help_threadlist)"
execute "autocmd BufEnter " . s:buftitle_thread . " call s:Redraw('force')|call s:EchoH('WarningMsg',s:msg_help_thread)"
execute "autocmd BufEnter " . s:buftitle_write . " let &undolevels=s:undolevels|call s:EchoH('WarningMsg', s:msg_help_write)"
execute "autocmd BufLeave " . s:buftitle_write . " set undolevels=0"
execute "autocmd BufDelete " . s:buftitle_threadlist . " if s:opened_bookmark|call s:CloseBookmark()|endif"
augroup END

"------------------------------------------------------------------------------
" GLOBAL FUNCTIONS
" �O���[�o���֐�

function! Chalice_foldmark(id)
  if a:id == 0
    return s:foldmark_0
  elseif a:id == 1
    return s:foldmark_1
endfunction

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
  if a:url !~ '\(https\?\|ftp\)://[-!#%&+,./0-9:;=?@A-Za-z_~]\+' " URLPAT
    return 0
  endif
  if AL_hasflag(a:flag, '\cexternal')
    " �����I�ɊO���u���E�U���g�p����悤�Ɏw�肳�ꂽ
    call s:OpenURL(a:url)
  elseif !s:Parse2chURL(a:url)
    " URL��2ch�ł͂Ȃ���
    call s:GoBuf_BoardList()
    if search(a:url) != 0
      normal! zO0z.
      execute maparg("<CR>")
    else
      call s:GoBuf_Thread()
      call s:OpenURL(a:url)
    endif
  else
    if !AL_hasflag(a:flag, '\cnoaddhist')
      call s:AddHistoryJump(s:ScreenLine(), line('.'))
    endif

    " URL��2ch�Ɣ��f����鎞
    "	s:parse2ch_host, s:parse2ch_board, s:parse2ch_dat��Parse2chURL()����
    "	�ݒ肳���ÖٓI�Ȗ߂�l�B
    let curarticle = s:UpdateThread('', s:parse2ch_host, s:parse2ch_board, s:parse2ch_dat . '.dat', 'continue')

    if s:parse2ch_range_mode =~ 'r'
      if s:parse2ch_range_mode !~ 'l'
	" �񃊃X�g���[�h
	" �\���͈͌��folding
	if s:parse2ch_range_end != '$'
	  let fold_start = s:GetLnum_Article(s:parse2ch_range_end + 1)  - 1
	  call AL_execute(fold_start . ',$fold')
	endif
	" �\���͈͑O��folding
	if s:parse2ch_range_start > 1
	  let fold_start = s:GetLnum_Article(s:parse2ch_range_mode =~ 'n' ? 1 : 2) - 1
	  let fold_end = s:GetLnum_Article(s:parse2ch_range_start) - 2
	  call AL_execute(fold_start . ',' . fold_end . 'fold')
	endif
	call s:GoThread_Article(s:parse2ch_range_start)
      else
	" ���X�g���[�h('l')
	let fold_start = s:GetLnum_Article(s:parse2ch_range_mode =~ 'n' ? 1 : 2) - 1
	let fold_end = s:GetLnum_Article(s:GetThreadLastNumber() - s:parse2ch_range_start + (s:parse2ch_range_mode =~ 'n' ? 1 : 2)) - 2
	if fold_start < fold_end
	  call AL_execute(fold_start . ',' . fold_end . 'fold')
	endif
	if !s:GoThread_Article(curarticle)
	  normal! Gzb
	endif
      endif
    endif

    if !AL_hasflag(a:flag, '\cnoaddhist')
      call s:AddHistoryJump(s:ScreenLine(), line('.'))
    endif
  endif
  return 1
endfunction

function! s:GetThreadLastNumber()
  return getbufvar(s:buftitle_thread, 'chalice_lastnum')
endfunction

"
" URL���O���u���E�U�ɊJ������
"
function! s:OpenURL(url)
  let retval = AL_open_url(a:url, g:chalice_exbrowser)
  call s:Redraw('force')
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
  let mx2 = '\(\(h\?ttps\?\|ftp\)://[-!#%&+,./0-9:;=?@A-Za-z_~]\+\)' " URLPAT
  let mx3 = 'www[-!#%&+,./0-9:;=?@A-Za-z_~]\+'

  " �J�[�\�����̃����N��T���o���B�Ȃ���Ό���փT�[�`
  let context = expand('<cword>')
  if context !~ mx1 && context !~ mx2
    let context = strpart(getline('.'), col('.') - 1)
  endif

  if context =~ mx1
    " �X���̋L���ԍ��������ꍇ
    let num = substitute(matchstr(context, mx1), mx1, '\2', '')
    if AL_hasflag(a:flag, '\cinternal')
      let oldsc = s:ScreenLine()
      let oldcur = line('.')
      let lnum = s:GoThread_Article(num)
      if lnum > 0
	call AL_execute(lnum . "foldopen!")
	" �Q�ƌ����q�X�g���ɓ����
	call s:AddHistoryJump(oldsc, oldcur)
	" �Q�Ɛ���q�X�g���ɓ����
	call s:AddHistoryJump(s:ScreenLine(), line('.'))
      endif
    elseif AL_hasflag(a:flag, '\cexternal')
      if b:host != '' && b:board != '' && b:dat != ''
	let num = substitute(matchstr(context, mx1), mx1, '\1', '')
	call s:OpenURL('http://' . b:host . '/test/read.cgi' . b:board . '/' . substitute(b:dat, '\.dat$', '', '') . '/' . num . 'n')
      endif
    endif
  elseif context =~ mx2
    let url = substitute(matchstr(context, mx2), '^ttp', 'http', '')
    return s:HandleURL(url, a:flag)
  elseif context =~ mx3 " http:// ����URL�̏���
    let url = 'http://' . matchstr(context, mx3)
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
  if !filereadable(local) || !AL_hasflag(a:flag, '\cnoforce')
    " �t�@�C���̌��̃T�C�Y���o���Ă���
    if filereadable(local)
      let prevsize = getfsize(local)
    endif
    call s:HttpDownload(b:host, remote, local, a:flag)
    " (�K�v�Ȃ��)�X���ꗗ�̃X�������X�V
    if g:chalice_threadinfo
      call s:GoBuf_ThreadList()
      if b:host . b:board ==# a:host . a:board
	if a:dat != '' && search(a:dat, 'w')
	  call s:FormatThreadInfo(line('.'), line('.'))
	endif
      endif
      call s:GoBuf_Thread()
    endif
  endif

  " �X���b�h���o�b�t�@�Ƀ��[�h���Đ��`
  call AL_buffer_clear()
  call AL_execute("read " . local)
  let b:datutil_datsize = getfsize(local)
  normal! gg"_dd
  if prevsize > 0
    call AL_execute('normal! ' . prevsize . 'go')
    let newarticle = line('.') + 1
  else
    let newarticle = 1
  endif

  " ���`
  let title = s:FormatThread()
  " ���dat���̃^�C�g�����g�p����
  let b:title = s:prefix_thread . title
  let b:title_raw = title

  if !s:GoThread_Article(newarticle)
    normal! Gzb
  endif
  call s:Redraw('force')
  call s:EchoH('WarningMsg', s:msg_help_thread)
  return newarticle
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

    let res_gz = -1
    let reg_ng = -1
    if 0
      " �V�d�lsubject.txt.gz�ɑΉ��B�\�Ȃ�܂�subject.txt.gz���g���C�B
      " ������AcceptEncoding:gzip���w�肷��Ύg��Ȃ��Ă��ǂ����Ƃ�����
      let local_gz = local . '.gz'
      let res_gz = s:HttpDownload(b:host, remote.'.gz', local_gz, '')
      if res_gz == 200 && filereadable(local_gz)
	call s:DoExternalCommand(s:cmd_gzip . ' -d -f ' . AL_quote(local_gz))
	if !filereadable(local)
	  let reg_ng = s:HttpDownload(b:host, remote, local, '')
	endif
      else
	let reg_ng = s:HttpDownload(b:host, remote, local, '')
      endif
    else
      let reg_ng = s:HttpDownload(b:host, remote, local, '')
    endif
    " subject.txt.gz��subject.txt�̎g�p�󋵂����|�[�g
    if s:debug
      let @a = 'http://'.b:host.b:board . '/ -> subject.txt.gz:'.res_gz.' subject.txt:'.reg_ng
    endif

    let updated = 1
  endif

  " �X���ꗗ���o�b�t�@�Ƀ��[�h���Đ��`
  call AL_buffer_clear()
  call AL_execute("read " . local)
  call AL_execute("g/^$/delete _") " ��s���폜

  " ���`
  call s:FormatBoard()

  " �擪�s�ֈړ�
  silent! normal! gg0

  if !updated
    call s:Redraw('force')
    call s:EchoH('WarningMsg', s:msg_warn_oldthreadlist)
  endif
endfunction

"------------------------------------------------------------------------------
" �b��I�Ɍł܂����֐��Q 
" FIXED FUNCTIONS

function! s:Redraw(opts)
  if g:chalice_noredraw
    return
  endif
  let cmd = 'redraw'
  if AL_hasflag(a:opts, 'force')
    let cmd = cmd . '!'
  endif
  if AL_hasflag(a:opts, 'silent')
    let cmd = 'silent! ' . cmd
  endif
  execute cmd
endfunction

" �X�N���[���ɕ\������Ă���擪�̍s�ԍ����擾����
function! s:ScreenLine()
  let wline = winline() - 1
  silent! normal! H
  let retval = line('.')
  while wline > 0
    call AL_execute('normal! gj')
    let wline = wline - 1
  endwhile
  return retval
endfunction

function! s:ScreenLineJump(scline, curline)
  " ��̂̈ʒu�܂ŃW�����v
  let curline = a:curline > 0 ? a:curline - 1 : 0
  call AL_execute('normal! ' . (a:scline + curline) . 'G')
  " �ړI�ʒu�Ƃ̍����v��
  let offset = a:scline - s:ScreenLine()
  if offset < 0
    call AL_execute('normal! ' . (-offset) . "\<C-Y>")
  elseif offset > 0
    call AL_execute('normal! ' . offset . "\<C-E>")
  endif
  " �X�N���[�����ł̃J�[�\���ʒu��ݒ肷��
  call AL_execute('normal! H')
  while curline > 0
    call AL_execute('normal! gj')
    let curline = curline - 1
  endwhile
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
  if !s:opened
    return
  endif
  " ������o�b�t�@����Ώ����`�����X��p�ӂ���
  if s:opened_write
    call s:DoWriteBuffer('closing,quit')
  endif
  " �K�v�Ȃ�ΏI���̈ӎv���m�F����
  if !g:chalice_noquery_quit && !AL_hasflag(a:flag, 'all')
    echohl Question
    let last_confirm = input(s:msg_confirm_quit)
    echohl None
    if last_confirm !~ '^\cy'
      return
    endif
  endif

  silent! call s:CommandUnregister()
  " �u�b�N�}�[�N���J����Ă����ꍇ���邱�Ƃŕۑ�����
  if s:opened_bookmark
    call s:CloseBookmark()
  endif
  if AL_hasflag(a:flag, 'all')
    execute "qall!"
  endif
  let s:opened = 0

  " �ύX�����O���[�o���I�v�V�����̕��A
  let &charconvert = s:charconvert
  if g:chalice_columns > 0
    let &columns = s:columns
  endif
  let &equalalways = s:equalalways
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

  " Chalice�֘A�̃o�b�t�@���Ă�wipeout����B TODO:�o�b�t�@��ԍ��ŊǗ�
  "call AL_execute("bwipeout " . s:buftitle_boardlist)
  "call AL_execute("bwipeout " . s:buftitle_threadlist)
  "call AL_execute("bwipeout " . s:buftitle_thread)
  call AL_execute("bwipeout " . s:buftitle_write)
  silent! new
  silent! only!
  call s:Redraw('silent')

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
      let s:cmd_curl = AL_quote(s:cmd_curl)
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
  else
    call s:EchoH('ErrorMsg', s:msg_error_nogzip)
    return 0
  endif

  " �ޔ����Ă�����'wildignore'�𕜋A
  let &wildignore = wildignore

  " �f�B���N�g�����\�z
  if exists('g:chalice_cachedir') && isdirectory(g:chalice_cachedir)
    let s:dir_cache = substitute(g:chalice_cachedir, '[^\/]$', '&/', '')
  else
    let s:dir_cache = g:chalice_basedir . '/cache/'
  endif
  " cookie�t�@�C���ݒ�
  if !exists('g:chalice_cookies')
    let g:chalice_cookies = s:dir_cache . 'cookie'
  endif
  " �u�b�N�}�[�N���\�z
  if g:chalice_bookmark == ''
    let g:chalice_bookmark = g:chalice_basedir . '/chalice.bmk'
  endif

  " �L���b�V���f�B���N�g���̕ۏ�
  if !isdirectory(s:dir_cache)
    call AL_mkdir(s:dir_cache)
    if !isdirectory(s:dir_cache)
      call s:Redraw('force')
      call s:EchoH('ErrorMsg', s:msg_error_nocachedir)
      return 0
    endif
  endif

  return 1
endfunction

"
" Chalice�w���v���C���X�g�[��
"
function! s:HelpInstall(scriptdir)
  let basedir = substitute(a:scriptdir, 'plugin$', 'doc', '')
  if has('unix')
    let docdir = $HOME . '/.vim/doc'
    if !isdirectory(docdir)
      call system('mkdir -p ' . docdir)
    endif
  else
    let docdir = basedir
  endif
  let helporig = basedir . '/chalice.txt.cp932'
  let helpfile = docdir . '/chalice.txt'
  let tagsfile = docdir . '/tags'

  " ���̊֐���plugin�̓ǂݍ��ݎ��Ɏ��s�����̂�AL_*���g���Ȃ�

  " �����R�[�h�̃R���o�[�g
  if !filereadable(helpfile) || (filereadable(helporig) && getftime(helporig) > getftime(helpfile))
    silent execute "sview " . helporig
    set fileencoding=japan fileformat=unix
    silent execute "write! " . helpfile
    bwipeout!
  endif

  " tags�̍X�V
  if !filereadable(tagsfile) || getftime(helpfile) > getftime(tagsfile)
    silent execute "helptags " . docdir
  endif
endfunction
silent! call s:HelpInstall(s:scriptdir)

"
" Chalice�J�n
"
function! s:ChaliceOpen()
  if s:opened
    return
  endif

  " ������̃`�F�b�N
  if !s:CheckEnvironment()
    return
  endif

  " (�K�v�Ȃ��)�w���v�t�@�C�����C���X�g�[������
  silent! call s:HelpInstall(s:scriptdir)

  " �ύX����O���[�o���I�v�V�����̕ۑ�
  let s:opened = 1
  let s:charconvert = &charconvert
  let s:columns = &columns
  let s:equalalways = &equalalways
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
  set noequalalways
  set foldcolumn=0
  set ignorecase
  set lazyredraw
  set wrapscan
  set winheight=8
  set winwidth=15
  set scrolloff=0
  let &statusline = '%<%{' . s:sid . 'GetBufferTitle()}%='.g:chalice_statusline.'%l/%L'
  " let &titlestring = s:label_vimtitle " UpdateTitleString()�Q��
  set undolevels=0

  " foldmarks�̏�����
  let mx = '^\(.\)\(.\)$'
  let foldmarks = '����'
  if exists('g:chalice_foldmarks') && g:chalice_foldmarks =~ mx
    let foldmarks = g:chalice_foldmarks
  endif
  let s:foldmark_0 = substitute(foldmarks, mx, '\1', '')
  let s:foldmark_1 = substitute(foldmarks, mx, '\2', '')

  " �N���ŏI����
  call s:CommandRegister()
  call s:OpenAllChaliceBuffers()
  " �I�t���C�����[�h�p�t���O
  let s:dont_download = AL_hasflag(g:chalice_startupflags, 'offline') ? 1 : 0
  call s:UpdateBoardList(0)
  if AL_hasflag(g:chalice_startupflags, 'bookmark')
    silent! call s:OpenBookmark()
  endif
  call s:UpdateTitleString()

  " �J�n���b�Z�[�W�\��
  call s:Redraw('silent')
  call s:EchoH('WarningMsg', s:msg_chalice_start)
endfunction

" �^�C�g���������ݒ肷��B���݂�Chalice�̏�Ԃɉ�����������ɂȂ�B
function! s:UpdateTitleString()
  let str = s:label_vimtitle
  if s:dont_download
    let str = str . ' ' . s:label_offlinemode
  endif
  let &titlestring = str
endfunction

function! s:ToggleNetlineState()
  let s:dont_download = s:dont_download ? 0 : 1
  " �I�t���C�����[�h�\��
  call s:UpdateTitleString()
  call s:EchoH('WarningMsg', s:dont_download ? s:msg_warn_netline_off : s:msg_warn_netline_on)
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
    call AL_execute(':!' . extcmd)
  else
    execute ':!' . extcmd
  endif
endfunction

"
" ���݂̃J�[�\���s�̃X���b�h���J��
"
function! s:OpenThread(...)
  let flag = (a:0 > 0) ? a:1 : 'internal'
  if AL_hasflag(flag, 'firstline')
    " �O���u���E�U�ɂ�firstline���Ƃ���������Ȃ��Ƃ����T�O���Ȃ�����A
    " firstline�w�莞�͈Â�internal�Ƃ��Ĉ����ėǂ��B
    let flag = flag . ',internal'
  endif

  let curline = getline('.')
  let mx2 = '\(http://[-!#%&+,./0-9:;=?@A-Za-z_~]\+\)' " URLPAT

  if curline =~ s:mx_thread_dat
    let host = b:host
    let board = b:board
    let title = substitute(curline, s:mx_thread_dat, '\1', '')
    let dat = substitute(curline, s:mx_thread_dat, '\3', '')
    let url = 'http://' . host . '/test/read.cgi' . board . '/'. substitute(dat, '\.dat$', '', '')
    if !AL_hasflag(flag, 'internal')
      let url = url . '/l50'
    endif
  elseif curline =~ mx2
    let url = matchstr(curline, mx2)
  else
    " fold�̊J���g�O��
    silent! normal! 0za
    return
  endif

  " URL�͒��o�ł�����[��]������ꍇ
  if AL_hasflag(flag, 'bookmark') && curline =~ '^\s*\[��\]'
    return s:OpenBoard()
  endif

  call s:HandleURL(url, flag . ',noaddhist')
  if AL_hasflag(flag, 'firstline')
    normal! gg
  endif
  call s:AddHistoryJump(s:ScreenLine(), line('.'))
endfunction

"
" ���݂̃J�[�\���s�ɂ���URL��Ƃ��ĊJ��
"
function! s:OpenBoard(...)
  let board = AL_chomp(getline('.'))
  let mx = '^\(.\{-\}\)\s\+http://\(..\{-\}\)\(/[^/]\+\)/$'
  if board !~ mx
    " fold�̊J���g�O��
    normal! 0za
    return
  endif

  let title = substitute(substitute(board, mx, '\1', ''), '^\s*\([��]\)\?\s*', '', '')
  let host  = substitute(board, mx, '\2', '')
  let board = substitute(substitute(board, mx, '\3', ''), '/$', '', '')
  " �f�o�b�O���b�Z�[�W�쐬
  let mes = ''
  let mes = mes . "title=" . title . " host=" . host . " board=" . board

  if a:0 > 0 && AL_hasflag(a:1, 'external')
    return s:OpenURL('http://' . host . board . '/')
  endif
  call s:UpdateBoard(title, host, board, 0)
endfunction

"
" �^����ꂽURL��2ch���ǂ������f����!!
"
function! s:Parse2chURL(url)
  let mx = '^http://\(..\{-\}\)/test/read.cgi\(/[^/]\+\)/\(\d\+\%(_\d\+\)\?\)\(.*\)'
  if a:url !~ mx
    return 0
  endif
  let s:parse2ch_host = substitute(a:url, mx, '\1', '')
  let s:parse2ch_board = substitute(a:url, mx, '\2', '')
  let s:parse2ch_dat = substitute(a:url, mx, '\3', '')

  " �\���͈͂�����
  " �Q�l����: http://pc.2ch.net/test/read.cgi/tech/1002820903/
  let range = substitute(a:url, mx, '\4', '')
  let mx_range = '[-0-9]\+'
  let s:parse2ch_range_mode = ''
  let s:parse2ch_range_start = ''
  let s:parse2ch_range_end = ''
  let str_range = matchstr(range, mx_range)
  if str_range != ''
    " �͈͕\�L�𑖍�
    let mx_range2 = '\(\d*\)-\(\d*\)'
    if str_range =~ mx_range2
      let s:parse2ch_range_start = substitute(str_range, mx_range2, '\1', '')
      let s:parse2ch_range_end	 = substitute(str_range, mx_range2, '\2', '')
      if s:parse2ch_range_start == ''
	let s:parse2ch_range_start = 1
      endif
      if s:parse2ch_range_end == ''
	let s:parse2ch_range_end = '$'
      endif
    else
      " �����������蓾�Ȃ��̂ŉ�
      let s:parse2ch_range_start = str_range
      let s:parse2ch_range_end = str_range
    endif
    let s:parse2ch_range_mode = s:parse2ch_range_mode . 'r'
    " �\���t���O(n/l)�̔���
    if range =~ 'n'
      let s:parse2ch_range_mode = s:parse2ch_range_mode . 'n'
    endif
    if range =~ 'l'
      let s:parse2ch_range_mode = s:parse2ch_range_mode . 'l'
    endif
  endif

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
  call AL_execute("edit! " . s:buftitle_thread)
  setlocal filetype=2ch_thread
  let b:title = s:prefix_thread

  " �ꗗ�p�o�b�t�@���J��
  call AL_execute("topleft 15vnew! " . s:buftitle_boardlist)
  setlocal filetype=2ch_boardlist
  let b:title = s:label_boardlist

  " �X���b�h�ꗗ�p�o�b�t�@(==��)���J��
  call s:GoBuf_Thread()
  call AL_execute("leftabove 10new! " . s:buftitle_threadlist)
  setlocal filetype=2ch_threadlist
  let b:title = s:prefix_board
endfunction

"
" HTTP�_�E�����[�h�̊֐�:
"   ������wget�Ɉˑ����Ȃ��悤�ɂ������B
"
function! s:HttpDownload(host, remotepath, localpath, flag)
  " �I�t���C���̃`�F�b�N
  if s:dont_download
    return
  endif
  call s:Redraw('force')
  call s:EchoH('WarningMsg', s:msg_wait_download)

  let local = a:localpath
  let url = 'http://' . a:host . '/' . substitute(a:remotepath, '^/', '', '')
  let continued = 0
  let compressed = 0

  " �N���I�v�V�����̍\�z��cURL�̎��s
  let opts = g:chalice_curl_options

  " ��dat�ǂݍ��ݐ����ɑΉ�
  if s:user_agent_enable
    let opts = opts . ' -A ' . AL_quote(s:user_agent)
  endif

  " �p�����[�h�̃I�v�V�����ݒ�
  if AL_hasflag(a:flag, 'continue')
    let size = getfsize(local)
    if size > 0
      let continued = 1
      let opts = opts . ' -C ' . size
    endif
  endif

  " ���k���[�h�̃I�v�V�����ݒ�
  if !continued && g:chalice_gzip && s:cmd_gzip != '' && a:remotepath !~ '\.gz$'
    let compressed = 1
    let local = local . '.gz'
    let opts = opts . ' -H Accept-Encoding:gzip,deflate'
  endif

  " �w�b�_�[�����擾���邽�߃e���|�����t�@�C�����g�p
  let tmp_head = tempname()
  let opts = opts . ' -D ' . AL_quote(tmp_head)

  " �_�E�����[�h�R�}���h�\�����_�E�����[�h���s
  let opts = opts . ' -o ' . AL_quote(local) . ' ' . AL_quote(url)
  call s:DoExternalCommand(s:cmd_curl . ' ' . opts)

  " �w�b�_�[���擾���e���|�����t�@�C���폜
  call AL_execute('split ' . tmp_head)
  "  ����split�A���O��'noequalalways'���Ă����f����Ȃ��B�d���Ȃ��̂ŃX�N��
  "  �v�g�S�̂�'noequalalways'����悤�ɂ����B
  let retval = substitute(getline(1), '^HTTP\S*\s\+\(\d\+\).*$', '\1', '') + 0
  bwipeout
  call delete(tmp_head)

  if compressed
    " �𓀒��`
    call s:DoExternalCommand(s:cmd_gzip . ' -d -f ' . AL_quote(local))
    if filereadable(local)
      call rename(local, substitute(local, '\.gz$', '', ''))
    endif
  endif

  call s:Redraw('force')
  return retval
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
    let mx = '^http://\([^/]\+\)/\(.*\)$'
    if exists('g:chalice_menu_url') && g:chalice_menu_url =~ mx
      " �O�����烁�j���[��URL��^����
      let menu_host = substitute(g:chalice_menu_url, mx, '\1', '')
      let menu_remotepath = substitute(g:chalice_menu_url, mx, '\2', '')
    else
      " 2ch�̃t���[����ǂݍ����framedata�Ɋi�[
      let local_frame = tempname()
      call s:HttpDownload(s:host, s:remote, local_frame, '')
      call AL_execute('%delete _')
      call AL_execute('read ' . local_frame)
      call AL_execute("%join")
      let framedata = getline('.')
      call AL_execute('%delete _')
      call delete(local_frame)

      " frame�^�O�̉���
      let framedata = substitute(framedata, '^.*\(frame\>[^>]*name="\?menu"\?[^>]*\)>.*$', '\1', '')
      let mx = '^.*src="\?http://\([^/]\+\)/\([^" ]*\)"\?.*$'
      let menu_host = substitute(framedata, mx, '\1', '')
      let menu_remotepath = substitute(framedata, mx, '\2', '')
    endif

    " �Œ���̕ۏ�
    if menu_host == ''
      let menu_host = s:menu_host
      let menu_remotepath = s:menu_remotepath
    endif

    " ���j���[�t�@�C���̓Ǎ�
    call s:HttpDownload(menu_host, menu_remotepath, local_menu, '')
  endif

  " �ꗗ�̐��`
  call AL_buffer_clear()
  call AL_execute('read ' . local_menu)
  " ���s<BR>��{���̉��s��
  call AL_execute("%s/\\c<br>/\r/g")
  " �J�e�S���Ɣւ̃����N�ȊO������
  call AL_execute('%g!/^\c<[AB]\>/delete _')
  " �J�e�S���𐮌`
  call AL_execute('%s/^<B>\([^<]*\)<\/B>/' . Chalice_foldmark(0) . '\1/')
  " ���𐮌`
  call AL_execute('%s/^<A HREF=\([^ ]*\/\)[^/>]*>\([^<]*\)<\/A>/ \2\t\t\t\t\1')
  " �u2ch�����ē��v���폜�c�{���͂����ƃ`�F�b�N���Ȃ���_�������ǁB
  call AL_execute("1,/^" . Chalice_foldmark(0) . "/-1delete _")
  "normal! gg"_dd0

  " �e�X�g�I�ւ̃����N��ꗗ�ɖ��ߍ���
  if 1 || s:debug
    " ����͂��΂炭�����I�ɖ��ߍ��ށc
    call append(0, Chalice_foldmark(0) . "�e�X�g�I")
    call append(1, " �΂��[\t\t\t\thttp://tora3.2ch.net/butter/")
  endif

  " folding�쐬
  silent! normal! gg
  while 1
    call AL_execute('.,/\n\(' . Chalice_foldmark(0) . '\)\@=\|\%$/fold')
    let prev = line('.')
    silent! normal! j
    if prev == line('.')
      break
    endif
  endwhile
  silent normal! gg

  call AL_del_lastsearch()
endfunction

"
" Chalice�N���m�F
"
function! ChaliceIsRunning()
  return s:opened
endfunction

"------------------------------------------------------------------------------
" MOVE AROUND BUFFER
" �o�b�t�@�ړ��p�֐�

function! s:GetLnum_Article(num)
  " �w�肵���ԍ��̋L���̐擪�s�ԍ����擾�B�J�[�\���͈ړ����Ȃ��B
  call s:GoBuf_Thread()
  let oldline = line('.')
  if a:num =~ '\cnext'
    let lnum = search('^\d\+  ', 'W')
  elseif a:num =~ '\cprev'
    " 'nostartofline'�΍�
    normal! k
    let lnum = search('^\d\+  ', 'bW')
    " 1�𒴂������̓w�b�_������\��
    if lnum == 0
      let lnum = 1
    endif
  elseif a:num =~ '\ccurrent'
    call AL_execute("normal! j")
    let lnum = search('^\d\+  ', 'bW')
  else
    let lnum = search('^' . a:num . '  ', 'bw')
  endif
  call AL_execute("normal! " . oldline . "G")
  return lnum
endfunction

function! s:GoThread_Article(num)
  let lnum = s:GetLnum_Article(a:num)
  if lnum
    call AL_execute("normal! ".lnum."Gzt\<C-Y>")
  endif
  return lnum
endfunction

function! s:GoBuf_Write()
  let retval = s:SelectWindowByName(s:buftitle_write)
  if retval < 0
    call AL_execute("rightbelow split " . s:buftitle_write)
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
  if AL_hasflag(a:flag, '\cnext')
    let data = s:JumplistNext()
  elseif AL_hasflag(a:flag, '\cprev')
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
    call AL_execute('normal! ' . curline . 'G')
  endif
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
  call AL_buffer_clear()
  setlocal filetype=2ch_bookmark
  call AL_execute("read " . g:chalice_bookmark)
  silent! normal! gg"_dd0
  call s:Redraw('force')
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
  call AL_execute("%write! " . g:chalice_bookmark)
  call AL_buffer_clear()

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
      call AL_execute(':' . existedbookmark . 'delete _')
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
    call s:Redraw('force')
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
  if AL_hasflag(a:flag, 'thread')
    call s:GoBuf_Thread()
  elseif AL_hasflag(a:flag, 'threadlist')
    call s:GoBuf_ThreadList()
  endif
endfunction

function! s:Thread2Bookmark(target)
  let title = ''
  let url = ''
  if AL_hasflag(a:target, 'thread')
    " �X���b�h����x�ɓo�^
    call s:GoBuf_Thread()
    if b:host == '' || b:board == '' || b:dat == ''
      call s:Redraw('force')
      call s:EchoH('ErrorMsg', s:msg_error_addnothread)
      return
    endif
    let dat = substitute(b:dat, '\.dat$', '', '')
    if b:title_raw == ''
      let title = b:host . b:board . '/' . dat
    else
      let title = b:title_raw
    endif
    let url = 'http://' . b:host . '/test/read.cgi' . b:board . '/' . dat
  elseif AL_hasflag(a:target, 'threadlist')
    " �X���ꗗ����x�ɓo�^
    call s:GoBuf_ThreadList()
    let curline = getline('.')
    let mx = '^. \(.\+\) (\d\+) \%(\d\d\d\d\/\d\d\/\d\d \d\d:\d\d:\d\d\)\?\s*\(\d\+\)\.dat$'
    if b:host == '' || b:board == '' || curline !~ mx
      call s:Redraw('force')
      call s:EchoH('ErrorMsg', s:msg_error_addnothreadlist)
      return
    endif
    let title = substitute(curline, mx, '\1', '')
    let dat = substitute(curline, mx, '\2', '')
    let url = 'http://' . b:host . '/test/read.cgi' . b:board . '/' . dat
  elseif AL_hasflag(a:target, 'boardlist')
    " �ꗗ����x�ɓo�^
    call s:GoBuf_BoardList()
    let curline = getline('.')
    let mx = '^ \(.\+\)\s\+\(http:.\+\)$'
    if curline !~ mx
      call s:Redraw('force')
      call s:EchoH('ErrorMsg', s:msg_error_addnoboardlist)
      return
    endif
    " [��]��t���邱�ƂŃX���b�h�̋��(�X������[��]�Ŏn�܂����狃��?)
    let title = '[��] ' . substitute(curline, mx, '\1', '')
    let url = substitute(curline, mx, '\2', '')
  endif
  " OUT: title��url

  call s:Redraw('force')
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

"
" �������ݗp�o�b�t�@���J��
"
function! s:OpenWriteBuffer(...)
  " �t���O�ɉ����ē����Asage�������ݒ�
  let newthread = 0
  let quoted = ''
  let username = g:chalice_username
  let usermail = g:chalice_usermail
  if a:0 > 0
    if AL_hasflag(a:1, 'anony')
      let username = g:chalice_anonyname
      let usermail = ''
    endif
    if AL_hasflag(a:1, 'sage')
      let usermail = 'sage'
    endif
    if AL_hasflag(a:1, 'new')
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
    " ���݃J�[�\��������L���̈��p
    if a:0 > 0 && AL_hasflag(a:1, 'quote')
      " ���p�J�n�ʒu������
      let quote_start = s:GetLnum_Article('current') - 1
      let first_article = s:GetLnum_Article(1) - 1
      if quote_start < first_article
	let quote_start = first_article
	let quote_end = s:GetLnum_Article(2) - 3
      else
	" ���p�I���ʒu������
	let quote_end = s:GetLnum_Article('next') - 3
      endif
      " �͈͎w�肪�Ђ�����Ԃ��Ă��鎞�A�������͕s���Ȏ�
      if quote_end < 1 || quote_end < quote_start
	let quote_end = line("$")
      endif
      " ���͂����p������������쐬(->quoted�Ɋi�[)
      let quoted = '>>' . matchstr(getline(quote_start + 1), '^\(\d\+\)') . "\<CR>"
      let i = quote_start + 2
      while i <= quote_end
	let quoted = quoted . substitute(getline(i), '^.', '>', '') . "\<CR>"
	let i = i + 1
      endwhile
    endif
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
  call AL_buffer_clear()

  call s:Redraw('')
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
    let def = def . quoted
    execute "normal! i" . def . "\<ESC>"
  endif
  let s:opened_write = 1
  call s:Redraw('force')
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
  if AL_hasflag(a:flag, '\cclosing')
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
  let force_close = AL_hasflag(a:flag, '\cclosing')
  call s:GoBuf_Write()
  call s:Redraw('force')

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
  let title = AL_chompex(substitute(title,  '^Title:', '', ''))
  let name =  AL_chompex(substitute(name,   '^From:',  '', ''))
  let mail =  AL_chompex(substitute(mail,   '^Mail:',  '', ''))

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
  " &�L����&amp;�ɒu��
  if AL_hasflag(g:chalice_writeoptions, 'amp')
    let message = substitute(message, '&', '\&amp;', 'g')
  endif
  " ���p�X�y�[�X2��S�p�X�y�[�X2�ɓW�J
  if AL_hasflag(g:chalice_writeoptions, 'zenkaku')
    let message = substitute(message, '  ', '�@', 'g')
  endif
  " ���p�X�y�[�X��&nbsp;�ɒu��
  if AL_hasflag(g:chalice_writeoptions, 'nbsp')
    let message = substitute(message, ' ', '\&nbsp;', 'g')
  endif

  if 0
    echo "RAW MESSAGE=".message
    echo "MESSAGE=" . AL_urlencode(message)
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
    let chunk = chunk . 'subject=' . AL_urlencode(title)
    let chunk = chunk . '&submit=' . s:urlencoded_newwrite
  endif
  let chunk = chunk . '&FROM=' . AL_urlencode(name)
  let chunk = chunk . '&mail=' . AL_urlencode(mail)
  let chunk = chunk . '&MESSAGE=' . AL_urlencode(message)
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
  " chalice_noquery_write���ݒ肳��Ă��鎞�ɂ͗L�������킳�������ށBChalice
  " �I���ɔ������������݂ł͓��I�v�V�����Ɋւ�炸�m�F������B
  if AL_hasflag(a:flag, 'quit') || !exists('g:chalice_noquery_write') || !g:chalice_noquery_write
    if force_close
      " �ʏ�̊m�F
      let last_confirm = input(s:msg_confirm_appendwrite_yn)
      echohl None
      if last_confirm !~ '^\cy'
	call s:Redraw('force')
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
	call s:Redraw('force')
	call s:EchoH('ErrorMsg', s:msg_error_writeabort)
	return -1
      elseif last_confirm !~ '^\cy'
	call s:Redraw('force')
	call s:EchoH('WarningMsg', s:msg_error_writecancel)
	return 0
      endif
    endif
  endif

  let tmpfile = tempname()
  redraw!
  execute "redir! > " . tmpfile 
  silent echo chunk
  redir END
  " �������݃R�}���h�̔��s
  "   �K�v�ȃf�[�^�ϐ�: tmpflie, b:host, b:bbs
  call s:Redraw('force')
  " �N���I�v�V�����̍\�z��cURL�̎��s
  let opts = g:chalice_curl_options
  if s:user_agent_enable
    let opts = opts . ' -A ' . AL_quote(s:user_agent)
  endif
  let opts = opts . ' -b NAME= -b MAIL='
  if g:chalice_curl_cookies != 0 && exists('g:chalice_cookies')
    let opts = opts . ' -c ' . AL_quote(g:chalice_cookies)
    let opts = opts . ' -b ' . AL_quote(g:chalice_cookies)
  endif
  let opts = opts . ' -d @' . AL_quote(tmpfile)
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
  return s:dir_cache . 'dat_' . substitute(a:host . a:board, '/', '_', 'g') . '_' . substitute(a:dat, '\.dat$', '', '')
endfunction

function! s:GenerateLocalSubject(host, board)
  return s:dir_cache . 'subject_' . substitute(a:host . a:board, '/', '_', 'g')
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
  if s:opened_bookmark || b:host == '' || b:board == ''
    return
  endif

  let i = a:startline
  let lastline = a:endline ? a:endline : line('$')

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
  " subject.txt�̐��`�B�e�^�C�v���̒u���p�^�[����p��
  " ������ƖƉu�A���S���Y���I(��)
  let mx_shitaraba  = '^\(\d\+_\d\+\)<>\(.\{-\}\)<>\(\d\+\)<><>NULL<>$'
  let mx_mikage	    = '^\(\d\+\.\%(dat\|cgi\)\),\(.*\)(\(\d\+\))$'
  let mx_2ch	    = '^\(\d\+\.dat\)<>\(.*\) (\(\d\+\))$'
  let out_pattern   = '  \2 (\3)\t\t\t\t\1'

  " �ǂ̃^�C�v���𔻒�B�f�t�H���g��2ch�`��
  let firstline = getline(1)
  let mx = mx_2ch
  let b:format = '2ch'
  if firstline =~ mx_shitaraba
    " ������΂̏ꍇ
    let mx = mx_shitaraba
    let out_pattern = out_pattern . '.dat'
    let b:format = 'shitaraba'
  elseif firstline =~ mx_mikage
    " mikage�̏ꍇ
    let mx = mx_mikage
    let b:format = 'mikage'
  endif

  " ���`�����s
  call AL_execute('%s/' .mx. '/' .out_pattern)
  " ���ꕶ���ׂ�
  call AL_decode_entityreference('%')
  call AL_del_lastsearch()

  if g:chalice_threadinfo
    call s:FormatThreadInfo(1, 0)
  endif
endfunction

function! s:FormatThread()
  " �҂��Ăˁ����b�Z�[�W
  call s:EchoH('WarningMsg', s:msg_wait_threadformat)
  " �ŏI�L���ԍ����擾
  let b:chalice_lastnum = line('$')
  return Dat2Text(g:chalice_verbose > 0 ? 'verbose' : '')
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
  command! -nargs=1 Article		call <SID>GoThread_Article(<q-args>)
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
  command! ChaliceToggleNetlineStatus	call <SID>ToggleNetlineState()
endfunction

function! s:CommandUnregister()
  delcommand ChaliceQuit
  delcommand ChaliceQuitAll
  delcommand ChaliceGoBoardList
  delcommand ChaliceGoThreadList
  delcommand ChaliceGoThread
  delcommand ChaliceGoArticle
  delcommand Article
  delcommand ChaliceOpenBoard
  delcommand ChaliceOpenThread
  delcommand ChaliceHandleJump
  delcommand ChaliceHandleJumpExt
  delcommand ChaliceReloadBoardList
  delcommand ChaliceReloadThreadList
  delcommand ChaliceReloadThread
  delcommand ChaliceReloadThreadInc
  delcommand ChaliceDoWrite
  delcommand ChaliceWrite
  delcommand ChaliceHandleURL
  delcommand ChaliceBookmarkToggle
  delcommand ChaliceBookmarkAdd
  delcommand ChaliceJumplist
  delcommand ChaliceJumplistNext
  delcommand ChaliceJumplistPrev
  delcommand ChaliceDeleteThreadDat
  delcommand ChaliceToggleNetlineStatus
endfunction
