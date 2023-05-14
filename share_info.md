<!-- omit in toc -->
# 共有情報
<!-- omit in toc -->
## プレビューの開き方
### windows VSCode
1. `ctrl` + `k` を押してから  
2. `v` を押す
<!-- omit in toc -->
## もくじ
- [パッケージのインストール方法](#パッケージのインストール方法)
  - [auto\_routeが見つからない場合](#auto_routeが見つからない場合)
- [背景色について](#背景色について)
- [各ファイルの説明](#各ファイルの説明)
- [sample.dart 各ウィジェットの使い方](#sampledart-各ウィジェットの使い方)
  - [ドロップダウンメニュー](#ドロップダウンメニュー)
    - [初期値が`要素1`の場合](#初期値が要素1の場合)
    - [初期値が`要素2`の場合](#初期値が要素2の場合)

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

## sample.dart 各ウィジェットの使い方
### ドロップダウンメニュー
- menuElemにメニューの要素を配列で入力 (数の制限はない)
- 初期表示したい要素はidxで指定できる
- 必要であれば、背景色指定などの機能は追加できる

#### 初期値が`要素1`の場合
```dart
DropdownButtonMenu(menuElem: ['要素1', '要素2', '要素3'])
```
#### 初期値が`要素2`の場合
```dart
DropdownButtonMenu(menuElem: ['要素1', '要素2', '要素3'], idx: 1)
```
