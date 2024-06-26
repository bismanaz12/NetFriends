import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:social_app2/add_post_screen.dart';

import 'package:social_app2/groups.dart';
import 'package:social_app2/notifications.dart';
import 'package:social_app2/other_user_profile.dart';
import 'package:social_app2/profile_screen.dart';

import 'package:social_app2/side_bar.dart';
import 'package:social_app2/user_provider.dart';


import 'edit_profile.dart';
import 'home.dart';
import 'home_screen.dart';

class BottomBar extends StatefulWidget {
  static const routeName='BottomBar';

  BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int page = 0;
  PageController controller = PageController();

  void onPageChanged(index){
    setState(() {
      page=index;
    });
  }
  void onTap(int index){
    controller.jumpToPage(index);
  }


  @override
  void initState() {

    super.initState();
    Provider.of<UserProvider>(context,listen: false).getUserData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor:     Colors.transparent,
        buttonBackgroundColor: Color(0xFF635A8F),
        height: 58,
        color: Colors.transparent,
        animationDuration: Duration(milliseconds: 300),
        items: [
          page == 0 ? SvgPicture.asset("assets/images/home.svg",color: Colors.white,):SvgPicture.asset("assets/images/home.svg"),
          page == 1 ? SvgPicture.asset("assets/images/msg.svg",color: Colors.white,):SvgPicture.asset("assets/images/msg.svg"),
          FaIcon(
            FontAwesomeIcons.add, size: 28,
            color: page == 2 ?Colors.white:Color(0xFF635A8F),
          ),
          page == 3 ? SvgPicture.asset("assets/images/user.svg",color: Colors.white,):SvgPicture.asset("assets/images/user.svg"),
          page == 4 ? SvgPicture.asset("assets/images/bell.svg",color: Colors.white,):SvgPicture.asset("assets/images/bell.svg"),
        ],
        onTap: onTap,
        // (index){
        // setState(() {
        // page = index;
        // });
        // },
      ),
      body:
      PageView(
        controller: controller,
        onPageChanged: onPageChanged,
        children:
      [
        Home(),
        SideBar(),
        AddPost(),
        UserProfile(),
        Notifications(),
      ],
      ),
    );
  }

}
