// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class MyWidget extends StatelessWidget {
//   //const MyWidget({super.key});
//   final List _vehicleList = [
//     {
//       'vehicleNumber': 'KL-14-V-5208',
//       'vehicleType': 'Two Wheeler',
//     },
//     {
//       'vehicleNumber': 'KL-13-H-8880',
//       'vehicleType': 'Four Wheeler',
//     },
//     {
//       'vehicleNumber': 'KL-14-M-6889',
//       'vehicleType': 'Three Wheeler',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body:  Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(12.0),
//                                 child: Text(
//                                   _vehicleList[index]['vehicleNumber'],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(12.0),
//                                 child: Text(
//                                   _vehicleList[index]['vehicleType'],
//                                 ),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   print('Deleted');
//                                   _vehicleList.removeAt(_vehicleList[index]);
//                                   print(_vehicleList);
//                                 },
//                                 child: const Padding(
//                                   padding: EdgeInsets.all(12.0),
//                                   child: Icon(
//                                     FontAwesomeIcons.timesCircle,
//                                     color: Colors.redAccent,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           );,
//     );
//   }
// }