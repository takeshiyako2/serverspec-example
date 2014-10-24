# serverspec-example

## init

```
$ bundle
```

## run test


コマンドの一覧を表示

```
$ rake -T
rake serverspec         # Run serverspec to all hosts
rake serverspec:front1  # Run serverspec to 100.100.100.101
rake serverspec:front2  # Run serverspec to 100.100.100.102
rake serverspec:mysql1  # Run serverspec to 100.100.100.104
rake serverspec:redis1  # Run serverspec to 100.100.100.103
```

すべてのホストをテスト

```
$ rake serverspec
```

任意のホストをテスト

```
$ rake serverspec:front1
```

## see also 

Resource Types  
http://serverspec.org/resource_types.html

serverspecのリソースタイプ・マッチャー (※若干書式が古いので注意)
http://qiita.com/ando-masaki/items/e02960789c7a4e0c4d20

serverspec のテストをホスト間で共有する方法
http://mizzy.org/blog/2013/05/12/1/
