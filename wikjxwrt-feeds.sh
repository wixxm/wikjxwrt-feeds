#!/bin/bash

# 配置 GitHub 账户信息
YOUR_USERNAME="wixxm"        # GitHub 用户名
YOUR_REPO="wikjxwrt-packages"                # GitHub 仓库名
TARGET_REPO="git@github.com:$YOUR_USERNAME/$YOUR_REPO"
TARGET_DIR="/opt/github/$YOUR_REPO"


# 清理并创建工作目录
rm -rf $TARGET_DIR
mkdir -p $TARGET_DIR
cd $TARGET_DIR

# 克隆你的 GitHub 仓库并切换到默认分支
git clone $TARGET_REPO .
default_branch=$(git remote show origin | sed -n '/HEAD branch/s/.*: //p')
git checkout -B "$default_branch"


# 配置提交者身份信息（如果未配置）
git config user.name "wixxm"      # 替换为你的 GitHub 用户名
git config user.email "419691642@qq.com" # 替换为你的 GitHub 绑定邮箱

# 函数：同步特定文件夹
sync_repo_folder() {
  local repo_url=$1
  local branch=$2
  local folder_name=$3
  local target_folder=$4

  # 创建临时目录
  TEMP_DIR=$(mktemp -d)
  git clone --depth=1 --branch $branch $repo_url $TEMP_DIR
  cd $TEMP_DIR

  # 如果只需要特定子目录
  if [[ "$folder_name" != "." ]]; then
    mkdir -p "$TARGET_DIR/$target_folder"
    rsync -av --exclude='.git' "$folder_name/" "$TARGET_DIR/$target_folder"
  else
    # 否则同步整个仓库
    mkdir -p "$TARGET_DIR/$target_folder"
    rsync -av --exclude='.git' "./" "$TARGET_DIR/$target_folder"
  fi

  # 清理临时目录
  cd ..
  rm -rf $TEMP_DIR
}

# 同步指定文件夹
sync_repo_folder "https://github.com/sbwml/luci-app-mosdns.git" "v5" "mosdns" "mosdns"
sync_repo_folder "https://github.com/sbwml/luci-app-mosdns.git" "v5" "luci-app-mosdns" "luci-app-mosdns"
sync_repo_folder "https://github.com/sbwml/luci-app-mosdns.git" "v5" "v2dat" "v2dat"
sync_repo_folder "https://github.com/nikkinikki-org/OpenWrt-nikki.git" "main" "nikki" "nikki"
sync_repo_folder "https://github.com/nikkinikki-org/OpenWrt-nikki.git" "main" "luci-app-nikki" "luci-app-nikki"
sync_repo_folder "https://github.com/vernesong/OpenClash.git" "master" "luci-app-openclash" "luci-app-openclash"
sync_repo_folder "https://github.com/wixxm/luci-theme-argon.git" "main" "luci-app-argon-config" "luci-app-argon-config"
sync_repo_folder "https://github.com/destan19/OpenAppFilter.git" "master" "luci-app-oaf" "luci-app-oaf"
sync_repo_folder "https://github.com/destan19/OpenAppFilter.git" "master" "oaf" "oaf"
sync_repo_folder "https://github.com/destan19/OpenAppFilter.git" "master" "open-app-filter" "open-app-filter"
sync_repo_folder "https://github.com/wixxm/wikjxwrt-app.git" "main" "luci-app-arpbind" "luci-app-arpbind"
sync_repo_folder "https://github.com/wixxm/wikjxwrt-app.git" "main" "luci-app-cpu-status" "luci-app-cpu-status"
sync_repo_folder "https://github.com/wixxm/wikjxwrt-app.git" "main" "luci-app-diskman" "luci-app-diskman"
sync_repo_folder "https://github.com/wixxm/wikjxwrt-app.git" "main" "luci-app-mwan3helper" "luci-app-mwan3helper"
sync_repo_folder "https://github.com/wixxm/wikjxwrt-app.git" "main" "luci-app-netdata" "luci-app-netdata"
sync_repo_folder "https://github.com/wixxm/wikjxwrt-app.git" "main" "luci-app-poweroffdevice" "luci-app-poweroffdevice"
sync_repo_folder "https://github.com/wixxm/wikjxwrt-app.git" "main" "luci-app-ramfree" "luci-app-ramfree"
sync_repo_folder "https://github.com/tty228/luci-app-wechatpush.git" "master" "." "luci-app-wechatpush"
sync_repo_folder "https://github.com/wixxm/luci-app-wrtbwmon.git" "master" "luci-app-wrtbwmon" "luci-app-wrtbwmon"
sync_repo_folder "https://github.com/wixxm/wrtbwmon.git" "master" "wrtbwmon" "wrtbwmon"
sync_repo_folder "https://github.com/wixxm/wikjxwrt-app.git" "main" "luci-theme-argon" "luci-theme-argon"
sync_repo_folder "https://github.com/wixxm/wikjxwrt-app.git" "main" "pdnsd-alt" "pdnsd-alt"
sync_repo_folder "https://github.com/sirpdboy/luci-app-ddns-go.git" "main" "ddns-go" "ddns-go"
sync_repo_folder "https://github.com/sirpdboy/luci-app-ddns-go.git" "main" "luci-app-ddns-go" "luci-app-ddns-go"
sync_repo_folder "https://github.com/gdy666/luci-app-lucky.git" "main" "luci-app-lucky" "luci-app-lucky"
sync_repo_folder "https://github.com/gdy666/luci-app-lucky.git" "main" "lucky" "lucky"
sync_repo_folder "https://github.com/wixxm/wikjxwrt-app.git" "main" "luci-app-fileassistant" "luci-app-fileassistant"
sync_repo_folder "https://github.com/wixxm/wikjxwrt-app.git" "main" "luci-app-ota" "luci-app-ota"

