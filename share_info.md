# 共有情報
## プレビューの開き方
`ctrl` + `k` を押してから  
`v` を押す
## auto_routeが見つからない場合
コマンドで下記を実行
```sh
flutter pub get
```

## 背景色について
`main.dart`
```dart
theme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.lightBlue[800]
)
```
基本的にここで指定する。