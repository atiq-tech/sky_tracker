// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:sky_tracker/business_logics/auth.dart';
// import 'package:sky_tracker/views/auth/signup_screen.dart';
// import 'package:sky_tracker/widget/button.dart';


// import 'reset_password_screen.dart';

// class LoginScreen extends StatefulWidget {
//   LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();

//   final TextEditingController _passwordController = TextEditingController();

//   bool _isVisible = true;
//   bool _isProgress = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 60, left: 25, right: 25),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Welcome Back Buddy!',
//                   style: TextStyle(
//                     fontSize: 38,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const Text(
//                   'Login to your account and start using this App.',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
//                 ),
//                 const SizedBox(height: 50),
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: const InputDecoration(
//                     hintText: 'email address',
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.email_outlined),
//                   ),
//                 ),
//                 const Divider(color: Colors.transparent),
//                 TextFormField(
//                   controller: _passwordController,
//                   obscureText: _isVisible,
//                   decoration: InputDecoration(
//                       border: const OutlineInputBorder(),
//                       hintText: 'password',
//                       prefixIcon: const Icon(Icons.lock, size: 22),
//                       suffixIcon: IconButton(
//                         onPressed: () {
//                           setState(() {
//                             _isVisible = !_isVisible;
//                           });
//                         },
//                         icon: _isVisible == false
//                             ? const Icon(Icons.visibility_off_outlined)
//                             : const Icon(
//                                 Icons.visibility_outlined,
//                               ),
//                       )),
//                 ),
//                 const SizedBox(height: 8),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: Text.rich(
//                     TextSpan(text: 'Forgot your password? ', children: [
//                       TextSpan(
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () => Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (_) => ResetPassword(),
//                                 ),
//                               ),
//                         text: 'Reset Now',
//                         style: const TextStyle(
//                           fontWeight: FontWeight.w600,
//                           color: Colors.redAccent,
//                         ),
//                       )
//                     ]),
//                   ),
//                 ),
//                 const Divider(color: Colors.transparent),
//                 // Button is here
//                 // if (_isProgress)
//                 //   const Center(
//                 //     child: CircularProgressIndicator(),
//                 //   ),
//                 _isProgress == false
//                     ? const Center(
//                         child: CircularProgressIndicator(),
//                       )
//                     : PurpleButton(
//                         "Log in",
//                         () {
//                           try {
//                             setState(() {
//                               _isProgress = true;
//                             });
//                             Auth.login(
//                               _emailController.text,
//                               _emailController.text,
//                               context,
//                             );
//                             setState(() {
//                               _isProgress = false;
//                             });
//                           } catch (e) {
//                             print(e);
//                           } finally {
//                             setState(() {
//                               _isProgress = true;
//                             });
//                           }
//                         },
//                       ),

//                 const Divider(color: Colors.transparent),
//                 Text.rich(
//                   TextSpan(text: 'Don\'t have an account? ', children: [
//                     TextSpan(
//                       recognizer: TapGestureRecognizer()
//                         ..onTap = () => Navigator.push(
//                               context,
//                             //  MaterialPageRoute(
//                                // builder: (_) => const SignUpScreen(),
//                               ),
//                             ),
//                       text: 'Create Account',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.w600,
//                         color: Colors.blue,
//                       ),
//                     )
//                   ]),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
