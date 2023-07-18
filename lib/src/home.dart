

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex/src/provider/count_provider.dart';
import 'package:provider_ex/src/ui/count_home_widget.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  late CountProvider _countProvider;                           // 1. 프로바이더 변수 선언

  @override
  Widget build(BuildContext context) {

    // 2. 프로바이더 불러들이는 방법? Provider.of<프로바이더파일명>(context)
    _countProvider = Provider.of<CountProvider>(context, listen: false); //여기서 listen: false는 Consumer 사용 시

    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Sample") ,
      ),
      body: CountHomeWidget(),                       //바디 상태값 보여주는 ui파일- CountHomeWidget()
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(onPressed: (){
            _countProvider.add();                     //3. 버튼 클릭시 해당 프로바이더에서 실행할 메소드호출
          },
              icon: Icon(Icons.add)),
          IconButton(onPressed: (){
            _countProvider.remove();
          },
              icon: Icon(Icons.remove))
        ],
      ),
    );
  }
}
