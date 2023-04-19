import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sky_tracker/Api_integration/api_get_data.dart';
import 'package:sky_tracker/providers/counter_probider.dart';

import '../widget/button.dart';

class DataListScreen extends StatefulWidget {
  @override
  State<DataListScreen> createState() => _DataListScreenState();
}

class _DataListScreenState extends State<DataListScreen> {
  List<String> items = ["All", "By Area", "Team Leader", "By BP"];
  List<String> areaList = ["Dhaka", "Pabna", "Kustia"];
  List<String> teamLeaderList = ["Jone", "Mickey", "Root"];
  List<String> bpList = ["BP1", "BP2", "BP3"];
  String dropDownvalue = "All";
  String? dropDownAreaList;
  String? dropDownTeamLeader;
  String? dropDownBP;
  String? fromPickedDate;
  String? dateToPickedDate;
  int? setIndex;

  final TextEditingController _DateController = TextEditingController();
  final TextEditingController _Date2Controller = TextEditingController();
  String? firstPickedDate;

  void _firstSelectedDate() async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));
    if (selectedDate != null) {
      setState(() {
        firstPickedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  String? secondPickedDate;

  void _secondSelectedDate() async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));
    if (selectedDate != null) {
      setState(() {
        secondPickedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  ApiAllGetData? apiAllGetData;
  @override
  void initState() {
    firstPickedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    secondPickedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //All Get data
    final allGetData = Provider.of<CounterProvider>(context).allGetDatalist;
    print("All GET Data Lenght is:::::${allGetData.length}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data List"),
        centerTitle: true,
        // automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 6, 126, 196),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // This Row is Search type
                Row(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: Text("Search Type"),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 20,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: DropdownButton(
                            underline: const SizedBox.shrink(),
                            isExpanded: true,
                            value: dropDownvalue,
                            items: items.map((String mapValue) {
                              return DropdownMenuItem<String>(
                                value: mapValue,
                                child: Text(mapValue),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                dropDownvalue = value!.toString();
                                // _byAreaVisible = value == "By Area";
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // This condition by Select Area
                if (dropDownvalue == "By Area")
                  Column(
                    children: [
                      const Divider(color: Colors.transparent),
                      Row(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: SizedBox.shrink(),
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                              height: MediaQuery.of(context).size.height / 20,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: DropdownButton(
                                  underline: const SizedBox.shrink(),
                                  isExpanded: true,
                                  hint: const Text(
                                    "Select Area",
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                  value: dropDownAreaList,
                                  items: areaList.map((String mapValue) {
                                    return DropdownMenuItem<String>(
                                      value: mapValue,
                                      child: Text(mapValue),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropDownAreaList = newValue;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                // This condition by Select Team Leader
                if (dropDownvalue == "Team Leader")
                  Column(
                    children: [
                      const Divider(color: Colors.transparent),
                      Row(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: SizedBox.shrink(),
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                              height: MediaQuery.of(context).size.height / 20,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: DropdownButton(
                                  underline: const SizedBox.shrink(),
                                  isExpanded: true,
                                  hint: const Text(
                                    "Select Team Leader",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                  value: dropDownTeamLeader,
                                  items: teamLeaderList.map((String mapValue) {
                                    return DropdownMenuItem<String>(
                                      value: mapValue,
                                      child: Text(mapValue),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropDownTeamLeader = newValue;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                // This condition by Select By BP
                if (dropDownvalue == "By BP")
                  Column(
                    children: [
                      const Divider(color: Colors.transparent),
                      Row(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: SizedBox.shrink(),
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                              height: MediaQuery.of(context).size.height / 20,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: DropdownButton(
                                  underline: const SizedBox.shrink(),
                                  isExpanded: true,
                                  hint: const Text(
                                    "Select BP",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                  value: dropDownBP,
                                  items: bpList.map((String mapValue) {
                                    return DropdownMenuItem<String>(
                                      value: mapValue,
                                      child: Text(mapValue),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropDownBP = newValue;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                const Divider(color: Colors.transparent),
                // This Row is From
                SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Text(
                        "From ",
                        style: TextStyle(
                            color: Color.fromARGB(255, 126, 125, 125)),
                      ),
                    ),
                    Expanded(
                      flex: 11,
                      child: Container(
                        height: 35,
                        child: GestureDetector(
                          onTap: (() {
                            _firstSelectedDate();
                          }),
                          child: TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 10, left: 10),
                              filled: true,
                              fillColor: Colors.blue[50],
                              suffixIcon: Icon(
                                Icons.calendar_month,
                                color: Colors.black87,
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: firstPickedDate == null
                                  ? DateFormat('yyyy-MM-dd')
                                      .format(DateTime.now())
                                  : firstPickedDate,
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Colors.black87),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return null;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Text("Date to"),
                    ),
                    Expanded(
                      flex: 11,
                      child: Container(
                        height: 35,
                        child: GestureDetector(
                          onTap: (() {
                            _secondSelectedDate();
                          }),
                          child: TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 10, left: 10),
                              filled: true,
                              fillColor: Colors.blue[50],
                              suffixIcon: Icon(
                                Icons.calendar_month,
                                color: Colors.black87,
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: secondPickedDate == null
                                  ? DateFormat('yyyy-MM-dd')
                                      .format(DateTime.now())
                                  : secondPickedDate,
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Colors.black87),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return null;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const Divider(color: Colors.transparent),
                // This Row Date To

                const Divider(color: Colors.transparent),
                //This Button Start
                PurpleButton("Search", () {
                  setState(() {
                    Provider.of<CounterProvider>(context, listen: false)
                        .getGetData(
                      context,
                      "${firstPickedDate}",
                      "${secondPickedDate}",
                    );
                    print("firstDate product ledger=====::${firstPickedDate}");
                    print(
                        "secondDate ++++++product ledger=====::${secondPickedDate}");
                  });
                }),
                const Divider(color: Colors.transparent),

                Container(
                  height: MediaQuery.of(context).size.height / 1.43,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          // color: Colors.red,
                          // padding:EdgeInsets.only(bottom: 16.0),
                          child: DataTable(
                            showCheckboxColumn: true,
                            border: TableBorder.all(
                                color: Colors.black54, width: 1),
                            columns: [
                              DataColumn(
                                label: Center(child: Text("SL")),
                              ),
                              DataColumn(
                                label: Center(child: Text('Name')),
                              ),
                              DataColumn(
                                label: Center(child: Text('Mobile No.')),
                              ),
                              DataColumn(
                                label: Center(child: Text('New Sim')),
                              ),
                              DataColumn(label: Center(child: Text("Toffee"))),
                              DataColumn(
                                  label: Center(child: Text("Sell Package"))),
                              DataColumn(
                                  label: Center(child: Text("Sell (GB)"))),
                              DataColumn(
                                  label: Center(child: Text("Recharge"))),
                              DataColumn(
                                  label:
                                      Center(child: Text("Recharge(Amount)"))),
                              DataColumn(label: Center(child: Text("Gift"))),
                              DataColumn(
                                  label: Center(child: Text("Gift Name"))),
                              DataColumn(label: Center(child: Text("Area"))),
                              DataColumn(
                                  label: Center(child: Text("Location"))),
                            ],
                            rows: List.generate(
                              allGetData.length,
                              (int index) => DataRow(
                                cells: <DataCell>[
                                  DataCell(
                                    Center(child: Text("${index + 1}")),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                            '${allGetData[index].dataLists![index].name}')),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                            '${allGetData[index].dataLists![index].mobile}')),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                            '${allGetData[index].dataLists![index].newSim}')),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                            "${allGetData[index].dataLists![index].toffee}")),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                            "${allGetData[index].dataLists![index].sellPackage}")),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                            "${allGetData[index].dataLists![index].sellGb}")),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                            "${allGetData[index].dataLists![index].rechargePackage}")),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                            "${allGetData[index].dataLists![index].rechargeAmount}")),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                            "${allGetData[index].dataLists![index].gift}")),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                            "${allGetData[index].dataLists![index].giftName}")),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                            "${allGetData[index].dataLists![index].area}")),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                            "${allGetData[index].dataLists![index].location}")),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
