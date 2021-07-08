import 'package:flutter/material.dart';

import '../size_config.dart';
import '../theme.dart';
import '../models/parking_spot.dart';
import '../screens/spot_info_screen.dart';

// class ActiveSpotsListElement extends StatelessWidget {
//   final ParkingSpot spot;
//   final int buildIndex;
//   final EdgeInsetsGeometry margin;
//   final String timeLeft;

//   const ActiveSpotsListElement({
//     Key key,
//     @required this.spot,
//     @required this.buildIndex,
//     @required this.timeLeft,
//     this.margin,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return InkWell(
//       splashColor: customCyan,
//       radius: 1500,
//       borderRadius: BorderRadius.circular(20),
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => SpotInfoScreen(
//               spot: spot,
//               bought: true,
//             ),
//           ),
//         );
//       },
//       child: Container(
//         margin: margin,
//         child: ListTile(
//           leading: CircleAvatar(
//             backgroundColor: Theme.of(context).primaryColor,
//             radius: 30,
//             child: Padding(
//               padding: EdgeInsets.all(5),
//               child: FittedBox(
//                 child: Text(
//                   "$buildIndex",
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           title: Text(
//             "${spot.name}",
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           subtitle: Text(
//             "Current Rent Time: $timeLeft",
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
