import 'package:flutter/cupertino.dart';
import 'package:sky_tracker/Api_integration/api_get_area.dart';
import 'package:sky_tracker/Api_integration/api_get_bp.dart';
import 'package:sky_tracker/Api_integration/api_get_data.dart';
import 'package:sky_tracker/Api_integration/api_get_team_leader.dart';
import 'package:sky_tracker/Api_modelClass/all_get_area_model_class.dart';
import 'package:sky_tracker/Api_modelClass/all_get_data_modelClass.dart';
import 'package:sky_tracker/Api_modelClass/team_leader_modelclass.dart';

class CounterProvider extends ChangeNotifier {
  //get Area api
  List<Areas> allGetAreaslist = [];
  getArea(BuildContext context, String token) async {
    allGetAreaslist = await ApiAllGetArea.GetApiAllGetArea(context, token);
    notifyListeners();
  }

  //get data api
  List<DataLists> allGetDatalist = [];
  getGetData(context, String? dateFrom, String? dateTo, int areaId, int bpId,
      int leaderId) async {
    allGetDatalist = await ApiAllGetData.GetApiAllGetData(
        context, dateFrom, dateTo, areaId, bpId, leaderId);
    notifyListeners();
  }

  //get Team Leader api
  List<Users> allGetTeamLeaderlist = [];
  getTeamLeader(context, String token, String? userType) async {
    allGetTeamLeaderlist =
        await ApiTeamLeader.GetApiTeamLeader(context, token, userType);
    notifyListeners();
  }

  //get by bp api
  List<Users> allGetByBplist = [];
  getByBp(context, String token, String? userType) async {
    allGetByBplist = await ApiGetByBp.GetApiGetByBp(context, token, userType);
    notifyListeners();
  }
}
