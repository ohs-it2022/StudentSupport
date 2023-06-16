import 'dart:convert';
import 'dart:io';
import 'package:json_annotation/json_annotation.dart';
import 'package:path_provider/path_provider.dart';
part 'time_table_model.g.dart';

// 各科目の情報を格納する
@JsonSerializable()
class SubjectModel {
  String subject;
  String fullname;
  String room;
  String teacher;

  SubjectModel({required this.subject, required this.fullname, required this.room, required this.teacher});

  factory SubjectModel.fromJson(Map<String, dynamic> json) =>
    _$SubjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectModelToJson(this);
}

// 1日の授業を格納する
@JsonSerializable(explicitToJson: true)
class ClassesModel {
  String name;
  List<SubjectModel> data = [];

  ClassesModel({required this.name, required this.data});

  factory ClassesModel.fromJson(Map<String, dynamic> json) =>
    _$ClassesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClassesModelToJson(this);
}

// 1週間の授業を格納する
@JsonSerializable(explicitToJson: true)
class TimeTableModel {
  int id;
  List<ClassesModel> days = [];

  TimeTableModel({required this.id, required this.days});

  factory TimeTableModel.fromJson(Map<String, dynamic> json) =>
    _$TimeTableModelFromJson(json);

  Map<String, dynamic> toJson() => _$TimeTableModelToJson(this);
}

// 時間割を格納する
@JsonSerializable(explicitToJson: true)
class TTsModel {
  List<TimeTableModel> timetables = [];

  TTsModel(this.timetables);

  factory TTsModel.fromJson(Map<String, dynamic> json) =>
    _$TTsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TTsModelToJson(this);
}
////////////////////////////////////
//////// データ構造ここまで ////////
////////////////////////////////////




// データ操作用
// 使い方：
// import 'package:student_support/src/time_table_model.dart';
//  final _storage = TTsStorage();
// _storage.read(0, 0, 0);
// _storage.update(0, 0, 0, "DB22", "データベースII", "141教室", "山田先生");
// _storage.delete(0, 0, 0);
// 注意:
// データ変更系メソッドは、同時にいくつも呼び出すと不安定かも
class TTsStorage {

  // ファイルを生成
  // 呼び出す必要なし
  Future<String> fileInit(File file) async {
    await file.create();
    // 生成時の初期データ
    Map<String, dynamic> initialData = {}; // 完成データ
    Map<String, dynamic> mapElem1 = {}; // 単元情報
    List<dynamic> listElem1 = []; // 1日の授業
    List<dynamic> listElem2 = []; // 1週間の授業
    List<dynamic> listElem3 = []; // 時間割たち
    // 単元情報を格納する型
    mapElem1["subject"] = "";
    mapElem1["fullname"] = "";
    mapElem1["room"] = "";
    mapElem1["teacher"] = "";
    // 単元情報を並べて1日の授業の情報に
    for (var i = 0; i < 6; i++) {
      listElem1.insert(i, mapElem1);
    }
    // 1日の授業の情報を並べて週間の情報に
    final days = ["月", "火", "水", "木", "金", "土"];
    for (var i = 0; i < days.length; i++) {
      listElem2.insert(i, {"name": days[i], "data": listElem1});
    }
    // 時間割にidを付けて保存
    listElem3.insert(0, {"id": 0, "days": listElem2});
    // 初期データ完成
    initialData["timetables"] = listElem3;

    // ファイルに書き込み
    await file.writeAsString(json.encode(initialData));

    // 完了報告
    return "fileInit: created";
  }


  // ファイル取得
  // 呼び出す必要なし
  Future<File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File("$path/time_tables.json");
    // ファイルがなければ生成
    if(!await file.exists()) {
      await fileInit(file);
      // print("ファイルを新規作成したよ");
    }
    return file;
  }


  // 単元の情報を読み込むメソッド
  // SubjectModel　= read(時間割ID, 曜日, 時限)
  // 時間割ID : 0 を指定
  // 曜日     : 月曜日が0, 火曜日が1, ･･･
  // 時限     : 0～5
  // SubjectModel : {"subject": "", "fullname": "", "room": "", "teacher": ""}
  Future<SubjectModel> read(int id, int day, int time) async {
    if(id != 0) {
      print("read: idが0でなかったため、自動で0に設定しました");
      id = 0;
    }
    // ファイル取得
    final file = await getFile();

    if(await file.exists()) {
      final days = ["月", "火", "水", "木", "金", "土"];
      String jsonString = await file.readAsString();
      final readData = TTsModel.fromJson(jsonDecode(jsonString));
      final data = readData
                    .timetables.firstWhere((element) => element.id == id)
                    .days.firstWhere((element) => element.name == days[day])
                    .data[time];
      // 専用のデータ型になっちゃった
      // ちょっと分かりにくいかもしれないけど、末尾に「.」を付けたら何とかなる…？
      return data;
    }else{
      throw "read: file not found";
    }
  }


  // 単元の情報を書き換えるメソッド
  // update(時間割ID, 曜日, 時限, 科目表示名, 科目正式名称, 教室, 先生)
  // 時間割ID : 0 を指定
  // 曜日     : 月曜日が0, 火曜日が1, ･･･
  // 時限     : 0～5
  // 科目表示名, 科目正式名称, 教室, 先生 : 全てString型
  void update(int id, int day, int time, String subject, String fullname, String room, String teacher) async {
    if(id != 0) {
      print("update: idが0でなかったため、自動で0に設定しました");
      id = 0;
    }
    // ファイル取得
    final file = await getFile();

    if (await file.exists()) {
      // ファイル読み込み
      final jsonString = await file.readAsString();
      final days = ["月", "火", "水", "木", "金", "土"];
      // 書き換え後のデータ
      SubjectModel writeData = SubjectModel(subject: subject, fullname: fullname, room: room, teacher: teacher);
      // 書き換え前のデータ
      var data = TTsModel.fromJson(jsonDecode(jsonString));
      // 書き換え
      data
        .timetables.firstWhere((element) => element.id == id)
        .days.firstWhere((element) => element.name == days[day])
        .data[time] = writeData;
      // 保存
      await file.writeAsString(json.encode(data));
      // print("書き込みました");
    }else{
      throw "update: file not found";
    }
  }


  // 単元の情報を削除(初期化)するメソッド
  // delete(時間割ID, 曜日, 時限)
  // 時間割ID : 0 を指定
  // 曜日     : 月曜日が0, 火曜日が1, ･･･
  // 時限     : 0～5
  void delete(int id, int day, int time) {
    if(id != 0) {
      print("update: idが0でなかったため、自動で0に設定しました");
      id = 0;
    }
    update(id, day, time, "", "", "", "");
    // print("データを削除しました");
  }
}
