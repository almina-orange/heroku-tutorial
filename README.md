# heroku-tutorial

## Note
- Heroku Tutorial (description how to use Heroku)
- Heroku の使い方・始め方

## How to startup?
単純なイメージとしては「作成した Heroku 上のアプリケーションが持ってる git リポジトリにプログラムを push する」だけ．
heroku app は仮想環境で，その上にプログラムを置くイメージで良い．
自分の GitHub リポジトリと連携させたりもできる．
なので，どの GitHub リポジトリを連携させるか（置くか）次第で変えられる．
（ただし heroku app のリポジトリを強制上書きする．）

1. heroku CLI をインストールする

    ```bash
    $ brew heroku install
    $ heroku --version  # heroku がインストールされたことを確認
    $ heroku login  # heroku にログイン
    ```

2. 自分の GitHub 上にリポジトリを用意する

    ```bash
    # webブラウザ経由でリポジトリを作成
    $ git clone [$URL]
    ```

3. heroku app を作成

    ```bash
    # webブラウザで作成しても良い
    $ heroku create [$APP_NAME]
    ```

4. 作成した heroku app に紐付けされているリモートリポジトリへ push する
    - heroku app に push するブランチは必ず `master` にすること（それ以外のブランチでは反映されない）

    ```bash
    # app を作成すると remote リポジトリに `heroku` が追加される
    # `heroku` が見つからない場合は `remote add` で追加する
    # このリポジトリに push することで反映される
    $ git push heroku master
    ```

5. 作成した heroku app を開いて反映されているか確認
    - 何も作成していない場合は Welcome page が表示される
    - `sample-apps`にサンプルコードがあるので試してみる

Note
- heroku app と連携する GitHub リポジトリを変更する場合は以下の操作を行う（非推奨）

    ```bash
    # 強制的に heroku app のリモートリポジトリを上書きする
    $ git push -f heroku master

    # Buildpacks が異なる場合は heroku app を一度消してから再作成
    $ heroku apps:destroy [$APP_NAME] && heroku apps:create [$APP_NAME]
    ```


## How to add database?
### PostgressSQL
#### GUI
1. App一覧からDBを追加したいアプリケーションを開く
2. `Addon`から`Heroku Postgress`を追加

#### CLI
1. `heroku addons:add`でアドオンを追加する

    ```bash
    # 追加されている addon を確認
    $ heroku addons

    # addon の追加と削除コマンド
    $ heroku addons:add heroku-postgresql
    $ heroku addons:remove heroku-postgresql

    # DBガ追加されていることを確認，環境変数が出力される
    $ heroku config
    ```

### MySQL (MariaDB)


## How to use database? (tutorial)
ここでは，データベースに以下のようなテーブルを作成する．
また，ここでの説明は PostgreSQL のコンソール上での扱い方に留まる．
プログラムによる扱い方は[こちら](https://github.com/almina-orange/simple-SQL-injection.git)を参照すること．
なお，他のデータベースでも基本的な操作は同じである．

| id | name | age | password |
| :-: | --- | :-: | --- |
| 1 | 山田太郎 | 28 | yamada |
| 2 | 佐藤隆 | 36 | sato |
| 3 | 斎藤達弘 | 46 | saito |
| 4 | 桜井さつき | 22 | sakurai |

以下で説明する一連の手順は`db_init.sql`で確認することも可能．

```bash
# PostgreSQL のコンソール上でSQLスクリプトを実行する
$ \i db_init.sql
```

1. データベースへの接続

    ```bash
    # `psql` がローカル環境にインストールされている必要あり
    # [$APP_NAME] に追加されたDBにログイン
    $ heroku pg:psql --app [$APP_NAME]
    ```

2. テーブルの作成

    ```sql
    -- 上記の表を作成する
    $ create table sample(
    $ id integer not null,
    $ name varchar(100) not null,
    $ age integer,
    $ password varchar(20),
    $ primary key (id)
    $ );
    ```

3. データの挿入

    ```sql
    -- 挿入の一例
    $ insert into sample (id,name,age,password) values (1,'山田太郎',26,'yamada');
    $ insert into sample (id,name,age,password) values (2,'佐藤隆',34,'sato');
    $ insert into sample (id,name,age,password) values (3,'斎藤達弘',45,'saito');
    $ insert into sample (4,'渡辺さつき',28,'watanabe');
    ```

4. テーブル内容の確認

    ```sql
    $ select * from sample;
    $ select name from sample;  -- name だけを出力
    ```

5. データの更新

    ```sql
    -- '渡辺さつき' --> '桜井さつき' に変更
    $ update sample set name='桜井さつき' where id=4;
    $ update sample set password='sakurai' where id=4;
    ```

6. テーブルの削除

    ```sql
    $ drop table sample;
    ```

### Snippets
- PostgreSQL

    ```bash
    # データベースの一覧表示
    $ \c

    # テーブルの一覧表示
    $ \d
    ```
    
    ```sql
    --- テーブルの内容を全表示
    $ select * from [$TABLE];
    ```

------
## Reference
- Heroku初心者がHello, Herokuをしてみる - Qiita, [https://qiita.com/Arashi/items/b2f2e01259238235e187](https://qiita.com/Arashi/items/b2f2e01259238235e187)
- 無料でHerokuで簡単にDB[PostgreSQL]を作成する - ゼロからはじめるWEBプログラミング入門, [http://blog.w-hippo.com/entry/2017/03/01/Heroku%E3%81%A7%E7%84%A1%E6%96%99%E3%81%AEDB%28PostgreSQL%29%E3%82%92%E4%BD%9C%E6%88%90%E3%81%99%E3%82%8B](http://blog.w-hippo.com/entry/2017/03/01/Heroku%E3%81%A7%E7%84%A1%E6%96%99%E3%81%AEDB%28PostgreSQL%29%E3%82%92%E4%BD%9C%E6%88%90%E3%81%99%E3%82%8B)
- Homebrewを使ったPostgreSQLのインストール(Mac OS Lion) - Qiita, [https://qiita.com/tstomoki/items/0f1a930bd42a8e1fdaac](https://qiita.com/tstomoki/items/0f1a930bd42a8e1fdaac)
- コマンド1つでDBをアプリに追加できるのもPaaSの魅力！ Heroku Postgresの使い方 - CodeZine（コードジン）, [https://codezine.jp/article/detail/8279?p=1](https://codezine.jp/article/detail/8279?p=1)
- SQL入門 - PostgreSQLではじめるDB入門, [http://db-study.com/archives/category/sql%E5%85%A5%E9%96%80](http://db-study.com/archives/category/sql%E5%85%A5%E9%96%80)

## ToDo
- [ ] `heroku-tutorial/src`にサンプルコードを置いておく（各種言語）