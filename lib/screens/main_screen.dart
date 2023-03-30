import 'package:flutter/material.dart';
import 'package:flutter_kakao_ui/screens/chat_screen.dart';
import 'package:flutter_kakao_ui/screens/friend_screen.dart';
import 'package:flutter_kakao_ui/screens/more_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //상태변수
  int _selectedIndex = 0;

  void changeScreen(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex, //상태변수 세팅
        children: [
          //내가 선택한 인덱스로 맨위에 올려줌 (내부적으로 순서를 바꿔줌)
          FriendScreen(),
          ChatScreen(),
          MoreScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false, // 밑에 공간이 사라진다.
          backgroundColor: Colors.grey[100],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black54,
          onTap: (index) { //상태변수 변경
            changeScreen(index);
          },
          currentIndex: _selectedIndex,//상태변수 매칭
          items: [
            // 얘는 IndexedStack에 들어가는 것들을 매칭해주면 됨 : icon은 required지만 label은 필수라고 적혀있지 않지만 필요함
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.user),label: ""),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.comment),label: ""),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.ellipsisH),label: "")
          ]
      ),
    );
  }
}
