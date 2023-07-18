

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex/src/provider/count_provider.dart';

class CountHomeWidget extends StatelessWidget {
  const CountHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build called");
    return Center(
      child: Consumer<CountProvider>(
        builder: (context, provider, child){
          return Text(
             provider.count.toString(),  //count 값 호출
            // provider.count.toString() ==  Provider.of<CountProvider>(context).count.toString()
            // 위 두 문장른 동일한데 Consumer 사용 시에는 builder: (context, provider, child) 기본 3가지 받게 되므로
            //  Provider.of<CountProvider>(context) = provider로 대체. child 말고 return 써줌
            style: TextStyle(fontSize: 80),
          );
        }
      ),
    );
  }
}

// 프로바이더에 접근해서 값을 받아와야하는 위젯


// @override
//   Widget build(BuildContext context) {
//     print("build called");      // 프로바이더 같은 경우 상태 값 변하는 게 아닌 print 문도 계속 실행 해 줌
//                                 // count 값만 변하는 것임에도. 그렇기 때문에
//                                 프로바이더에 접근해서 값을 받아와야하는 위젯에 위와 같이 Consumer<> 적용
//     return Center(
//       child: Text(
//         Provider.of<CountProvider>(context).count.toString(),  //count 값 호출
//         style: TextStyle(fontSize: 80),
//       ),
//     );
//   }