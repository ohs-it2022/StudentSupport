import 'package:flutter/material.dart';
import 'package:student_support/src/sample.dart';

class FormPage extends StatelessWidget {
  final int num;
  final int dayOfWeek;
  final List<List<String>> weekTimeTable;
  const FormPage({super.key, required this.num, required this.dayOfWeek, required this.weekTimeTable});

  @override
  Widget build(BuildContext context) {
    var titleSubName;
    var subName = '';
    var classRoom = '';
    var teacher = '';
    List<List<String>> weekTimeTableAdd = weekTimeTable as List<List<String>>;

    return ScreenWidget(
      titleTxt: '時間割追加', 
      bodyContents: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: (){}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red
                ),
                child: Text("削除")
              ),
            ),
            formElem(txt: "表示名", initTxt: "CS11", function: (value) => (titleSubName = value)),
            formElem(txt: "正式名称", initTxt: "コンピュータサイエンス", function: (value) => (subName = value)),
            formElem(txt: "教室名", initTxt: "161", function: (value) => (classRoom = value),),
            formElem(txt: "教科担当", initTxt: "渡瀬健", function: (value) => (teacher = value),),
            ElevatedButton(
              onPressed: (){

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