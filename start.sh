#!/bin/bash
set -e

# 取得原始使用者（不是 root，而是執行 sudo 的人）
REAL_USER=${SUDO_USER:-$USER}

# ==== 參數區（修改這裡就好） ====
EXTERNAL_DIR="/mnt/d/nextcloud_external"                      # 外部儲存空間（D 槽）
INTERNAL_DIR="/home/henry/Work/nextcloud/nextcloud_data/html" # WSL 儲存空間

# ==== 開始執行 ====
echo "🔧 正在建立目錄..."
mkdir -p "$EXTERNAL_DIR"
mkdir -p "$INTERNAL_DIR"

echo "🔑 設定目錄擁有者為 $REAL_USER ..."
chown -R "$REAL_USER:$REAL_USER" "$EXTERNAL_DIR"
chown -R "$REAL_USER:$REAL_USER" "$INTERNAL_DIR"

# 確保 docker-compose 存在
command -v docker-compose >/dev/null 2>&1 || {
  echo "❌ docker-compose 未安裝，請先安裝後再試。"
  exit 1
}

# 啟動容器
echo "🚀 啟動 docker-compose ..."
docker-compose up -d

echo "✅ 啟動完成！"
