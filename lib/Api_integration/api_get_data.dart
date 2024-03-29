import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sky_tracker/Api_modelClass/all_get_data_modelClass.dart';

class ApiAllGetData {
  static GetApiAllGetData(context, String? dateFrom, String? dateTo, int areaId,
      int bpId, int leaderId) async {
    String Link = "http://apps.bigerp24.com/api/get_data";
    List<DataLists> allGetDatalist = [];
    DataLists allDataListsClass;
    print(GetStorage().read("token"));
    try {
      Response response = await Dio().post(Link,
          data: {
            "dateFrom": "$dateFrom",
            "dateTo": "$dateTo",
            "areaId": "$areaId",
            "bpId": "$bpId",
            "leaderId": "$leaderId"
          },
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${GetStorage().read("token")}",
          }));
      print(response.data);

      for (var i in response.data["dataLists"]) {
        allDataListsClass = DataLists.fromJson(i);
        allGetDatalist.add(allDataListsClass);
      }
      print("Get alll dataaaaaaaaa");
      print("Get data list length is====>${allGetDatalist.length}");
    } catch (e) {
      print("Something is wrong all get data  list=======:$e");
    }
    return allGetDatalist;
  }
}
