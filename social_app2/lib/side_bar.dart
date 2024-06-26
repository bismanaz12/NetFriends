import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app2/chat_screen.dart';
import 'package:social_app2/groups.dart';
import 'package:social_app2/message1.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = [
  Message1(),
    Groups(),
    Groups(),
    Groups(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 25,
        backgroundColor: Colors.purple.shade800.withOpacity(0.7),
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: size.height*0.065,
              width: size.width*0.75,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF635A8F).withOpacity(0.7),
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  fillColor: Color(0xFF635A8F).withOpacity(0.7),
                  filled: true,
                  prefixIcon: Icon(Icons.search,size: 25,color: Colors.white.withOpacity(0.9)),
                  suffixIcon:  Icon(Icons.person_3_rounded,size: 25,color: Colors.white.withOpacity(0.7)),
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.9),fontWeight:FontWeight.w500,fontSize: 15),
                ),
              ),
            ),
          ],
        ),

      ),
      drawer: Drawer(
        width: 100,
        child: SideNavigation(onItemTapped: _onItemTapped),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}

class SideNavigation extends StatelessWidget {
  final Function(int) onItemTapped;

  SideNavigation({required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      color: Color(0xffC58DEA),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: size.height*0.06),
            child: Container(
              width: size.width*0.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child:
              Image.asset("assets/images/10.png"),
            ),
          ),
          Container(
             height: size.height*0.5,
             width: size.width*0.02,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                InkWell(
                  onTap: () => onItemTapped(0) ,
                    child:
                    SvgPicture.asset("assets/images/first.svg",color: Color(0xff635A8F).withOpacity(0.9),)
                ),
                InkWell(
                    onTap: () => onItemTapped(1) ,
                child: SvgPicture.asset("assets/images/second.svg",color: Color(0xff635A8F).withOpacity(0.9),)
                ),
                InkWell(
                    onTap: () => onItemTapped(2) ,
                 child: SvgPicture.asset("assets/images/third.svg",color: Color(0xff635A8F).withOpacity(0.9),height: 24,)
                ),
                InkWell(
                    // onTap: () => onItemTapped(3) ,
                    child: SvgPicture.asset("assets/images/fifth.svg",color: Color(0xff635A8F).withOpacity(0.9),height: 24,)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// class SidNavigation extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: EdgeInsets.zero,
//       children: <Widget>[
//         DrawerHeader(
//           decoration: BoxDecoration(
//             color: Colors.blue,
//           ),
//           child: Text(
//             'Drawer Header',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 24,
//             ),
//           ),
//         ),
//         ListTile(
//           leading: Icon(Icons.home),
//           title: Text('Home'),
//           onTap: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         ListTile(
//           leading: Icon(Icons.person),
//           title: Text('Profile'),
//           onTap: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         ListTile(
//           leading: Icon(Icons.settings),
//           title: Text('Settings'),
//           onTap: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ],
//     );
//   }
// }

// class ContentArea extends StatelessWidget {
//   @override
//    Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Content Area',
//          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }