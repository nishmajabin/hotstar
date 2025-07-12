import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotstar_clone/widgets/colors.dart';
import 'package:hotstar_clone/download/download_screen.dart';
import 'package:hotstar_clone/home_screen.dart';
import 'package:hotstar_clone/my_space/my_space_screen.dart';
import 'package:hotstar_clone/searching/search_screen.dart';
import 'package:hotstar_clone/sparks/sparks_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomBottomNavigate extends StatefulWidget {
  final int initialIndex;
  const CustomBottomNavigate({super.key, this.initialIndex = 0});

  @override
  State<CustomBottomNavigate> createState() => _CustomBottomNavigateState();
}

class _CustomBottomNavigateState extends State<CustomBottomNavigate> {
  late int indexNum;

  @override
  void initState() {
    super.initState();
    indexNum = widget.initialIndex;
  }

  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    SparksScreen(),
    DownloadsScreen(),
    MySpaceScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[indexNum],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexNum,
        onTap: (index) {
          setState(() {
            indexNum = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: mainColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        iconSize: 22,
        items: [
          BottomNavigationBarItem(
            icon: indexNum == 0
                ? Icon(Icons.home_rounded)
                : Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: indexNum == 2
                ? Icon(Icons.videocam)
                : Icon(Icons.videocam_outlined),
            label: 'Sparks',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.arrow_down_to_line),
            label: 'Downloads',
          ),
          BottomNavigationBarItem(
            icon: indexNum == 4
                ? Icon(CupertinoIcons.person_crop_circle)
                : Icon(MdiIcons.accountCircleOutline),
            label: 'My Space',
          ),
        ],
      ),
    );
  }
}
