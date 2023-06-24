
MODULES=(aa1,aa2,aa3)
WORKSPACE=/root/.jenkins

DEST_DIR=/etc/ansible/roles/nginx/files/zhidiantianxia/weex_zhidian_test

cd $WORKSPACE

#  确保 publish 目录下面，没有任何内容 
if [ ! -d publish ]
then
    mkdir publish
else
    rm -rf publish/*
fi

#需要排除的目录写在下面的变量里，用|分隔
#exp_dir="publish|temp1|wyy-common|scholarship"
#all_dirs=`ls|grep -Ev $exp_dir`

OLD_IFS="$IFS"
IFS=","
all_dirs=($MODULES)
IFS="$OLD_IFS"

build_func(){

  echo 'Start ...................'
  echo $MODULES
  echo ${all_dirs[@]}
  echo 'End .....................'
for d in $*;
do
  echo  $d
done

}



build_func ${all_dirs[@]}


