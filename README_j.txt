Chalice �`2�����˂�{���v���O�C�� for Vim�` �戵������
                                                            Since: 16-Nov-2001
                                                                  Version: 1.6
                                                 Author: MURAOKA Taoro (KoRoN)
                                                     Last Change: 06-Aug-2002.

�T�v
  Vim���2�����˂�̌f�����{�����邽�߂̃v���O�C���ł��BVim���������̂ł�
  ��΂ǂ�OS�ł������悤�ɑ��삷�邱�Ƃ��ł��܂��B�X���b�h�𗧂Ă邱�Ƃ͂ł���
  ����B�ꕔ2�����˂�ȊO�̌f�����{�����邱�Ƃ��\�ȏꍇ������܂����A�K
  �������ǂݏ����ł���Ƃ͊��҂��Ȃ��ł��������B�܂�����̌f���ւ̑Ή���v�]
  ����Ă��ʏ�͑Ή����������˂܂��B

  # �ȉ��̕����ł�Vim,vim,gvim���ȂǁA����قȂ����\�L������܂����A�ǂ����
  # ��Vim�Ƃ��čl���Ă��������B
  
�K�v�v��
  Chalice�𗘗p����ɂ͈ȉ��̂��̂��K�v�ɂȂ�܂��B1�ł�������Ɨ��p�o���܂�
  ��̂ŗ\�ߓ��肵�C���X�g�[�����Ă����Ă��������B
    1. Vim      (�e�L�X�g�G�f�B�^ 6.1�ȍ~)
    2. cURL     (HTTP�A�N�Z�X�\�t�g�E�F�A 7.9.4�ȍ~SSL����)
    3. gzip     (���k�����\�t�g)
  �����ɉ����Ă�Windows��2�����˂�ȊO�̌f�����{������ꍇ�ɂ́A�ʓr�\�t
  �g�E�F�A(4)���K�v�ɂȂ�ꍇ������܂��B
    4. iconv.dll
  UNIX�ł�Vim��+iconv�ŃR���p�C������ق����̃\�t�g�E�F�A���K�v�ɂȂ�܂��B
    5. qkc��nkf (�����R�[�h�ϊ��\�t�g�E�F�A qkc����)
  �e�K�{�\�t�g�E�F�A�̓���@�͈ȉ����Q�l�ɂ��Ă��������B

  (Vim�̓���)
    ���ɉ�����ׂ����Ƃ͂���܂��񂪁A�K��6.1�ȍ~���g�p���Ă��������B
    http://www.vim.org/�Q��

  (cURL�̓���)
    Chalice��2�����˂�̉{���Ə����݂�cURL�Ƃ����O���v���O�������g�p���Ă���
    ���B2�����˂�֐����������ނɂ�cURL��cookie�Ƃ����d�g�݂𗘗p����K�v��
    ����܂��B�Ƃ��낪cURL��7.9.4���Â��o�[�W�����ɂ͂���cookie�𗘗p�����
    �̕s����m���Ă��܂��B���̂��߂��̕s����C�����ꂽ�ŐV��(7.9.4�ȍ~)
    ���K�v�ł��BWindows�p��cURL�͈ȉ��̃A�h���X�̂��̂��g�p���Ă��������BUNIX
    �ł�cURL�̃T�C�g���ŐV�̃\�[�X�R�[�h���_�E�����[�h&�R���p�C�����Ďg�p��
    �Ă��������BMacOS X�ɂ͌�����Â�cURL���C���X�g�[������Ă��܂��̂ŁA���p
    ����ɂ͕ʓrcURL����肷��K�v������܂��B

    - Windows�p cURL (���艮�z�z��)
      http://www.kaoriya.net/dist/curl-7.9.8-win32-ssl.tar.bz2
      http://www.kaoriya.net/#ARCHIVE_CURL

    - cURL�I�t�B�V�����T�C�g (�\�[�X�R�[�h��)
      http://curl.sourceforge.net/
    
    - MacOS X�p cURL��� (.pkg/���{��)
      http://www.cosmos.ne.jp/~kaz6120/mclb/osx/curl_wget01.html

    - MacOS X�p cURL��� (Fink�v���W�F�N�g/�p��)
      http://fink.sourceforge.net/index.php

  (gzip�̓���)
    2�����˂�͋���Ȍf���ł���1���ɑ����̐l���K��邽�߁A��������c��ȃA
    �N�Z�X�ʂ����Ȃ��炸�^�c�̕��S�ɂȂ��Ă��܂��B���̕��S�������ł����炷����
    2�����˂�̓f�[�^�����k���đ��M���Ă��܂��B���̈��k���ꂽ�f�[�^��Ǎ���
    ���߂�Chalice��gzip�Ƃ����\�t�g�E�F�A�𗘗p���Ă��܂��Bgzip��UNIX��MacOS X
    �ł͕W���I�ɃC���X�g�[������Ă��܂��BWindows�̏ꍇ�͎��̃T�C�g����gzip��
    ����C���X�g�[�����邩�ACygwin�𐳂����C���X�g�[������K�v������܂��B

    - gzip.org (gzip�����)
      http://www.gzip.org/ Win�p�o�C�i�� http://www.gzip.org/gzip124xN.zip
    
    - Cygwin
      http://www.cygwin.com/

  (iconv)
    �����R�[�h�𐳂����������߂�iconv�Ƃ������C�u�������K�v�ł��BWindows�ł͉�
    ��URL������肵�Ă��������BUNIX�ł�+iconv�ŃR���p�C������K�v������܂��B
    MacOS X�͑Ή����Ă��܂�(�\��)�B

    - Windows�p iconv.dll (���艮�z�z��)
      http://www.kaoriya.net/dist/iconv-1.8-dll.tar.bz2
      http://www.kaoriya.net/#LIBICONV
    
    - iconv���C�u�����\�[�X�R�[�h
      http://www.gnu.org/directory/libiconv.html

  (qkc�̓���)
    UNIX��iconv�ł̓R�[�h�ϊ��ɑΉ�������Ȃ����ߕ����������邱�Ƃ�����܂��B
    ����ɑΉ����邽�߂ɕʓr�ɕ����R�[�h�ϊ��O���v���O����qkc��nkf���K�v�ƂȂ�
    �܂��B���ɕϊ����x�̗ǂ�����qkc�𐄏����܂��B���L�̃T�C�g���\�[�X���_�E
    �����[�h���ăC���X�g�[�����Ă��������B

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
    3. Vim���N�����Ď��̂悤�Ƀ^�C�v���܂��B
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
       Vim���N�����Ď��̃R�}���h���^�C�v�����Chalice���N�����܂��B
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
  �s�Ȃ��Ă���΁A���̃R�}���h�Ńw���v���m�F�ł��܂��B
    :help Chalice
  �`���[�g���A��������܂��̂ŏ��߂Ďg���l�͕K���m�F���Ă��������B�ʏ�A�w���v
  �t�@�C����:Chalice���s���Ɏ����I�ɃC���X�g�[������܂��B
  q ��������Chalice�͏I�����܂��B�킩��Ȃ����Ƃ��������ۂɂ́A�܂��w���v�t�@
  �C�����������������B

�p�b�`�����
  ���������[�X��Ɏ{���ꂽ�o�O�C����@�\�g���ɂ��ẮA�p�b�`�̌`�Œ񋟂���
  ���B�ȉ���URL���Q�Ƃ��Ă�������:

  - Chalice�p�p�b�`�u����
    http://www.kaoriya.net/testdir/patches-chalice


���p����
  �ȉ��̏������ɍ��ӂ��ꂽ���֖{�\�t�g�E�F�A�̗��p����������܂��B

    �{�\�t�g�E�F�A�𗘗p���邱�ƂŁA�\�t�g�E�F�A���p�҂ɂ̓\�t�g�E�F�A�쐬�҂�
    �Ή����x�����`���������܂���B

    �{�\�t�g�E�F�A�̕s����\�t�g�E�F�A�쐬�҂֕񍐂��ꂽ�ꍇ�ɂ́A�\�t�g�E�F
    �A�쐬�҂͊��Ԃ����肹���ɖ{�\�t�g�E�F�A���C�����܂����A�C���O����킸�{
    �\�t�g�E�F�A�̗��p�ɍۂ��Đ��������Q���\�t�g�E�F�A�쐬�҂͕⏞���܂���B

    �\�t�g�E�F�A���p�҂͖{�\�t�g�E�F�A���A���p�E�񏤗p���킸�A�g�p�E�Ĕz�z��
    �邱�Ƃ��ł��܂��B
    
    �\�t�g�E�F�A���p�҂ւ͖{�\�t�g�E�F�A�����ς��錠�����\�t�g�E�F�A�쐬�҂��
    �^�����܂��B�A���{�\�t�g�E�F�A�։��ς��{�����o�[�W�������Ĕz�z����ꍇ��
    �́A���ϓ��e�y�т��̎������@���\�t�g�E�F�A�쐬�҂֖������ŊJ������`������
    ���܂��B

  �ȏ�̏������ɍ��ӂł��Ȃ��ꍇ�͖{�\�t�g�E�F�A�̗��p�𒆎~���Ă��������B

�����v�]�̘A����
  2�����˂�A���[���A��������Vim�f���ł��肢���܂��B���ǈĂ�����l�͉�����
  �Ȃ��ŘA�����Ă��������B���Ƀp�b�`�͑劽�}�ł��B�v�]�������ƕK��������������
  �Ƃ͕ۏ؂ł����˂܂��B

  - Vim�f����
    http://www.kaoriya.net/bbs/bbs.cgi

  - ������email�A�h���X
    koron@tka.att.ne.jp

  - 2ch/�\�t�g�E�F�A��/�y2ch�{���zChalice for Vim
    Vol.2  http://pc.2ch.net/test/read.cgi/software/1021773436/l50
    Vol.1  http://pc.2ch.net/software/kako/1006/10068/1006852780.html
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
  �� 06-Aug-2002 (1.6������)
    (1.5.025)�N���u�b�N�}�[�N�ŃJ�[�\�����ړ�+�N��AA�֐���
    (1.5.024)�N�����Chalice�R�}���h�𖳌��ɂ��� and etc.
    (1.5.023)�N��AA��MacOSX�œ��삳���邽�߂ɔ��C��
    (1.5.022)�N��AA��������ɂ��킹���C��
    (1.5.021)�A�j���[�V�����ɖڏ����������̂œ���
    (1.5.020)�N��AA���A�j���[�V������������c���s�����̂ŃC���g������
    (1.5.019)�N��AA��\��
    (1.5.018)'nostartofline'���ŃX�����`��ɃJ�[�\�����\�����ʏꏊ�֔��
    (1.5.017)�X�������X�V�������ɃJ�[�\���ʒu���Y��������C��
    (1.5.016)�E�B���h�E�̎����T�C�Y���������~�߁B<C-L>�Ŏ蓮�����ɂ���B
    (1.5.015)wincmd���g�p����悤�ɕύX
    (1.5.014)Chalice2HTML�ɓn�����Ƃ̂ł�������̌`�����g��
    (1.5.013)���s�R�}���h������ɓ��ꕶ�����܂܂��ہA�G���[�ɂȂ�̂����
    (1.5.012)JBBS�n�͈͎̔w�肪�����������Ȃ����Ƃ��������̂��C��
    (1.5.011)�������݃`�����N��time�l��key�łȂ�localtime()�ł���ׂ��B
    (1.5.010)�x�o�^URL��/l50��LAST=50���t���Ȃ��悤�ɏC��
    (1.5.009)JBBS/�܂�/�������(HTML2DAT)�ւ̑Ή�
    (1.5.008)������HTML���҂��̃X���ֈړ��ł��Ȃ��o�O���C���B
    (1.5.007)�K�v�̂Ȃ� / ���폜
    (1.5.006)typo�ɂ�荷���X�V���ł��Ȃ��Ȃ��Ă����̂��C��
    (1.5.005)DAT��HTML���@�\��ǉ�
    (1.5.004)URL���J���̂�!���g�����Ƃ��ł���悤�ɂ���
    (1.5.003)nkf�̗L���`�F�b�N�������Ă��Ȃ������̂��C��
    (1.5.002)AL_hascmd()�������������ĂȂ�����
    (1.5.001)bufhidden�I�v�V������=delete��⊮

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
