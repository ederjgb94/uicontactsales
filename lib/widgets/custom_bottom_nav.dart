import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mostrandskills/widgets/bottom_button_nav.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int activeIndex = 0;
  Key b1 = UniqueKey();
  Key b2 = UniqueKey();
  Key b3 = UniqueKey();
  Key b4 = UniqueKey();
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
            key: b1,
            color: Color(0xffF2DEDF),
            icon: CupertinoIcons.home,
            isSelected: activeIndex == 0,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: BottomNavButton(
            key: b2,
            color: Color(0xffF2DEDF),
            icon: Icons.wallet,
            isSelected: activeIndex == 1,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: BottomNavButton(
            key: b3,
            color: Color(0xffF2DEDF),
            icon: CupertinoIcons.graph_square,
            isSelected: activeIndex == 2,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: BottomNavButton(
            key: b4,
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
          if (index == 0) b1 = UniqueKey();
          if (index == 1) b2 = UniqueKey();
          if (index == 2) b3 = UniqueKey();
          if (index == 3) b4 = UniqueKey();
        });
      },
    );
  }
}
