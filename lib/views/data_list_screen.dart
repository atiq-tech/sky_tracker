import 'package:flutter/material.dart';

class DataListScreen extends StatefulWidget {
  @override
  State<DataListScreen> createState() => _DataListScreenState();
}

class _DataListScreenState extends State<DataListScreen> {
  List<Map<String, dynamic>> datas = [
    {"name": "John", "phone": "01748569102", "location": "USA"},
    {"name": "Jane", "phone": "01748569102", "location": "Canada"},
    {"name": "Mark", "phone": "01748569102", "location": "Australia"},
    {"name": "Emily", "phone": "01748569102", "location": "UK"},
    {"name": "Lily", "phone": "01748469102", "location": "BD"},
    {"name": "mily", "phone": "01748569102", "location": "Egypt"},
    {"name": "John", "phone": "01748569102", "location": "USA"},
    {"name": "Jane", "phone": "01748569102", "location": "Canada"},
    {"name": "Mark", "phone": "01748569102", "location": "Australia"},
    {"name": "Emily", "phone": "01748569102", "location": "UK"},
    {"name": "Lily", "phone": "01748469102", "location": "BD"},
    {"name": "mily", "phone": "01748569102", "location": "Egypt"},
    {"name": "John", "phone": "01748569102", "location": "USA"},
    {"name": "Jane", "phone": "01748569102", "location": "Canada"},
    {"name": "Mark", "phone": "01748569102", "location": "Australia"},
    {"name": "Emily", "phone": "01748569102", "location": "UK"},
    {"name": "Lily", "phone": "01748469102", "location": "BD"},
    {"name": "mily", "phone": "01748569102", "location": "Egypt"},
    {"name": "John", "phone": "01748569102", "location": "USA"},
    {"name": "Jane", "phone": "01748569102", "location": "Canada"},
    {"name": "Mark", "phone": "01748569102", "location": "Australia"},
    {"name": "Emily", "phone": "01748569102", "location": "UK"},
    {"name": "Lily", "phone": "01748469102", "location": "BD"},
    {"name": "mily", "phone": "01748569102", "location": "Egypt"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DataTable(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  columns: const <DataColumn>[
                    DataColumn(label: Text("Name")),
                    DataColumn(label: Text("Phone")),
                    DataColumn(label: Text("Location")),
                    DataColumn(label: Text("Action")),
                  ],
                  rows: datas
                      .map((data) => DataRow(
                            cells: [
                              DataCell(
                                Text(data["name"]),
                              ),
                              DataCell(
                                Text(data["phone"]),
                              ),
                              DataCell(
                                Text(data["location"]),
                              ),
                              DataCell(IconButton(
                                onPressed: () {
                                  setState(() {
                                    datas.remove(data);
                                  });
                                },
                                icon: const Icon(Icons.delete),
                              )),
                            ],
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
