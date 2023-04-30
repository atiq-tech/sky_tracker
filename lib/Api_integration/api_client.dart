import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sky_tracker/views/deshboard_screen.dart';

final Dio dio = Dio();

class ApiClient {
  //this function is login
  static Future<void> login({
    required String username,
    required String password,
    required Position currentPosition,
    required BuildContext context,
  }) async {
    String loginApi = "http://apps.bigerp24.com/api/login";
    //IMPLEMENT USER LOGIN

    try {
      final FormData formData = FormData.fromMap({
        "username": "${username}",
        "password": "${password}",
      });
      Response response = await dio.post(loginApi, data: formData);
      print("All api login response=====>>>$response");
      if (response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => DeshBoardScreen(currentPosition: currentPosition),
          ),
        );
        Fluttertoast.showToast(msg: "Login successfull");
      }
    } on DioError catch (e) {
      print("DioError ============> $e");
      Fluttertoast.showToast(msg: "Error => ${e.message}");
      // return e.response!.data;
    }
  }
}
