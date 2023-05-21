import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_support/routers/app_router.gr.dart';
import 'package:student_support/src/sample.dart';
import 'package:shared_preferences/shared_preferences.dart';

var titleName;

subjectRegist(text, num, dayOfWeek)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('$dayOfWeek-$num', text);
}
printInfo(num, dayOfWeek)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? vString = prefs.getString('金-1');
  print(vString);
}
@RoutePage()
class AddDetailPage extends StatelessWidget {
  final int num;
  final String dayOfWeek;
  const AddDetailPage({super.key, required this.num, required this.dayOfWeek});

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      titleTxt: '単元追加', 
      bodyContents: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: '表示名'
              ),
              onChanged: (value){
                titleName = value;
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: '正式名称(任意)'
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: '教室名(任意)'
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: '教科担当'
              ),
            ),
            ElevatedButton(
              onPressed: (){
                subjectRegist(titleName, num, dayOfWeek);
                printInfo(num, dayOfWeek);
                AutoRouter.of(context).replace(TTChangeRoute());
              },
              child: Text('登録')
            )
          ],
        ),
      )
    );
  }
}