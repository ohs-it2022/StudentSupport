
String getWeekDayJP(weekdayNum){
  String weekDay;
  if (weekdayNum == 1){
    weekDay = '月';
  }else if(weekdayNum == 2){
    weekDay = '火';
  }else if(weekdayNum == 3){
    weekDay = '水';
  }else if(weekdayNum == 4){
    weekDay = '木';
  }else if(weekdayNum == 5){
    weekDay = '金';
  }else if(weekdayNum == 6){
    weekDay = '土';
  }else{
    weekDay = '日';
  }
  return weekDay;
}