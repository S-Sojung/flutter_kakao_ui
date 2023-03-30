import 'package:flutter/material.dart';
import 'package:flutter_kakao_ui/components/profile_card.dart';
import 'package:flutter_kakao_ui/models/user.dart';

class FriendScreen extends StatelessWidget {
  const FriendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("친구")),
      body: Column( // 얘는 이제 body.dart로 새로 클래스를 그려서 빼서 리펙토링 하면 좋다.
        children: [
          const SizedBox(height: 10),
          ProfileCard(user: me),
          const Divider(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              children: [
                Text("친구"),
                SizedBox(
                  width: 10,
                ),
                Text("${friends.length}")
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: friends.length,
              //개수를 알고 있고, 프로필 카드의 높이를 분석해서 화면에 맞게 로딩해준다.
              //그리고 만약 스크롤 하면, 안보이는 프로필 카드에서 데이터만 갈아 끼워서 다시 보여준다.
              itemBuilder: (context, index) =>
                  ProfileCard(user: friends[index]),
            ),
          )
        ],
      ),
    );
  }
}
