# try-scotty

Haskell の Scotty の練習

## Docker build

```bash
# ベースとなる docker image を pull
stack docker pull

# dockerでビルドする
stack build --docker

# docker imageの作成
stack image container --docker

# 実行
docker run -it --rm -p 3000:3000 try-scotty try-scotty-exe

# バックグラウンド実行
docker run -d -p 3000:3000 try-scotty try-scotty-exe
```
