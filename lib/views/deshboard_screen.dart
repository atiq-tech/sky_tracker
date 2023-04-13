import 'package:flutter/material.dart';
import 'package:sky_tracker/views/data_list_screen.dart';
import 'package:sky_tracker/views/entry_screen.dart';

class DeshBoardScreen extends StatelessWidget {
  const DeshBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 125, 122, 255),
            automaticallyImplyLeading: false,
            title: const Text(
              "Desh Board",
            ),
            centerTitle: true,
            elevation: 0,
            bottom: TabBar(
              indicatorColor: Colors.black,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.only(
                  top: 10, left: 10, right: 10, bottom: 15),
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.teal,
              ),
              tabs: [
                Tab(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text("Entry"),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text("Data List"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            EntryScreen(),
            DataListScreen(),
          ],
        ),
      ),
    );
  }
}
