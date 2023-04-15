import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sky_tracker/views/deshboard_screen.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  ///String link = "http://apps.bigerp24.com/api/login";
  Fetchlogin(String, dynamic) async {
    try {
      final formData = FormData.fromMap({
        "username": "${_usernameController.text}",
        "password": "${_passwordController.text}"
      });
      final response = await Dio()
          .post("http://apps.bigerp24.com/api/login", data: formData);
      var item = jsonDecode(response.data);
      print("aaaaaaaaaaaaaaaaaa========>$item");
      if (item["success"] == true) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => DeshBoardScreen()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 1),
            content: Text("Login successfull")));
      }
      GetStorage().write("token", "${item["token"]}");
      // GetStorage().write("id", "${item["user"]["id"] as String}");
      // GetStorage().write("name", "${item["user"]["name"]}");
      // GetStorage().write("type", "${item["user"]["type"]}");
      // GetStorage().write("username", "${item["user"]["username"]}");
      // GetStorage().write("email", "${item["user"]["email"]}");
      print("token : ${GetStorage().read("token")}");
      // print("id : ${GetStorage().read("id") as String}");
      // print("name : ${GetStorage().read("name")}");
      // print("type : ${GetStorage().read("type")}");
      // print("username : ${GetStorage().read("username")}");
      // print("email : ${GetStorage().read("email")}");
      print(item["success"]);
    } catch (e) {
      print("Something is wrong>>>>>>${e}");
    }
  }

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: InkWell(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            color: Color.fromARGB(255, 2, 135, 145),
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 9,
                    ),
                    Container(
                      child: CircleAvatar(
                        radius: 45.0,
                        backgroundImage: NetworkImage(GetStorage()
                                    .read("token") ==
                                null
                            ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1Ef6Tfc-iINWf5MeZMwImrhKmY2gKbIQzDA&usqp=CAU"
                            : "https://thumbs.dreamstime.com/b/admin-sign-laptop-icon-stock-vector-166205404.jpg"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        child: Text(
                      "Sky Tracker",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 25.0,
                          color: Colors.white),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 260.0,
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.only(left: 20.0, right: 20.0, top: 45.0),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 191, 212, 214),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                                color: Color.fromARGB(255, 11, 7, 248),
                                width: 3.2)),
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) => value!.isEmpty
                                  ? 'user cannot be blank'
                                  : null,
                              controller: _usernameController,
                              decoration: InputDecoration(
                                label: Text("User Name"),
                                hintText: "User Name",
                                errorStyle: TextStyle(fontSize: 0.0),
                                hintStyle: TextStyle(fontSize: 18.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 155, 152, 152)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 185, 185, 185)),
                                ),
                              ),
                              onTap: () async {},
                            ),
                            SizedBox(height: 15.0),
                            TextFormField(
                              validator: (value) => value!.isEmpty
                                  ? 'Password cannot be blank'
                                  : null,
                              controller: _passwordController,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.visibility_off),
                                suffixIconColor: Colors.grey,
                                errorStyle: TextStyle(fontSize: 0.0),
                                label: Text("Password"),
                                hintText: "Password",
                                hintStyle: TextStyle(fontSize: 18.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 155, 152, 152)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color:
                                          Color.fromARGB(255, 185, 185, 185)),
                                ),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            InkWell(
                              onTap: () {
                                if (_formkey.currentState!.validate()) {
                                  Fetchlogin(String, dynamic);
                                  _usernameController.text = "";
                                  _passwordController.text = "";
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          duration: Duration(seconds: 1),
                                          content: Text("Fill all the field")));
                                }
                              },
                              child: Container(
                                height: 35.0,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(255, 88, 204, 91),
                                      width: 2.0),
                                  color: Color.fromARGB(255, 5, 114, 165),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                    child: Text(
                                  "LOG IN",
                                  style: TextStyle(
                                      letterSpacing: 1.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                )),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
