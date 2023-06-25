import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_support/src/sample.dart';
import 'package:student_support/src/screens/timeTable/TT_change.dart';

import 'package:student_support/src/time_table_model.dart';
final _storage = TTsStorage();

class FormPage extends StatelessWidget {
  final int num;
  final int day;
  final List<List<SubjectModel>> timeTableList;
  const FormPage({super.key, required this.num, required this.day, required this.timeTableList});

  @override
  Widget build(BuildContext context) {
    var titleSubName = '';
    var fullname = '';
    var classRoom = '';
    var teacher = '';

    return ScreenWidget(
      titleTxt: '時間割追加', 
      bodyContents: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: (){
                  _storage.delete(0, day, num);
                  Navigator.pop(context);
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red
                ),
                child: Text("削除")
              ),
            ),
            formElem(txt: "表示名", initTxt: timeTableList[day][num].subject, function: (value) => (titleSubName = value)),
            formElem(txt: "正式名称", initTxt: timeTableList[day][num].fullname, function: (value) => (fullname = value)),
            formElem(txt: "教室名", initTxt: timeTableList[day][num].room, function: (value) => (classRoom = value),),
            formElem(txt: "教科担当", initTxt: timeTableList[day][num].teacher, function: (value) => (teacher = value),),
            ElevatedButton(
              onPressed: (){
                _storage.update(0, day, num, titleSubName, fullname, classRoom, teacher);
                // _storage.read(0, day, num).then((value){
                //   print(value.subject);
                // });
                
                Navigator.pop(context);
              },
              child: Text('登録')
            )
          ],
        ),
    );
  }
}


class formElem extends StatelessWidget {
  final String txt;
  final String initTxt;
  final function;
  const formElem({super.key, required this.txt, this.initTxt="", required this.function});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;  // 画面のサイズを取得

    return Center(
      child: SizedBox(
        width: screenSize.width * 0.95,
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: screenSize.width * 0.2,
                child: Center(child: Text(txt)),
              ),
              SizedBox(
                width: screenSize.width * 0.7,
                child: Flexible(
                  child: TextField(
                    controller: TextEditingController(text: initTxt),
                    onChanged: function,
                  )
                ),
              )
            ],
          ),
        )
        
      )
    );
  }
}