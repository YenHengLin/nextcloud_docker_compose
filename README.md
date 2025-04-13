# nextcloud_docker_compose
## 專案說明
* 此專案主要是給想使用的人一鍵生成 nextcloud 服務
## 專案使用
* 本專案 clone 之後, 執行時先把 start.sh 更改權限
    `sudo chmod +x start.sh`
* 在進行執行 `sudo ./start.sh`

## 參數修改
### docker-compose.yml
* docker-compose 綁定的 port 是 "127.0.0.1:3001", 可以根據使用者愛好綁定到其他端口
  
### start.sh
* EXTERNAL_DIR 是用來設定外部連接硬盤, 如果修改了位置則 docker-compose.yml 則要修改 volume external bind 的位置
* INTERNAL_DIR 是用來設定 wsl 連接的硬盤符, 如果修改了位置則 docker-compose.yml 則要修改 volume internal bind 的位置

## TODO 補充 NGINX DUCKDNS 設定



