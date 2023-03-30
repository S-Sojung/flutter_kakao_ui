import 'package:flutter/material.dart';
import 'package:flutter_kakao_ui/models/user.dart';
import 'package:flutter_kakao_ui/screens/profile_screen.dart';

class ProfileCard extends StatelessWidget {
  final User user; //초기화 하기 위한 데이터. 바뀌지 않는 데이터임 !!!
  const ProfileCard({Key? key, required this.user}) : super(key: key);
  //같은 데이터가 또 들어오면 new를 하지 않고 재사용하며, 다른 데이터가 들어오면 새로운 new를 한다.



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen(user: user))
        );
      },
      child: ListTile(
        leading: _avatar(),
        title: _title(),
        subtitle: subtitle(),
      ),
    );
  }

  Text subtitle() {
    return Text(
      user.intro,
      style: TextStyle(
        fontSize: 12
      ),
    );
  }

  Text _title() {
    return Text(
      user.name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16
      ),
    );
  }

  Widget _avatar() {
    return CircleAvatar(
      radius: 20,
      backgroundImage: NetworkImage(
        user.backgroundImage
      ),
    );
  }
}
