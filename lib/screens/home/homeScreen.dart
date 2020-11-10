import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mindmates/models/myprofile.dart';
import 'package:mindmates/screens/home/explore.dart';
import 'package:mindmates/screens/home/messages.dart';
import 'package:mindmates/screens/home/profile.dart';
import 'package:mindmates/services/database.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final String uid;
  HomeScreen({this.uid});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController(initialPage: 1);

  int view = 1;
  void changePage(page) {
    controller.animateToPage(page,
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<MyProfile>>.value(
      value: DatabaseService(uid: widget.uid).profile,
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 40, left: 40, right: 40),
            color: Color(0xff0f0f0f),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.person,
                      color: view == 0 ? Color(0xFF6dddf2) : Color(0xFFf2526e)),
                  onPressed: () {
                    changePage(0);
                  },
                ),
                IconButton(
                    icon: Icon(Icons.star,
                        color:
                            view == 1 ? Color(0xFF6dddf2) : Color(0xFFf2526e)),
                    onPressed: () {
                      changePage(1);
                    }),
                IconButton(
                    icon: Icon(Icons.message,
                        color:
                            view == 2 ? Color(0xFF6dddf2) : Color(0xFFf2526e)),
                    onPressed: () {
                      changePage(2);
                    }),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (page) {
                setState(() {
                  view = page;
                });
              },
              children: [
                ProfilePage(),
                ExplorePage(),
                MessagesPage(),
              ],
            ),
          )
        ],
      )),
    );
  }
}
