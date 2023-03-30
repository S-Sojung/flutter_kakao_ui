import 'package:flutter/material.dart';
import 'package:flutter_kakao_ui/components/bottom_icon_button.dart';
import 'package:flutter_kakao_ui/components/round_icon_button.dart';
import 'package:flutter_kakao_ui/models/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({required this.user, Key? key}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(user.backgroundImage),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _buildAppBar(context),
        body: Column(
          children: [
            Spacer(),
            _profile(),
            SizedBox(height: 8,),
            Text(user.name, style: TextStyle(color: Colors.white,fontSize: 15)),
            SizedBox(height: 5),
            Text(user.intro, style: TextStyle(color: Colors.white,fontSize: 15),maxLines: 1,),
            SizedBox(height: 20,),
            Divider(color: Colors.white,),
            if(user.name == me.name) _buildMyIcons()
            else _buildFriendIcons(),
          ],
        ),
      ),
    );
  }

  Container _profile() {
    return Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(user.backgroundImage),
                fit: BoxFit.cover
              )
            ),
          );
  }

  Widget _buildMyIcons(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BottomIconButton(icon: FontAwesomeIcons.comment, text: "나와의 채팅"),
          SizedBox(width: 50,),
          BottomIconButton(icon: FontAwesomeIcons.pencil, text: "프로필 편집")
        ],
      ),
    );
  }

  Widget _buildFriendIcons(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BottomIconButton(icon: FontAwesomeIcons.comment, text: "1:1 채팅"),
          SizedBox(width: 50,),
          BottomIconButton(icon: FontAwesomeIcons.phone, text: "통화하기")
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.times,
            size: 30,
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: [
          RoundIconButton(icon: FontAwesomeIcons.gift),
          SizedBox(width: 15),
          RoundIconButton(icon: FontAwesomeIcons.cog),
          SizedBox(width: 20),
        ],
      );
  }
}
