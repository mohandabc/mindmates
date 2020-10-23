import 'package:flutter/material.dart';
import 'explore.dart';
import 'profile.dart';
import 'messages.dart';
import 'package:page_transition/page_transition.dart';

class TopBar extends AppBar {
  final int view = 2;
  TopBar({Key key, int view, BuildContext context, Color backgroundColor})
      : super(
            key: key,
            backgroundColor: backgroundColor,
            title: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.person,
                          color: view == 1 ? Color(0xFF6dddf2) : null),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: ProfilePage(),
                          ),
                        );
                      },
                    ),
                    IconButton(
                        icon: Icon(Icons.star,
                            color: view == 2 ? Color(0xFF6dddf2) : null),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                              type: view == 1
                                  ? PageTransitionType.rightToLeft
                                  : view == 3
                                      ? PageTransitionType.leftToRight
                                      : PageTransitionType.fade,
                              child: ExplorePage(),
                            ),
                          );
                        }),
                    IconButton(
                        icon: Icon(Icons.message,
                            color: view == 3 ? Color(0xFF6dddf2) : null),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: MessagesPage(),
                            ),
                          );
                        }),
                  ],
                )));
}
