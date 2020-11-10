import 'package:flutter/material.dart';
import 'package:mindmates/models/myprofile.dart';

class ProfileTile extends StatelessWidget {
  final MyProfile profile;
  ProfileTile({this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 40, 0, 80),
      height: MediaQuery.of(context).size.height,
      color: Color(0xff0f0f0f),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 250,
              height: 250,
              child: CircleAvatar(
                child: CircleAvatar(
                  radius: 120,
                  backgroundImage: AssetImage("images/profile.jpg"),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 0, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    profile.name,
                    style: TextStyle(fontSize: 25, color: Color(0xFFf2526e)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    profile.age.toString(),
                    style: TextStyle(fontSize: 25, color: Color(0xFFf2526e)),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 0, top: 20),
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                  'I\'m 27yo, from Bouira, here to challenge myself and you. Are we on the same wave length ? let\'s see.',
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
