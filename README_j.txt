Chalice �`2�����˂�{���v���O�C�� for Vim�` �戵������
                                                            Since: 16-Nov-2001
                                                                  Version: 1.3
                                                 Author: MURAOKA Taoro (KoRoN)
                                                     Last Change: 22-Apr-2002.

�T�v
  Vim���2�����˂�̌f�����{�����邽�߂̃v���O�C���ł��BVim���������̂ł�
  ��΂ǂ�OS�ł������悤�ɑ��삷�邱�Ƃ��ł��܂��B�X���b�h�𗧂Ă邱�Ƃ͂ł���
  ����B�ꕔ2�����˂�ȊO�̌f�����{�����邱�Ƃ��\�ȏꍇ������܂����A�K
  �������ǂݏ����ł���Ƃ͊��҂��Ȃ��ł��������B�܂�����̌f���ւ̑Ή���v�]
  ����Ă��ʏ�͑Ή����������˂܂��B

  # �ȉ��̕����ł�Vim,vim,gvim���ȂǁA���������\�L������܂����ǂ������
  # Vim�Ƃ��čl���Ă��������B
  
�K�v�v��
  Chalice�𗘗p����ɂ͈ȉ��̂��̂��K�v�ɂȂ�܂��B1�ł�������Ɨ��p�o���܂�
  ��̂ŗ\�ߓ��肵�C���X�g�[�����Ă����Ă��������B
    1. vim      (�e�L�X�g�G�f�B�^ 6.0�ȍ~6.1����)
    2. cURL     (HTTP�A�N�Z�X�\�t�g�E�F�A 7.9.4�ȍ~SSL����)
    3. gzip     (���k�����\�t�g)
  �����ɉ����Ă�Windows��2�����˂�ȊO�̌f�����{������ꍇ�ɂ́A�ʓr�\�t
  �g�E�F�A(4)���K�v�ɂȂ�ꍇ������܂��B
    4. iconv.dll
  UNIX�ł�vim��+iconv�ŃR���p�C������ق����̃\�t�g�E�F�A���K�v�ɂȂ�܂��B
    5. qkc��nkf (�����R�[�h�ϊ��\�t�g�E�F�A qkc����)
  �e�K�{�\�t�g�E�F�A�̓���@�͈ȉ����Q�l�ɂ��Ă��������B

  (vim�̓���) ���ɉ�����ׂ����Ƃ͂���܂���Bhttp://www.vim.org/�Q��

  (cURL�̓���) Chalice��2�����˂�̉{���Ə����݂�cURL�Ƃ����O���v���O������
  �g�p���Ă��܂��B2�����˂�֐����������ނɂ�cURL��cookie�Ƃ����d�g�݂𗘗p
  ����K�v������܂��B�Ƃ��낪cURL��7.9.4���Â��o�[�W�����ɂ͂���cookie��
  �p����ۂ̕s����m���Ă��܂��B���̂��߂��̕s����C�����ꂽ�ŐV��(7.9.4
  �ȍ~)���K�v�ł��BWindows�p��cURL�͈ȉ��̃A�h���X�̂��̂��g�p���Ă��������B
  UNIX�ł�cURL�̃T�C�g���ŐV�̃\�[�X�R�[�h���_�E�����[�h&�R���p�C�����Ďg�p
  ���Ă��������BMacOS X�ɂ͌�����Â�cURL���C���X�g�[������Ă��܂��̂ŁA���p
  ����ɂ͕ʓrcURL����肷��K�v������܂��B

  - Windows�p cURL (���艮�z�z��)
    http://www.kaoriya.net/dist/curl-7.9.6-win32-ssl.tar.bz2

  - cURL�I�t�B�V�����T�C�g (�\�[�X�R�[�h��)
    http://curl.sourceforge.net/
  
  - MacOS X�p cURL��� (.pkg/���{��)
    http://www.cosmos.ne.jp/~kaz6120/mclb/osx/curl_wget01.html

  - MacOS X�p cURL��� (Fink�v���W�F�N�g/�p��)
    http://fink.sourceforge.net/index.php

  (gzip�̓���) 2�����˂�͋���Ȍf���ł���1���ɑ����̐l���K��邽�߁A����
  ����c��ȃA�N�Z�X�ʂ����Ȃ��炸�^�c�̕��S�ɂȂ��Ă��܂��B���̕��S�������ł�
  ���炷����2�����˂�̓f�[�^�����k���đ��M���Ă��܂��B���̈��k���ꂽ�f�[�^
  ��Ǎ��ނ��߂�Chalice��gzip�Ƃ����\�t�g�E�F�A�𗘗p���Ă��܂��Bgzip��UNIX��
  MacOS X�ł͕W���I�ɃC���X�g�[������Ă��܂��BWindows�̏ꍇ�͎��̃T�C�g����
  gzip�����C���X�g�[�����邩�ACygwin�𐳂����C���X�g�[������K�v������܂��B

  - gzip.org (gzip�����)
    http://www.gzip.org/ Win�p�o�C�i�� http://www.gzip.org/gzip124xN.zip
  
  - Cygwin
    http://www.cygwin.com/

  (iconv) �����R�[�h�𐳂����������߂�iconv�Ƃ������C�u�������K�v�ł��BWindows
  �ł͉���URL������肵�Ă��������BUNIX�ł�+iconv�ŃR���p�C������K�v�������
  ���BMacOS X�͑Ή����Ă��܂�(�\��)�B

  - Windows�p iconv.dll (���艮�z�z��)
    http://www.kaoriya.net/dist/iconv-1.7.1-dll.tar.bz2
  
  - iconv���C�u�����\�[�X�R�[�h
    http://www.gnu.org/directory/libiconv.html

  (qkc�̓���) UNIX��iconv�ł̓R�[�h�ϊ��ɑΉ�������Ȃ����ߕ����������邱�Ƃ�
  ����܂��B����ɑΉ����邽�߂ɕʓr�ɕ����R�[�h�ϊ��O���v���O����qkc��nkf���K
  �v�ƂȂ�܂��B���ɕϊ����x�̗ǂ�����qkc�𐄏����܂��B���L�̃T�C�g���\�[�X
  ���_�E�����[�h���ăC���X�g�[�����Ă��������B

  - qkc�̃T�C�g(�\�[�X)
    http://hp.vector.co.jp/authors/VA000501/index.html

�C���X�g�[��
  �� Windows
  (Windows ����y�C���X�g�[��)
    �𓀂��ĂłĂ����f�B���N�g�� chalice-{�o�[�W������} �� vimfiles �ɕύX���A
    curl.exe��gzip.exe�ꏏ��gvim.exe�Ɠ����f�B���N�g���փR�s�[���܂��B���̂Ƃ�
    ���ɓ����̃t�@�C���E�f�B���N�g�������݂���ꍇ�ɂ͏㏑�����Ă��܂��ėǂ���
    ���B���Ƃ�Vim�N�����
      :Chalice
    �ƃ^�C�v����΃v���O�C�����N�����܂��B�C���X�g�[���͊ȒP�����ǃA���C���X
    �g�[�����ʓ|�ɂȂ�A���n�̌��ł��B

  (Windows ���ʂ̃C���X�g�[��)
    1. �𓀂��ďo�����f�B���N�g����K���ȏꏊ�ɒu���܂��B
       �����ł͐����̂��߂� chalice-{�o�[�W������} �Ƃ����f�B���N�g����chalice
       �ɕύX���Agvim.exe�Ɠ����f�B���N�g���ɒu�����Ƃ��܂��B
    2. curl.exe��gzip.exe���C���X�g�[�����܂��B
       �C���X�g�[���Ƃ͊��ϐ�PATH�Ŏ������f�B���N�g���̂ǂꂩ�ɃR�s�[����
       ���Ƃł��B�悭�킩��Ȃ��ꍇ��gvim.exe������̂Ɠ����f�B���N�g���ŗǂ�
       �ł��B
    3. vim���N�����Ď��̂悤�Ƀ^�C�v���܂��B
       :set runtimepath+=$VIM/chalice
       :runtime plugin/chalice.vim
       :Chalice
    4. �K�v�Ȃ�Όl�ݒ�t�@�C�� _vimrc ��
         set runtimepath+=$VIM/chalice
       �ƋL�q���Ă�����Vim���N��������
         :Chalice
       �ƃ^�C�v���邾���Ńv���O�C�����N�����܂��B

  �� UNIX�n
  (UNIX�C���X�g�[�����̒���)
    cURL��qkc��������nkf(qkc����)�̃C���X�g�[����Y��Ȃ��ł��������Bftplugin
    �𗘗p����̂ŁA�����L���ɂ���̂�Y��Ȃ��ł��������B
      :filetype plugin on
    $VIMRUNTIME/vimrc_example.vim��source����Ύ����I�ɗL��������܂��B

  (UNIX����y�C���X�g�[��)
    �C���X�g�[���X�N���v�g���쐬���܂����B�ȉ��̂悤�ɃC���X�g�[���\�ł��B
      > su ; sh ./install.sh
    $VIMRUNTIME�炵���Ƃ����vimfiles������ĕK�v�ȃt�@�C�����R�s�[���Ă��邾
    ���ł��B

  (UNIX�蓮�C���X�g�[��)
    ��{�I��(Windows ���ʂ̃C���X�g�[��)�Ɠ������@�ŃC���X�g�[�����\�ł��B

  �� MacOS X
  (Mac OS X ����y�C���X�g�[��)
    �𓀂��ĂłĂ����f�B���N�g�� chalice-{�o�[�W������} �� vimfiles �ɕύX���A
    gvim���s�t�@�C���Ɠ����f�B���N�g���փR�s�[���܂��B���̂Ƃ����ɓ����̃t�@�C
    ���E�f�B���N�g�������݂���ꍇ�ɂ͏㏑�����Ă��܂��ėǂ��ł��BcURL(7.9.4��
    �~)�𐳂����C���X�g�[�����܂��B���Ƃ�Vim�N�����
      :Chalice
    �ƃ^�C�v����΃v���O�C�����N�����܂��B�C���X�g�[���͊ȒP�����ǃA���C���X
    �g�[�����ʓ|�ɂȂ�A���n�̌��ł��B

  (Mac OS X ���ʂ̃C���X�g�[��)
    1. �𓀂��ďo�����f�B���N�g����K���ȏꏊ�ɒu��
       �����ł͐����̂��߂� chalice-{�o�[�W������} �Ƃ����f�B���N�g����chalice
       �ɕύX���AVim�̃A�C�R���Ɠ����f�B���N�g���ɒu�����Ƃ��܂��B
    2. curl���C���X�g�[�����܂��B
       �ڍׂ�cURL�̓����ɏ]���Ă��������B
    3. Chalice�����s����
       vim���N�����Ď��̃R�}���h���^�C�v�����Chalice���N�����܂��B
       :set runtimepath+=$VIM/chalice
       :runtime plugin/chalice.vim
       :Chalice
    4. (�K�v�Ȃ��)�ȒP�ɋN���ł���悤�ɂ���
       �l�ݒ�t�@�C�� $VIM/_vimrc ��
         set runtimepath+=$VIM/chalice
       �ƋL�q���Ă�����Vim���N��������
         :Chalice
       �ƃ^�C�v���邾���Ńv���O�C�����N�����܂��B

�N�����@�E�g�����E�I�����@�E�w���v
  Chalice���N������ɂ̓C���X�g�[����AEx���[�h�R�}���h��
    :Chalice
  �����s���܂��B�g�p�@�̓w���v�t�@�C���ɋL�ڂ���Ă��܂��B�������C���X�g�[����
  �s�Ȃ��Ă���΁A���̃R�}���h�Ńw���v���m�F�ł��܂��B�`���[�g���A���������
  ���̂ŏ��߂Ďg���l�͕K���m�F���Ă��������B
    :help Chalice
  q ��������Chalice�͏I�����܂��B�킩��Ȃ����Ƃ��������ۂɂ́A�܂��w���v�t�@
  �C�����������������B

�g�p�����E�Ɛ�
  Vim���g����2ch���������Ƃ����~���������l�����g���Ă͂����܂���B�Ƃ������g
  ��Ȃ��n�Y�ł��B���ǈĂ�����l�͉������Ȃ��ŘA�����Ă��������B���Ƀp�b�`�͑�
  ���}�ł��B�v�]�������ƕK���������������Ƃ͕ۏ؂ł����˂܂��B

  ���̃\�t�g�E�F�A���g�p�������Ƃւ̑Ή��͗v�����܂���B���̃\�t�g�E�F�A���g�p
  �������߂ɐ��������Q�ɂ��Ă͈�ؕ⏞�������܂���B���쌠�͕������܂���B�]
  �ځE�Ĕz�z�̍ۂ͎���ō\��Ȃ��̂ŘA�������������B

����E�A����
  2�����˂�A���[���A��������Vim�f���ł��肢���܂��B

  - Vim�f����
    http://www.kaoriya.net/bbs/bbs.cgi

  - ������email�A�h���X
    koron@tka.att.ne.jp

  - 2ch/�\�t�g�E�F�A��/2ch�{���v���O�C���`Chalice for Vim
    http://pc.2ch.net/test/read.cgi/software/1006852780/l50
  - 2ch/Unix��/Vim6 Part3
    http://pc.2ch.net/test/read.cgi/unix/1019011083/l50

�ӎ�
  - Chalice/vim6�X���̏Z�l����B
  - �p�b�`�����ꂽ�F����
  - �`���[�g���A���A�J�X�^�}�C�Y��AFAQ�����M���Ă��ꂽ��PYOQ4sjo����
  - �n�[�g�ɉ΂�_���Ă��ꂽ�u�܂���v���Ə��{����
  - ������Vim�̍��Bram Moolenaar��
  �ȏ�̕��X�Ɋ��ӂ������܂��B

�X�V����
  �� 22-Apr-2002 (1.3 ������)
    �N���@���I���܂ł̗�����ӎ����ďC��
    �h�L�������gtypo�C��
    HelpInstall()�̃f�B���N�g���o�O���C��
  �� 20-Apr-2002 (1.3i-rc4)
    subject.txt.gz�ւ̃A�N�Z�X�𒆎~(�K�v�Ȃ����Ƃ��������R�[�h����)
    chalice_nosubject_gz���폜
    UNIX�p�C���X�g�[���X�N���v�g���C��
    gzip�������ƋN�����Ȃ��悤�ɕύX
    �w���v�t�@�C���ƃw���v�̃C���X�g�[���@�\��ǉ�
    �O���u���E�U�ɂ��Q��URL�̓W�J�菇���C��(%�̖��)
    noquery_quit=0�̎��ɂ͕K��query_write����悤�ɕύX
  �� 18-Apr-2002 (1.3h-rc3)
    �h�L�������g�̐������C�����K�v�v����ǉ�
    chalice_writeoptions�𓱓�
    �����݃o�b�t�@�ł̓�d���p��ʂ̐F�ŋ���
    <C-C><CR>��gui_running�ȊO�ł��g����悤�ɕύX(MacOS X�΍�)
    �I��/�I�t���C�����[�h�ؑ֎��Ƀ��b�Z�[�W�ł��\��
  �� 16-Apr-2002 (1.3g-rc2)
    ���̎Q�Ƃ�alice.vim�֎���
    �����ݎ���&��&amp;�ɒu��
    �N���b�v�{�[�h�ɂ�������URL�𑗂�̂������
    �����݃o�b�t�@��'bufhidden'�ݒ������(Chalice�g�p����cd�ɂ��G���[�����)
    ��d���p��ʂ̐F�ŋ���
    ��GUI����<S-CR>��<C-CR>�����ꂼ��<C-S><CR>��<C-C><CR>�ɕύX
    �����݃o�b�t�@�ł�<C-X>�𖳌��ɂ���
    dat�擾�ς݂̃X�����ꗗ����x�֓o�^�ł��Ȃ����C��
    �x�ւ̓o�^�������ɂȂ��Ă��������C��
    :Article {n}�R�}���h�ǉ�
  �� 14-Apr-2002 (1.3f-rc1)
    subject.txt.gz�ɑΉ�(����J�ϐ�chalice_nosubject_gz��chalice.vim�Q��)
    HttpDownload()��http���U���g�X�e�[�^�X���A���悤�ɉ���
    http://������URL(www.kaoriya.net�̂悤�ȕ\�L)���J����悤�ɕύX
    �O���u���E�U�ŊJ������URL��AL_quote()����悤�ɕύX
    �ꕔ�̊֐���alice�ֈړ�
    chalice_columns�����ݒ�̎��A�I������'columns'�𕜋A���Ȃ��悤�ɕύX
    /\?�ɕ\�L�𓝈�
    �\�L���ꂽhttps�ɑΉ�
    �ꗗ����x�֒��ړo�^���ł��Ȃ������C��
    'cmdheight' < 2�ŋN�����ɞx���N������ƃ��b�Z�[�W��pause��������C��
  �� 13-Apr-2002 (1.3e-beta)
    �����ݒ�
    �ԍ����O���u���E�U�𓱓� chalice_exbrowser_{n}��{n}<S-CR>�ŋN������
    �N�����̓���ݒ�ϐ�(chalice_startupflags)��ǉ�
    �N�����̃X���̞x�N�����T�|�[�g
    �I�t���C���@�\��ǉ�
    ���ǂ��ł̓X����"���M"��","�ɒu������悤�ɕύX
    �X���ꗗ�ŁA���X�����E�ɂ���Ă����o�O���C��
  �� 12-Apr-2002 (1.3d-beta)
    �����݃o�b�t�@��comments��ݒ�
    chalice_statusline�ɂ�荀�ڂ�ǉ��\�ɉ���
    �X���̕\�����������c��������
    subject��&quot;�ɑΉ�
    ������΂�subject/dat�ǂݑΉ��B
    euc-jp�������������邱�Ƃ���iconv�����܂�����?
  �� 11-Apr-2002 (1.3c-beta)
    OpenThread()�Ő������ꂽURL���N���b�v�{�[�h�փR�s�[
    ����URL Encoder�̓���
    �����݃o�b�t�@�ł� q, Q (Chalice�I��)�𖳌���
  �� 10-Apr-2002 (1.3b-beta)
    �ꗗ�̔��ɋ󔒂������悤�ɂ���
    �����ݎ��̊m�F���ȗ�����ϐ�chalice_noquery_write�𓱓�
    host�̉��ߖ@��ύX�B�T�O�I�ɂ�bbsroot��������
    �ϐ�chalice_foldmarks�𓱓�
    2ch_write��formatoptions-=r��ǉ�
    alice.vim�Ɉڍs���J�n
  �� 09-Apr-2002 (1.3a-beta)
    �u���ǂ��v���{���ł���悤�ɂ��Ă݂���
    �����I��subject.txt�̉��߂��t���L�V�u���ɂ��Ă݂�
    ���j���[��URL��W���ȊO�ɐݒ�\��(�ϐ�chalice_menu_url)
    �����ݎ���cookie�𗘗p(�ϐ�chalice_curl_cookies = 0�Ŗ�����)
    ���`�@���C��
    1.2.2���p�b�P�[�W�ɔ��f����Ă��Ȃ����������C��

��L
  Chalice�́u�`�����X�v�Ɣ������܂��B�������Ђ��΁u�t�E���t�v�Ƃ����Ӗ��ɂȂ�
  �܂��B�J���R�[�h���uAlice�v�ɂ����������Ƃ����P���ȓ��@����A������ƃq�l��
  ������/\calice�Ŏ��������������Ƃ���A���̖��O���Ђ�������܂����B2ch�̃u��
  �E�U�Ƃ������Ƃ�����A��C���ǂ������Ȃ̂�Chalice�Ɍ��肵�܂����B����Ȍo��
  �̖��O�Ȃ̂Łu�����˂�A���X�v�Ƃ��u�A���X�����v�Ƃ��A�Ăт₷�����O�Ō�
  ��ł�����Č��\�ł��B�����Ɨǂ����O����������ς����Ⴄ��������܂���B

-------------------------------------------------------------------------------
                  �����鎖�ւ̋����ӎu�������Ɏ����ƈقȂ鐶���������ԐS�ƂȂ�
                                   MURAOKA Taro/�������Y <koron@tka.att.ne.jp>
 vim:set ts=8 sts=2 sw=2 tw=78 et ft=memo:
