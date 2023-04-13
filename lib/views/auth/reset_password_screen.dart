// import 'package:flutter/material.dart';
// import 'package:sky_tracker/business_logics/auth.dart';
// import 'package:sky_tracker/widget/button.dart';


// class ResetPassword extends StatelessWidget {
//   ResetPassword({super.key});
//   final TextEditingController _emailController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 60, left: 25, right: 25),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Forgot your password?',
//                 style: TextStyle(fontSize: 38, fontWeight: FontWeight.w600),
//               ),
//               const Text(
//                 'enter your email and reset password.',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
//               ),
//               const SizedBox(height: 50),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: const InputDecoration(
//                   hintText: 'email address',
//                   prefixIcon: Icon(
//                     Icons.email_outlined,
//                   ),
//                 ),
//               ),
//               const Divider(color: Colors.transparent),
//               PurpleButton("Rest Now", () {
//                 if (_emailController.text.isNotEmpty) {
//                   Auth.resetPassword(
//                     _emailController.text,
//                     context,
//                   );
//                 }
//                 _emailController.clear();
//               }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
