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

## Heroku 用の Docker build

stackでdocker imageを作成すると`CMD`が指定されないので、Heroku用のdocker imageを別に作成する。(もっといい方法があるに違いない)

```bash
# herokuには前もってログインしておく
# 参考: https://devcenter.heroku.com/articles/container-registry-and-runtime

# heroku用docker imageの作成
docker build ./ -t try-scotty-heroku
docker tag try-scotty-heroku registry.heroku.com/"ここにHeroku App名"/web
docker push registry.heroku.com/"ここにHeroku App名"/web
heroku container:release web

# ブラウザでHeroku Appを開く
heroku open
```
