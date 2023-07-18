import 'package:flutter/cupertino.dart';

class CountProvider extends ChangeNotifier{ //ChangeNotifier -> bloc에서는 스트림해서 씽크해서 주입받던 부분들을 알아서 관리
  // 상태 저장할 변수
  int _count = 0; // 외부에서 접근 못하도록 private -> 변수명앞에 _ 언더바 붙임
  int get count => _count; //외부에서 접근 getter 작성 ->  Provider.of<CountProvider>(context).count로 이제 count값 호출 가능

  //프로바이더에서 사용할 메소드 작성
  add(){
    _count++;
    notifyListeners();  // 메소드에서 notifierListers(); 헤줘야 상속받고 있는 ChangeNotifier가 알아서 상태값 바꿔줌
  }

  remove(){
    _count--;
    notifyListeners();
  }
}