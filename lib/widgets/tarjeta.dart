import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tarjeta extends StatelessWidget {
  final Color color;
  final double height;
  final Icon icon;
  final String title;
  final String subtitle;

  const Tarjeta(
      {super.key,
      required this.color,
      required this.height,
      required this.icon,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: GoogleFonts.poppins(),
          ),
        ],
      ),
    );
  }
}
