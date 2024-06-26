// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// class SideBar extends StatelessWidget {
//
//   SideBar({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     var size = MediaQuery.of(context).size.width;
//     return Container(
//       // width: size/2,
//       child: Row(
//         children: [
//           Container(
//             width: 100,
//             color: Color(0xffC58DEA),
//             child: ListView(
//
//               children: [
//                 Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(15),
//                       child: Container(
//                         width: size*0.5,
//                         // height: 100,
//                         decoration: BoxDecoration(
//                           // border: Border.all(
//                           //   width: 15,
//                           // color: Colors.green,
//                           //   style: BorderStyle.solid,
//                           // ),
//                           // border: Border.all(width: 20,color: Colors.purple.shade800.withOpacity(0.6),),
//                           shape: BoxShape.circle,
//                         ),child:
//                              Image.asset("assets/images/10.png"),
//                       ),
//                     ),
//                     Container(
//                       height: size*0.9,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           SvgPicture.asset("assets/images/first.svg",color: Color(0xff635A8F).withOpacity(0.9),),
//                           SvgPicture.asset("assets/images/second.svg",color: Color(0xff635A8F).withOpacity(0.9),),
//                           SvgPicture.asset("assets/images/third.svg",color: Color(0xff635A8F).withOpacity(0.9),height: 24,),
//                           SvgPicture.asset("assets/images/fifth.svg",color: Color(0xff635A8F).withOpacity(0.9),height: 24,),
//
//                         ],
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           // Container(
//           //   width: 150,
//           //   color: Colors.pink,
//           //   child: ListView(
//           //     children: [
//           //       Container(
//           //         height: 46,
//           //         child: Icon( Icons.person_outline),
//           //         alignment: Alignment.center,
//           //       )
//           //     ],
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
