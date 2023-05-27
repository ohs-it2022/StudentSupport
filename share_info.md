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
- [新しいページを追加した場合](#新しいページを追加した場合)
- [背景色について](#背景色について)
- [各ファイルの説明](#各ファイルの説明)
- [sample.dart 各ウィジェットの使い方](#sampledart-各ウィジェットの使い方)
  - [ドロップダウンメニュー](#ドロップダウンメニュー)
    - [初期値が`要素1`の場合](#初期値が要素1の場合)
    - [初期値が`要素2`の場合](#初期値が要素2の場合)
  - [ボトムオーバーレイ](#ボトムオーバーレイ)
    - [OverlayEntryをつくる](#overlayentryをつくる)
    - [showOverlayを作る](#showoverlayを作る)
    - [hideOverlayを作る](#hideoverlayを作る)
- [画面間の移動](#画面間の移動)
- [データの扱い](#データの扱い)
  - [データを保存](#データを保存)
  - [データを取得](#データを取得)
  - [データを削除](#データを削除)
  - [JSONに変換する](#jsonに変換する)
    - [JSONで保存](#jsonで保存)
    - [JSONから元の状態に戻す](#jsonから元の状態に戻す)
  - [データ構造](#データ構造)

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

## 新しいページを追加した場合
``` sh
flutter packages pub run build_runner build
```

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

### ボトムオーバーレイ
- オーバーレイごとにOverlayEntryを作る必要がある
- オーバーレイごとにshowOverlay,hideOverlayの関数を作る必要がある
- heightに画面の何割の高さかを指定する。5割の場合 0.5
- contentにオーバーレイの内容を指定する
- hideFuncにhideOverlay関数を指定する
- bgcolorに背景色を指定できる

#### OverlayEntryをつくる
```dart
OverlayEntry overlayEntry = OverlayEntry(
  builder: (BuildContext context) {
    return BottomOverlay(
      height: 0.6, 
      content: Center(child: Material(child: Text('text'),),)
    );
  },
);
```

#### showOverlayを作る
```dart
void showOverlay(BuildContext context) {
  Overlay.of(context).insert(overlayEntry);
}
```

#### hideOverlayを作る
```dart
void hideOverlay() {
  overlayEntry.remove();
}
```


## 画面間の移動
- 下記を呼び出してスコープ付きルーターを取得する
```dart
AutoRouter.of(context)
// または
context.router
```

- 新しいエントリーをページスタックに追加
```dart 
router.push(const BooksListRoute())
// pathを使う場合
router.pushNamed('/books') 
```

## データの扱い
### データを保存
```dart
final SharedPreferences prefs = await SharedPreferences.getInstance();
await prefs.setString('KEY_STRING', 'HELLO'); // 文字列
await prefs.setBool('KEY_BOOL', true); // true/false
await prefs.setInt('KEY_INT', 99999); // int
await prefs.setDouble('KEY_DOUBLE', 1.2345); // double
```

### データを取得
```dart
final SharedPreferences prefs = await SharedPreferences.getInstance();
final String? vString = prefs.getString('KEY_STRING');
final bool? vBool = prefs.getBool('KEY_BOOL');
final int? vInt = prefs.getInt('KEY_INT');
final double? vDouble = prefs.getDouble('KEY_DOUBLE');

// 初期値を記述したい場合は ?? (if null) を使うと便利です
final String vString = prefs.getString('KEY_STRING') ?? 'DEFAULT';
```

### データを削除
```dart
final SharedPreferences prefs = await SharedPreferences.getInstance();
await prefs.remove('KEY_STRING');
```

### JSONに変換する
SharedPreferencesで端末に保存できる値は、   
int、double、bool、String、List<String> の型のみ

複雑なListの場合は、それをJSONに変換してStringとして保存する。

#### JSONで保存

```dart
import 'package:shared_preferences/shared_preferences.dart';

  Future<void> setObjectList(List<T> objectList) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(objectList).toString();
    await _prefs.setString('TEST', jsonString);
  }
```

#### JSONから元の状態に戻す
値を取得した後は、その文字列をJSONに戻して、リストにする。

```dart
  Future<List<T>> getObjectList() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final jsonString = _prefs.getString('TEST') ?? "";
    final List<dynamic> decodedJson = jsonDecode(jsonString);
    final objectList = decodedJson.map((e) =>Object.fromJson(e)).toList();
    return objectList;
  }
```

### データ構造
| データ名         | 内容                                        | データ型   |
| ------------ | ----------------------------------------- | ------ |
| maxNum       | 最大の時間割数                                   | Int    |
| theme        | ダーク、ライトを選べる。(dark, light)                 | String |
| timeTable    | [ [月曜日の時間割], [火曜日の時間割], ... , [土曜日の時間割] ] | JSON   |
| existenceSat | 土曜日が存在するか                                 | bool   |
| task         | 課題情報<br> [ [タイトル,締め切り日,内容,教科], ... ]      | List   |
| startTime    | 各時間の開始時間<br>[1時間目の開始時間, 2時間目の開始時間, ...]   | List   |
| endTime      | 各時間の終了時間<br>[1時間目の終了時間, 2時間目の終了時間, ...]   | List   |
| {教科の表示名}     | 教科情報<br> [教科正式名称,担当教師,教室名]           | List   |
|              |                                           |        |

