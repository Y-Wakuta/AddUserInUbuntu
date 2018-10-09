#!/bin/bash

#=======================================================
#このスクリプトはあるユーザのhomeディレクトリに置かれることを想定する
#引数1 user名
#引数2 public keyファイルのpath
#=======================================================
set -e

user_name=$1
pub_key_path=$2

useradd -s /bin/bash -m $user_name
mkdir -p /home/$user_name/.ssh
touch /home/$user_name/.ssh/authorized_keys
cat $pub_key_path > /home/$user_name/.ssh/authorized_keys

chown $user_name:$user_name /home/$user_name
chown -R $user_name:$user_name /home/$user_name/.ssh

chmod 755 /home/$user_name
chmod -R 700 /home/$user_name/.ssh
chmod 600 /home/$user_name/.ssh/authorized_keys
