import 'dart:convert';

import 'package:sky_tracker/Api_modelClass/all_get_area_model_class.dart';
import 'package:http/http.dart' as http;

class ApiAllGetArea {
  static GetApiAllGetArea(context) async {
    List<Areas> allGetAreaslist = [];
    Areas allareas;
    try {
      var Response = await http
          .get(Uri.parse("http://apps.bigerp24.com/api/get_area"), headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${("token")}",
      });

      var data = jsonDecode(Response.body);
      print("AAAAAAAArrrreaaaaa===>: ${data}");
      for (var i in data!["areas"]) {
        allareas = Areas.fromJson(i);
        allGetAreaslist.add(allareas);
        print(allGetAreaslist);
      }
      print("Get Area length====>: ${allGetAreaslist.length}");
      //print("Area Name=========>${allGetArealist[0]}");
    } catch (e) {
      print("Something is wrong all Get Area=======:$e");
    }
    return allGetAreaslist;
  }
}
