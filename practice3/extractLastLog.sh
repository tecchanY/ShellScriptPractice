#!/bin/bash

chmod +x extractLastLog.sh

LINENUM=0 #�J�n�s
COMMAND=`tail -n +$LINENUM log_example.txt` #-n�R�}���h�ŏo�͂���s�����w��
LINEDATA="" #1�s�����i�[����ϐ�
FIRSTROW=true #�J�n�s�t���O

while read line
do
  if ${FIRSTROW}
  then
    LINEDATA=${line}
    FIRSTROW=false
    continue
  fi

  if [[ $line =~ START ]]
  then
    #���O�̊J�n�s�͉������Ȃ�
    continue
  elif [[ $line =~ END]]
  then
    #���O�̏I���s
    #sed -e�ŃX�N���v�g�ǉ����Acut��-d�I�v�V�����ŋ�؂蕶���̎w��A-f�I�v�V�����ŉ����ږڂ�\�����邩�w��
    result=$(echo ${line} | sed -e "s/^.*(\(.*\))/\1/g" | cut -d `,` -f 1) #�J�b�R���𒊏o���J���}��؂��1�ڂ��擾
    #���O���牽���擾�ł��Ȃ������Ƃ��A
    if [[ $result == 0 ]]
    then
      IFS_ORIGINAL=${IFS}
      IFS=, #���ϐ��̋�؂蕶�����J���}�ɕύX
      columns=$(echo ${LINEDATA} | sed -e "s/^.*(\(.*\))/\1/g") #�J���}��؂��������Ƃ��̂܂ܔz�񈵂��ɂȂ�
      IFS=${IFS_ORIGINAL} #���ϐ�IFS�����X�̋�؂蕶���ɖ߂�
      for v in ${columns[@]}
        #�����񒷂̃I�v�V������-n���ƕ����񒷂�0���傫���Ȃ�^�B-z�͕����񒷂�0�Ȃ�^
        do echo -n ${v}\;
      done
      echo
    fi
  else
    #�J�n�s�ł��I���s�ł��Ȃ���΍s��ϐ��ɑ��
    LINEDATA=${line}
  fi

#�q�A�h�L�������g�Ƃ���COMMAND
done << EOF
  ${COMMAND}
EOF

# �J�n�s�͓s�x�ς���悤�ɂ������̂ŕϐ���
# �J�n�I�����O�ɋ��܂ꂽ���O�̃J�b�R���̕����𒊏o����
# ���o�����J�b�R���̕����̓J���}��؂�Ȃ̂ŁA�������Ĕz���
