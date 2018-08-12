# heroku-tutorial

## Note
- Heroku Tutorial (description how to use Heroku)
- Heroku の使い方・始め方

## How to startup?
1. heroku CLI をインストールする

    ```bash
    $ brew heroku install
    $ heroku --version  # heroku がインストールされたことを確認
    ```

2. 自分の GitHub 上にリポジトリを用意する

    ```bash
    # webブラウザ経由でリポジトリを作成
    $ git clone [$URL]
    ```

3. heroku app を作成

    ```bash
    $ heroku login
    $ heroku create [$APP_NAME]
    ```

4. 作成した heroku app に紐付けされているリポジトリへ push する
    - heroku app に push するブランチは必ず `master` にすること（それ以外のブランチでは反映されない）

    ```bash
    # app を作成すると remote リポジトリに `heroku` が追加される
    # このリポジトリに push することで反映される
    $ git push heroku master
    ```

5. 作成した heroku app を開いて反映されているか確認
    - 何も作成していない場合は Welcome page が表示される
    - `heroku-tutorial/src`にサンプルコードがあるので試してみる

------
## Reference
- Heroku初心者がHello, Herokuをしてみる - Qiita, [https://qiita.com/Arashi/items/b2f2e01259238235e187](https://qiita.com/Arashi/items/b2f2e01259238235e187)

## ToDo
- [ ] `heroku-tutorial/src`にサンプルコードを置いておく（各種言語）