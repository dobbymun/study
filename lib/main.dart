import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex/src/home.dart';
import 'package:provider_ex/src/provider/count_provider.dart';

void main() {
  runApp(const MyApp());
  
  // 전체 앱에서 프로바이더 사용하고 싶은 경우 아래와 같이 작성
  // runApp(ChangeNotifierProvider(
  //   create: (BuildContext context) => CountProvider(),     
  //   child: MyApp(),
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: ChangeNotifierProvider(
        create: (BuildContext context) => CountProvider(),     //프로바이더 파일명
        child: Home(),                  // Home() 하위에 있는 모든 위젯들이 CountProvider 접근 가능
      )
    );
  }
}

//1. provider 사용하면 stateful 위젯을 거의 사용하지 않아도 됨
// -> 그러나 setState 이용해서 stateful 사용하기도 하므로 상황에 맞게 작성

//2. provider 적용 범위 작성 (main.dart에서 작성)
// (1) 프로바이더 파일 작성( 여기서는 count_provider.dart )
// (2) 프로바이더 적용하기 : 프로바이더로 감싸주어야 함 ! - main.dart 파일의 MyApp 또는 Home에 적용 가능
//  -> ChangeNotifierProvider : 1개 프로바이더 파일만 등록 가능

//3. provider 불러들이는 방법 (사용 대상 파일에 작성- (여기서는 버튼 클릭 시 메소드 호출하는 home.dart 파일과 상태값 보여주는 ui파일(count_home_widget))
// (1) 프로바이더 변수도 선언해주기
// (2) Provider.of<프로바이더파일명>(context)으로 불러서 사용
// (3) 프로바이더 메소드 호출 등 작성 (ex 버튼 클릭시 프로바이더명.add()메소드 호출)

//4. Provider 파일 작성법
// (1) class 프로바이더파일명 extends ChangeNotifier 해줘야 함
// (2) 상태값을 저장하는 변수는 private 으로 작성 (변수명 앞에 _언더바 붙이면 private)
// (3) private이므로 외부에서 접근 가능하도록 getter 작성 ->  (ex) int get count => _count;
// (4) 프로바이더에서 사용할 메소드 작성
// ->  메소드 안에 notifierListers(); 헤줘야 상속받고 있는 ChangeNotifier가 알아서 상태값 바꿔줌

// 5. 상태 변경되는 부분만 rebuild 되도록 적용하는 법 (3번에서 Provider.of 사용한 파일들 )
// (1) ui 파일 count_home_widget에서 Consumer 사용
//  ->프로바이더에 접근해서 값을 받아와야하는 위젯을 Consumer<프로바이더명>( )으로 감싼다.
//  ---------------------------------------------------------------------------
//  ex)  Consumer<프로바이더명>(
//         builder: (context, provider, child){
//           return Text(
//              provider.count.toString(),
//          )
// ------------------------------------------------------------------------------
//-> Consumer 사용 시에는 builder: (context, provider, child) 기본 3가지 받게 되므로
//   Provider.of<CountProvider>(context) ==  provider로 대체. child 말고 return 써줌
// (2) consumer 적용파일의 부모위젯이 Provider.of 사용하고 있는 경우 listen: false 옵션을 준다.
//     ex) Provider.of<프로바이더파일명>(context, listen: false)
//     -> listen:false 쓰지 않는 경우 아무리 하위 ui 위젯에서
//        consumer 사용해도 부모위젯이 하위 ui 위젯을 프로바이더 리빌드하며 전체 리빌드해버림