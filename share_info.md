# 共有情報
## プレビューの開き方
`ctrl` + `k` を押してから  
`v` を押す

## もくじ
* [パッケージのインストール方法](#パッケージのインストール方法)
    * [auto_routeが見つからない場合](#auto_routeが見つからない場合)
* [背景色について](#背景色について)
* [各ファイルの説明](#各ファイルの説明)

## パッケージのインストール方法
1. `pubspec.yaml`にパッケージ名とバージョンを記載する
2. コマンドで下記を実行
```sh
flutter pub get
```

### auto_routeが見つからない場合
gitからクローンした時点で`pubspec.yaml`に記載されているから
```sh
flutter pub get
```
を実行する。

## 背景色について
`main.dart`
```dart
theme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.lightBlue[800]
)
```
ここで指定することで全体での統一が可能。  
ダークモードの切り替えなどもここでできそう。  
↓ もしかしたらヒントになるかも  
[Material Theme Builder で好みの色をアプリに組み込む](https://zenn.dev/10_tofu_01/articles/adopt_material_color_generotor)

## 各ファイルの説明
|ファイル名|内容|
---|---
|sample.dart|共通して使えそうなウィジェット、変数を格納する|