import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mostrandskills/bottom_button_nav.dart';

class CustomBottomNav extends StatefulWidget {
  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 0,
      elevation: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: BottomNavButton(
            color: Color(0xffF2DEDF),
            icon: CupertinoIcons.home,
            isSelected: activeIndex == 0,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: BottomNavButton(
            color: Color(0xffF2DEDF),
            icon: Icons.wallet,
            isSelected: activeIndex == 1,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: BottomNavButton(
            color: Color(0xffF2DEDF),
            icon: CupertinoIcons.graph_square,
            isSelected: activeIndex == 2,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: BottomNavButton(
            color: Color(0xffF2DEDF),
            icon: CupertinoIcons.person,
            isSelected: activeIndex == 3,
          ),
          label: '',
        ),
      ],
      currentIndex: activeIndex,
      selectedItemColor: Colors.amber[800],
      onTap: (index) {
        setState(() {
          activeIndex = index;
        });
      },
    );
  }
}
