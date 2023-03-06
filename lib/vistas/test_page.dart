import 'package:flutter/material.dart';
import 'package:scaled_list/scaled_list.dart';

class TestPage extends StatelessWidget {
  final List<Color> kMixedColors = [
    Color(0xff71A5D7),
    Color(0xff72CCD4),
    Color(0xffFBAB57),
    Color(0xffF8B993),
    Color(0xff962D17),
    Color(0xffc657fb),
    Color(0xfffb8457),
  ];

  final List<String> categories = [
    'category1',
    'category2',
    'category3',
    'category4',
    'category5',
    'category6',
    'category7',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScaledList(
        itemCount: categories.length,
        itemColor: (index) {
          return kMixedColors[index % kMixedColors.length];
        },
        itemBuilder: (index, selectedIndex) {
          final category = categories[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: selectedIndex == index ? 100 : 80,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.red,
                ),
              ),
              SizedBox(height: 15),
              Text(
                category,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: selectedIndex == index ? 25 : 20),
              )
            ],
          );
        },
      ),
    );
  }
}
