Chalice �`2�����˂�{���v���O�C�� for Vim�` �戵������
                                                            Since: 16-Nov-2001
                                                                  Version: 1.2
                                                 Author: MURAOKA Taoro (KoRoN)
                                                     Last Change: 11-Mar-2002.

����
  Vim���2�����˂�̌f�����{�����邽�߂̃v���O�C���ł��BVim���������̂ł�
  ��΂ǂ�OS�ł������悤�ɑ��삷�邱�Ƃ��ł��܂��B�X���b�h�𗧂Ă邱�Ƃ͂ł���
  ����B
  # Chalice�́u�Ў�ŃL�[�{�[�h�݂̂Ŏg����v���Ƃ���{�݌v���j�ɂ��Ă��܂��B
  # (2.0�n�͂��̌���������������Ȃ̂ō폜�\��)

  # �ȉ��̕����ł�Vim,vim,gvim���ȂǁA���������\�L������܂����ǂ������
  # Vim�Ƃ��čl���Ă��������B
  
  Chalice��cURL���g�p���ăX���f�[�^���擾���Ă��܂��BcURL�������ĂȂ����͕ʓr
  ���肵�Ă��������BWindows�ł͉��L��curl.exe�o�C�i�����_�E�����[�h���܂��B
  UNIX�ł̓\�[�X�������Ă��ăR���p�C���E�C���X�g�[�����Ă��������BMac OS X�ł�
  �ŏ�����C���X�g�[������Ă��܂�(10.1�ȍ~)�B

  UNIX�Ŏg�p����ɂ�vim��+iconv�ŃR���p�C�����Ă����K�v������܂��B�܂�iconv��
  ���ł͕����R�[�h�ϊ��ɑΉ�������Ȃ����߁A�ʓr�ɕ����R�[�h�ϊ��O���v���O����
  qkc��nkf���K�v�ƂȂ�܂��B���ɕϊ����x�̗ǂ�����qkc�𐄏����܂��B���L�̃T�C
  �g���\�[�X���_�E�����[�h���ăC���X�g�[�����Ă��������B

  - curl.exe
    http://www.kaoriya.net/dist/curl-7.9.1-w32.tar.bz2

  - cURL�̃T�C�g(�\�[�X��)
    http://curl.sourceforge.net/

  - qkc�̃T�C�g(�\�[�X)
    http://hp.vector.co.jp/authors/VA000501/index.html

�C���X�g�[��
  (Windows ����y�C���X�g�[��)
    �𓀂��ĂłĂ����f�B���N�g�� chalice-{�o�[�W������} �� vimfiles �ɕύX���A
    curl.exe�ƈꏏ��gvim.exe�Ɠ����f�B���N�g���փR�s�[����B���̂Ƃ����ɓ�����
    �t�@�C���E�f�B���N�g�������݂���ꍇ�ɂ͏㏑�����Ă��܂��Ă悢�B���Ƃ�Vim
    �N�����
      :Chalice
    �ƃ^�C�v����΃v���O�C�����N������B�C���X�g�[���͊ȒP�����ǃA���C���X�g�[
    �����ʓ|�ɂȂ�A���n�̌��B

  (Windows ���ʂ̃C���X�g�[��)
    1. �𓀂��ďo�����f�B���N�g����K���ȏꏊ�ɒu���܂��B
       �����ł͐����̂��߂� chalice-{�o�[�W������} �Ƃ����f�B���N�g����chalice
       �ɕύX���Agvim.exe�Ɠ����f�B���N�g���ɒu�����Ƃ��܂��B
    2. curl.exe�����ϐ�PATH�̂ǂ����ɃR�s�[���Ă��������B
       �悭�킩��Ȃ��ꍇ��gvim.exe�Ɠ����f�B���N�g���ŗǂ��ł��B
    3. vim���N�����Ď��̂悤�Ƀ^�C�v���܂��B
       :set runtimepath+=$VIM/chalice
       :runtime plugin/chalice.vim
       :Chalice
    4. �K�v�Ȃ�Όl�ݒ�t�@�C�� _vimrc ��
         set runtimepath+=$VIM/chalice
       �ƋL�q���Ă�����Vim���N��������
         :Chalice
       �ƃ^�C�v���邾���Ńv���O�C�����N�����܂��B

  (UNIX����y�C���X�g�[��)
    �C���X�g�[���X�N���v�g���쐬���܂����B�ȉ��̂悤�ɃC���X�g�[���\�ł��B
      > su ; sh ./install.sh
    $VIMRUNTIME�炵���Ƃ����vimfiles������ĕK�v�ȃt�@�C�����R�s�[���Ă��邾
    ���ł��B���̑���cURL��qkc��������nkf�̃C���X�g�[����Y��Ȃ��ŉ������B

  (UNIX�蓮�C���X�g�[��)
    ��{�I��(Windows ���ʂ̃C���X�g�[��)�Ɠ������@�ŃC���X�g�[�����\�ł��B��
    ����cURL�̃C���X�g�[���ƁA�y��qkc��������nkf(qkc����)�̃C���X�g�[����Y��
    �Ȃ��ŉ������B

  (Mac OS X ����y�C���X�g�[��)
    �𓀂��ĂłĂ����f�B���N�g�� chalice-{�o�[�W������} �� vimfiles �ɕύX���A
    Vim���s�t�@�C���̂���f�B���N�g���ɃR�s�[����B���̂Ƃ����ɓ����̃f�B���N
    �g�������݂���ꍇ�ɂ͏㏑�����Ă��܂��Ă悢�B���Ƃ�Vim�N�����
      :Chalice
    �ƃ^�C�v����΃v���O�C�����N������B�C���X�g�[���͊ȒP�����ǃA���C���X�g�[
    �����ʓ|�ɂȂ�A���n�̌��B

  (Mac OS X ���ʂ̃C���X�g�[��)
    1. �𓀂��ďo�����f�B���N�g����K���ȏꏊ�ɒu��
       �����ł͐����̂��߂� chalice-{�o�[�W������} �Ƃ����f�B���N�g����chalice
       �ɕύX���AVim�̃A�C�R���Ɠ����f�B���N�g���ɒu�����Ƃ��܂��B
    2. Chalice�����s����
       vim���N�����Ď��̃R�}���h���^�C�v�����Chalice���N�����܂��B
       :set runtimepath+=$VIM/chalice
       :runtime plugin/chalice.vim
       :Chalice
    3. (�K�v�Ȃ��)�ȒP�ɋN���ł���悤�ɂ���
       �l�ݒ�t�@�C�� $VIM/_vimrc ��
         set runtimepath+=$VIM/chalice
       �ƋL�q���Ă�����Vim���N��������
         :Chalice
       �ƃ^�C�v���邾���Ńv���O�C�����N�����܂��B

����@
  - (�N�����@)  :Chalice

  �{���n�o�b�t�@
  - (�S����)    q       Chalice���I��
  - (�S����)    Q       Vim�����ׂďI��
  - (�S����)    R       ���݂̃o�b�t�@�������[�h
  - (�S����)    <C-Tab> �o�b�t�@�Ԉړ�(<S-Tab>�ŋt��)
  - (�S����)    <BS>    �ꗗ�ֈړ�
  - (�S����)    u       �X���ꗗ(�x)�ֈړ�
  - (�S����)    U       �X���ꗗ(�x)�ֈړ�(+�x�̋N���g�O��)
  - (�S����)    m       �X���b�h�ֈړ�
  - (�S����)    M       �X���b�h�ֈړ�(+�x�̋N���g�O��)
  - (�S����)    <C-A>   �X���̞x(�u�b�N�}�[�N)�̋N���E�I���g�O��
  - (�S����)    <Space> 1��ʃX�N���[���_�E��(<S-Space>�y��p�ŃA�b�v)
  - (�S����)    <C-N>   �N���b�v�{�[�h��URL��Chalice�ŊJ��

  - (�ꗗ)    j,k     �J�e�S���E�̑I��(�J�[�\���ړ��ɂ��)
  - (�ꗗ)    h,l     �J�e�S��fold�����(h)�E�J��(l)
  - (�ꗗ)    <CR>    �J�e�S��fold�̊J�E�{������̌���
  - (�ꗗ)    <S-CR>  ���O���u���E�U�ŊJ��

  - (�X���ꗗ)  j,k     �X����I��(�J�[�\���ړ��ɂ��)
  - (�X���ꗗ)  d       �X���̃L���b�V��dat��(���݂����)�폜
  - (�X���ꗗ)  <CR>    �{������X���̌���(<C-CR>�Ő擪����)
  - (�X���ꗗ)  <S-CR>  �X�����O���u���E�U�ŊJ��
  - (�X���ꗗ)  ~       �J�[�\���s�̃X����x�ɓo�^

  - (�X���b�h)  j,k     �J�[�\���㉺�ړ�
  - (�X���b�h)  h,l     �J�[�\���㉺�ړ�
  - (�X���b�h)  J,K     1�s�X�N���[���_�E��/�A�b�v
  - (�X���b�h)  p       1��ʃX�N���[���A�b�v
  - (�X���b�h)  <,>     �O/���̋L���ֈړ�(, �� .�������Ӗ�)
  - (�X���b�h)  <CR>    �J�[�\���s�̋L��/URL���J��(Chalice�D��)
  - (�X���b�h)  <S-CR>  �J�[�\���s�̋L��/URL���O���u���E�U�ŊJ��
  - (�X���b�h)  <C-O>   <CR>�W�����v��k��(<C-I>�ŏ������W�����v)
  - (�X���b�h)  r       ���݂̃X�����X�V(�����X�V�̂��ߍ���:����)
  - (�X���b�h)  ~       �{�����̃X�����X���̞x�ɓo�^

  - (�X���̞x)  j,k     �J�[�\���㉺�ړ�
  - (�X���̞x)  h,l     �J�e�S��fold�����(h)�E�J��(l)
  - (�X���̞x)  <CR>    �J�e�S��fold�J�E�{������X���̌���

  �X���ꗗ�ł͈�x�ł��ǂ񂾂��Ƃ̂���(���[�J����dat�t�@�C�������݂���)�X����
  �󂪕t���܂��B��ɂ� ! �� + ��2��ނ�����A! �͉ߋ�chalice_threadinfo_expire
  �b�ȓ��Ƀ��[�J����dat�t�@�C�����X�V���ꂽ���̂��A+ �͍X�V����Ă��Ȃ����̂�
  �Ӗ����܂��B

  �X���̞x�̓e�L�X�g�t�@�C���̂悤�ɕҏW�\�ł��B�J�e�S�����쐬����ɂ͐擪��
  �u���v�Ŏn�܂�s�������A�J�e�S�����Ƃ��܂��B�C���f���g�̐[���ɂ��J�e�S����
  �K�w�����邱�Ƃ��o���܂��B�C���f���g�ɂ��J�e�S�����̑��݂��Ȃ�fold������
  �邱�Ƃ�����A�킩��ɂ����Ȃ�̂ŋC�����Ă��������B�x�̓��e�͕��邽�т�
  �����I�Ƀt�@�C���֕ۑ�����܂��B�ۑ��t�@�C������m��ɂ͎��̃R�}���h���g����
  ���������B
        :echo chalice_bookmark

  �������݌n�o�b�t�@
  - (��������)  i,I     �������݃��[�h��(I��sage/o,O�������Ӗ�)
  - (��������)  a,A     �����������݃��[�h��(A��sage)
  - (��������)  <C-CR>  �������ݎ��s

  �����ޓ��e�ɕs�����Ȃ���Β��O�ɏ����ނ��ǂ����Ō�̊m�F�����߂���B�{����
  ������ł悯��� yes �ƃ^�C�v�Bno �ƃ^�C�v�������ɂ͏������݂͍s�Ȃ�ꂸ�o�b
  �t�@�̓��e��������B�������݂𒆒f����ɂ� cancel (�f�t�H���g)�B

  �m���ē������{����
  - (folding)   zr      �Sfold�W�J
  - (folding)   zm      �Sfold��

�֗��Ȑݒ�E���Z (+ ��1.0�ȍ~�ɒǉ�/�ύX�̂���������)
  �䂩���Ȑݒ�ϐ�����
  - chalice_username                    �������ݎ��Ɏ������͂��郆�[�U��
    ��:   let chalice_username = 'KoRoN@Vim%Chalice'

  - chalice_anonyname                   �����������ݎ��Ɏ������͂��郆�[�U��
    ��:   let chalice_anonyname = '����������@Vim%Chalice'

  - chalice_usermail                    �������ݎ��Ɏ������͂��郁�[���A�h���X
    ��:   let chalice_usermail = 'koron@tka.att.ne.jp'

  - chalice_columns                     Chalice�N������'columns'��ݒ�
    ��:   let chalice_columns = 160
    (���)Chalice�N������'columns'��160�ɐݒ肷��B

  - chalice_bookmark                    �u�b�N�}�[�N�t�@�C�����L��
    ��:   echo chalice_bookmark
    (���)�u�b�N�}�[�N�t�@�C�������m�F����B
    ��:   let chalice_bookmark = $HOME . '/.chalice_bmk'
    (���)�u�b�N�}�[�N�t�@�C�����w�肷��B

  - chalice_cachedir                    �L���b�V���p�f�B���N�g�����w��
    ��:   let chalice_cachedir = 'd:/home/vimfiles/chalice_cache'
    (���)�_�E�����[�h�ς�dat�����i�[����f�B���N�g�����w�肷��B

  - chalice_jumpmax                     �W�����v�����̍ő�T�C�Y(�ȗ��l:100)
    ��:   let chalice_jumpmax = 1000

  - chalice_curl_options                cURL�ɓn���I�v�V����
    ��:   let chalice_curl_options = '-x {host}:{port}'
    (���)�v���L�V�̐ݒ������(�ڍׂ�cURL�̕��͂��Q��)�B

  - chalice_exbrowser                   �O���u���E�U���w��(��Windows�̂�)
    ��:   let chalice_exbrowser = 'netscape %URL% &'
    (���)�����񒆂� %URL% ��URL�ɒu����������B

  - chalice_reloadinterval_boardlist    �ꗗ�̃����[�h�Ԋu(�b)
    ��:   let chalice_reloadinterval_boardlist = 604800

  - chalice_reloadinterval_threadlist   �X���ꗗ�̃����[�h�Ԋu(�b)
    ��:   let chalice_reloadinterval_threadlist = 0
    (���)�X���ꗗ�̎擾�Ԋu��0�b(��ɍX�V)�ɂ���B

  - chalice_threadinfo		        �N�x�\���@�\�t���O
    ��:   let chalice_threadinfo = 0
    (���)�X����dat�t�@�C���̑��݁E�X�V�󋵂̕\���@�\�𖳌��ɂ���B

  - chalice_threadinfo_expire		�N�x�ێ�����(�b)
    ��:   let chalice_threadinfo_expire = 7200
    (���)���ǂ���2���Ԉȏ�X�V����Ă��Ȃ��X���������\������B

  - chalice_gzip                        gzip���k�̗L�����t���O
    ��:   let chalice_gzip = 0
    (���)gzip���k�]���@�\���G���[���N�����ۂ�0��ݒ肵�A����𖳌��Ƃ���B

  - chalice_multiuser                   �}���`���[�U���[�h(UNIX�̓f�t�H���g)
    ��:   let chalice_multiuser = 1

  - chalice_verbose                     ������̕񍐃��x��(�f�o�b�O�p)
    ��:   let chalice_verbose = 1
    (���)1�ȏ�ɐݒ肷��ƊO���R�}���h�̎��s�󋵂��ώ@�ł���B

  ���Ƃ͌����Ȃ��Z
  - 'I'�ŏ������݃��[�h�ɓ����chalice_usermail�Ɋւ�炸"sage"��
  - 'a'�ŏ������݃��[�h�ɓ����chalice_username�Ɋւ�炸�u�������v��
  - 'A'�ŏ������݃��[�h�ɓ���Ƌ����I�Ɂu�������v�usage�v��
  - ����"y"�����ł��������߂�
  - :ChaliceJumplist�ŃW�����v�̗������Q�Ɖ�
  - :ChaliceGoArticle �ԍ��Ŏw�肳�ꂽ�L���ԍ��փW�����v

���_
  ��������ӎv�͂���(��ɂ�����̂قǗD�揇�ʂ���������)
  - URL����l�ɂ�镔���I�ȕ\���ɖ��Ή�
  - �Â��������݂�folding�����ł��Ȃ��c�d�l���ł܂�΂��

  �������͎d�l(�d���Ȃ��Ƃ��A�v��Ȃ��Ƃ�)
  - �Â��`��(read.cgi?bbs=...)�͖��T�|�[�g
  - 9x�ł̃u���E�U�N���͓���`�F�b�N���Ă��Ȃ�(�N���g���Ă���Ă���?)
  - UNIX�Łu��Vim6 2�v������x�o�^����Ɖ����適�����R�[�h��v�����Ȃ�
  - UNIX����̏������݂ɂ�iconv���K�v�������Ɖ�����B
  - ���ځ`��΍􂪎ア��<C-R>�̋��������[�h�őΉ��\
  - �X���b�h�����Ă��Ȃ��c�Ƃ��������v���g�R�������łȂ��̂ŕۗ�
  - AA���Y����

�g�p�����E�Ɛ�
  Vim���g����2ch���������Ƃ����~���������l�����g���Ă͂����܂���B�Ƃ������g
  ��Ȃ��n�Y�ł��B���ǈĂ�����l�͉������Ȃ��ŘA�����Ă��������B���Ƀp�b�`�͑�
  ���}�ł��B�v�]�������ƕK���������������Ƃ͕ۏ؂ł����˂܂��B

  ���̃\�t�g�E�F�A���g�p�������Ƃւ̑Ή��͗v�����܂���B���̃\�t�g�E�F�A���g�p
  �������߂ɐ��������Q�ɂ��Ă͈�ؕ⏞�������܂���B���쌠�͕������܂���B�]
  �ځE�Ĕz�z�̍ۂ͎���ō\��Ȃ��̂ŘA�������������B

����E�A����
  Vim�f���E�������̓��[���ł��肢���܂��B

  - Vim�f����
    http://www.kaoriya.net/bbs/bbs.cgi

  - ������email�A�h���X
    koron@tka.att.ne.jp

  - 2ch/�\�t�g�E�F�A��/2ch�{���v���O�C���`Chalice fro Vim
    http://pc.2ch.net/test/read.cgi/software/1006852780/l50
  - 2ch/Unix��/��Vim6 2
    http://pc.2ch.net/test/read.cgi/unix/1006246205/l50

�ӎ�
  - Chalice/vim6�X���̏Z�l����B
  - �n�[�g�ɉ΂�_���Ă��ꂽ�u�܂���v���Ə��{����
  - ������Vim�̍��Bram Moolenaar��
  �ȏ�̕��X�Ɋ��ӁB

�X�V����
  �� 11-Mar-2002 (1.2)
    �����Ń����[�X
  �� 07-Mar-2002 (1.2f-beta)
    �u�b�N�}�[�N�N����̃t�H�[�J�X���X���b�h�ɍs���o�O���C��
  �� 06-Mar-2002 (1.2e-beta)
    �������ݎ��ɔ��p�X�y�[�X��&nbsp;�ɒu��
    'isk'��ύX��������p�Ŋe�I�v�V�����������ɂȂ�o�O���C��
  �� 06-Mar-2002 (1.2d-beta)
    "&amp;"����"&"�֕ϊ����鏇�Ԃ��Ō�ɕύX
    �J�[�\���ʒu��1�s�����������N�̂ǂ�ɃW�����v���邩�I���\��
  �� 05-Mar-2002 (1.2c-beta)
    'wildignore'�΍��ǉ�
    'splitbelow'�y��'splitright'�΍��ǉ�
    �ꗗ��URL��http://www.2ch.net/2ch.html��<frame>�^�O����擾
    cache�f�B���N�g����C�ӂɐݒ�\��
    2ch���j���[���p�ɂɕύX(�v����)
    ��Win32�ł̊O���R�}���h�ɂ��URL���ߎ���"~"���G�X�P�[�v
    �t�@�C�����̐����֐��̐錾��function!�ɕύX
    �ꗗ��URL�ύX
  �� 07-Feb-2002 (1.2b-beta)
    �X���̃t�H�[�}�b�g������������
    verbose�ݒ�ɃX���̃t�H�[�}�b�g���Ƀv���O���X�\��
    URL�p�^�[����"@"��ǉ�
    URL���J�������Ɏ����I�ɃN���b�v�{�[�h��URL���R�s�[
    URL�p�^�[����"!"��ǉ�
    auth2ch�̎���(���͎g���Ȃ�)
  �� 19-Jan-2002 (1.2a-beta)
    dat���ǂ݋֎~�ւ̎b��Ή�
    dat���ǂ݂��֎~�������ւ̑Ή��J�n
    �΂��[�ւ̃����N���ߍ���
    HTML�̃}�b�`�p�^�[���C��
    ���K�w�x�̎���
    �X���̃t�H�[�}�b�g���@��������(\{-}���g�p)

��L
  Chalice�́u�`�����X�v�Ɣ������܂��B�������Ђ��΁u�t�E���t�v�Ƃ����Ӗ��ɂȂ�
  �܂��B�J���R�[�h���uAlice�v�ɂ����������Ƃ����P���ȓ��@����A������ƃq�l��
  ������/\calice�Ŏ��������������Ƃ���A���̖��O���Ђ�������܂����B2ch�̃u��
  �E�U�Ƃ������Ƃ�����A��C���ǂ������Ȃ̂�Chalice�Ɍ��肵�܂����B����Ȍo��
  �̖��O�Ȃ̂Łu�����˂�A���X�v�Ƃ��u�A���X�����v�Ƃ��A�Ăт₷�����O�Ō�
  ��ł�����Ă����\�ł��B�����Ɨǂ����O����������ς����Ⴄ��������܂���B

-------------------------------------------------------------------------------
                  �����鎖�ւ̋����ӎu�������Ɏ����ƈقȂ鐶���������ԐS�ƂȂ�
                                   MURAOKA Taro/�������Y <koron@tka.att.ne.jp>
 vim:set ts=8 sts=2 sw=2 tw=78 et ft=memo:
