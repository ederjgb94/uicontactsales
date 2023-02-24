import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final bool isSelected;

  const BottomNavButton(
      {super.key,
      required this.color,
      required this.icon,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 40,
          bottom: 0,
          right: 0,
          left: 0,
          child: DelayedDisplay(
            slidingBeginOffset: const Offset(0, 0),
            child: Container(
              height: 80,
              color: isSelected ? color : null,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          height: 80,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(40),
          ),
          child: DelayedDisplay(
            slidingBeginOffset: const Offset(0, 0),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: isSelected ? color : null,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -60,
          left: -100,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(80),
            ),
          ),
        ),
        Positioned(
          bottom: -60,
          right: -100,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(80),
            ),
          ),
        ),
      ],
    );
  }
}
