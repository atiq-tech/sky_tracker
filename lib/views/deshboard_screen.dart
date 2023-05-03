import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sky_tracker/conts/app_colors.dart';
import 'package:sky_tracker/views/auth/login_page.dart';
import 'package:sky_tracker/views/entry_screen.dart';
import 'package:sky_tracker/widget/my_profile.dart';
import '../widget/deshboard.dart';
import 'data_list_screen.dart';

class DeshBoardScreen extends StatefulWidget {
  const DeshBoardScreen(
      {required this.currentPosition, required this.token, super.key});
  final Position currentPosition;
  final String token;

  @override
  State<DeshBoardScreen> createState() => _DeshBoardScreenState();
}

class _DeshBoardScreenState extends State<DeshBoardScreen> {
  String? _currentAddress;

  Future _logOut(context) async {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            title: const Text("Are you sure to logout?"),
            content: SizedBox(
              // height:100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.kPrimaryColor,
                      //shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("No"),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LogInPage(),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.kPrimaryColor,
                      // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("Yes"),
                  ),
                ],
              ),
            ),
          );
        });
  }

  // Future<void> _getCurrentAddress() async {
  //   final List<Placemark> placemarks = await placemarkFromCoordinates(
  //     widget.currentPosition.latitude,
  //     widget.currentPosition.longitude,
  //   );
  //   // setState(() {
  //   //   _currentAddress =
  //   //       "${placemarks.first.subLocality!},${placemarks.first.thoroughfare!}, ${placemarks.first.locality!}";
  //   // });
  // }

  // @override
  // void initState() {
  //   _getCurrentAddress();
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SKY  TRACKER"),
        centerTitle: true,
        backgroundColor: AppColors.kPrimaryColor,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Banglalink-Logo.jpg"),
                  fit: BoxFit.fill,
                ),
                // color: AppColors.kPrimaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfjno7hGrNNuPZwaFZ8U8Mhr_Yq39rzd_p0YN_HVYk6KFmMETjtgd9bwl0UhU6g4xDDGg&usqp=CAU"),
                    radius: 37,
                  ),
                  Text(
                    "Admin",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  Icon(Icons.expand_circle_down, color: Colors.white),
                ],
              ),
            ),
            ListTile(
              //leading: const Icon(Icons.person_outline_rounded),
              title: const Text(
                'Profile',
                style: TextStyle(color: AppColors.kPrimaryColor),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              // leading: const Icon(Icons.logout),
              title: const Text(
                'Sign out',
                style: TextStyle(color: AppColors.kPrimaryColor),
              ),
              onTap: () {
                _logOut(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 80.0,
                  color: AppColors.kPrimaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 68.0),
                        child: Text(
                          'Welcome, Admin',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfjno7hGrNNuPZwaFZ8U8Mhr_Yq39rzd_p0YN_HVYk6KFmMETjtgd9bwl0UhU6g4xDDGg&usqp=CAU"),
                        radius: 25,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Dashboard :",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Positioned(
                  right: 200,
                  top: 130,
                  child: DeshBoard(
                    title: "Data Entry",
                    icon: Icons.receipt_long_outlined,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) {
                          return DataEntryScreen(
                            currentPositionUser: widget.currentPosition,
                            token: widget.token,
                          );
                        }),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 10.0),
                Positioned(
                  right: 70,
                  top: 130,
                  child: DeshBoard(
                    title: "Data List",
                    icon: Icons.list_alt_outlined,
                    onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => DataListScreen(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Positioned(
                  right: 200,
                  top: 130,
                  child: DeshBoard(
                    title: "My Profile",
                    icon: Icons.person,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => MyProfile()),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 10.0),
                Positioned(
                  right: 70,
                  top: 130,
                  child: DeshBoard(
                    title: "Log Out",
                    icon: Icons.login,
                    onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => LogInPage(),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
