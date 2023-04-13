// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:sky_trecker/business_logics/auth.dart';
// import 'package:sky_trecker/views/auth/login_screen.dart';
// import 'package:sky_trecker/widget/button.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   bool _isVisibale = true;
//   bool _isProgress = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 60, left: 25, right: 25),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Welcome this application!',
//                   style: TextStyle(fontSize: 38, fontWeight: FontWeight.w600),
//                 ),
//                 const Text(
//                   'Create your account and start your journey with us.',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
//                 ),
//                 const SizedBox(height: 50),
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: const InputDecoration(
//                     hintText: 'email address',
//                     prefixIcon: Icon(Icons.email_outlined),
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "this field can't be empty";
//                     } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
//                       return "Plase Valid email";
//                     }
//                   },
//                 ),
//                 const Divider(
//                   color: Colors.transparent,
//                 ),
//                 TextFormField(
//                   controller: _passwordController,
//                   obscureText: _isVisibale,
//                   decoration: InputDecoration(
//                     hintText: 'password',
//                     border: const OutlineInputBorder(),
//                     prefixIcon: const Icon(Icons.lock, size: 22),
//                     suffixIcon: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           _isVisibale = !_isVisibale;
//                         });
//                       },
//                       icon: _isVisibale == false
//                           ? const Icon(Icons.visibility_off_outlined)
//                           : const Icon(
//                               Icons.visibility_outlined,
//                             ),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "this field can't be empty";
//                     } else if (value.length < 6) {
//                       return "password must be 6 characters";
//                     }
//                   },
//                 ),

//                 const Divider(color: Colors.transparent),

//                 // Button is here
//                 _isProgress == false
//                     ? const Center(
//                         child: CircularProgressIndicator(),
//                       )
//                     : PurpleButton(
//                         "Sign Up",
//                         () {
//                           try {
//                             if (_formKey.currentState!.validate()) {
//                               setState(() {
//                                 _isProgress = true;
//                               });
//                               Auth.signUp(
//                                 _emailController.text,
//                                 _passwordController.text,
//                                 context,
//                               );
//                               setState(() {
//                                 _isProgress = false;
//                               });
//                             } else {
//                               Fluttertoast.showToast(msg: "Signup Failed");
//                             }
//                           } catch (e) {
//                             print(e);
//                           }
//                         },
//                       ),

//                 const Divider(height: 20.0, color: Colors.transparent),
//                 Text.rich(
//                   TextSpan(text: "Already have an account? ", children: <InlineSpan>[
//                     TextSpan(
//                         text: "Login",
//                         style: const TextStyle(
//                           //  fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.blue,
//                         ),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () => Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => LoginScreen(),
//                                 ),
//                               )),
//                   ]),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ));
//   }
// }
