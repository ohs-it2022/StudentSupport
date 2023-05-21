import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_support/src/sample.dart';

@RoutePage()
class HomeDayPage extends StatefulWidget {
  final int month;
  final int day;
  final weekday;
  const HomeDayPage({super.key, required this.month, required this.day, required this.weekday});

  @override
  State<HomeDayPage> createState() => _HomeDayPageState();
}

class _HomeDayPageState extends State<HomeDayPage> {
  final prefs = SharedPreferences.getInstance();
  final controller = TextEditingController();
  String value = '';

  @override
  void initState(){
    super.initState();
    init();
  }
  // 画面起動時に読み込むメソッド
  void init() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      //　データの読み込み
      value = prefs.getString('金-1')!;
      print('value:$value');
    });
    print(prefs.getString('金-1'));
  }
  
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;  // 画面の横幅
    var weekdayJP;
    if (widget.weekday == 1){
      weekdayJP = '月';
    }else if(widget.weekday == 2){
      weekdayJP = '火';
    }else if(widget.weekday == 3){
      weekdayJP = '水';
    }else if(widget.weekday == 4){
      weekdayJP = '木';
    }else if(widget.weekday == 5){
      weekdayJP = '金';
    }else if(widget.weekday == 6){
      weekdayJP = '土';
    }else{
      weekdayJP = '日';
    }
    final timeTable = [
      for (int i=1;i<7;i++)...{
        Container(
          color: bgColor2,
          child: Column(
            children: [
              Text('$i時間目'),
              Text(value, style: const TextStyle(fontSize: 40.0))
            ],
          )
        )
      }
    ];
    return Center(
      child: Container(
        color: bgColor2,
        width: screenWidth,
        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: BasicText(text: '${widget.month}月${widget.day}日($weekdayJP)', size: 20),
            ),
            
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: timeTable,
              ),
            )
          ],
        )
      )
    );
  }
}