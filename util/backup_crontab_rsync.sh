#!/bin/bash

# 定义源文件夹和备份文件夹路径
SOURCE_FOLDER="$HOME/code/hr-vlm"
BACKUP_FOLDER="$HOME/backup"

# 创建备份文件夹（如果不存在）
mkdir -p "$BACKUP_FOLDER"

# 获取当前时间戳
TIMESTAMP=$(date +%Y%m%d%H%M%S)

# 执行rsync备份
rsync -a --delete --progress --log-file="$BACKUP_FOLDER/hr-vlm.log" "$SOURCE_FOLDER" "$BACKUP_FOLDER/hr-vlm-backup_$TIMESTAMP"

# 保留最新的三份备份，删除旧的备份
cd "$BACKUP_FOLDER"
ls -dt hr-vlm-backup_* | tail -n +4 | xargs rm -rf

#chmod +x backup_crontab_rsync.sh
#export EDITOR="/usr/bin/vim" ; crontab -e
#0 4 * * * /home/zhangjun/code/Linux-Config/util/backup_crontab_rsync.sh