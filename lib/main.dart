import 'dart:convert';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:mostrandskills/custom_bottom_nav.dart';
import 'package:mostrandskills/tarjeta.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _bottomNavIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var url = Uri.https('d1c8-148-237-97-199.ngrok.io', 'api/products/1');
          var response = await http.get(url);
          print('Response status: ${response.statusCode}');
          // print('Response body: ${response.body}');
          Map<String, dynamic> data = jsonDecode(response.body);
          var precio = double.parse(data['precio']);
          print((precio * 2));
          // Map<String, dynamic> persona = data[0];
          // print(persona['id']);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade50,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              children: [
                RotatedBox(
                  quarterTurns: 3,
                  child: Icon(
                    CupertinoIcons.line_horizontal_3_decrease,
                  ),
                ),
                Expanded(child: SizedBox()),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(
                      color: Color(0xffD2D2D2),
                      width: 2,
                    ),
                  ),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://i.pravatar.cc/150?img=5',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Row(
              children: [
                Expanded(
                  child: DelayedDisplay(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Hello Sara\n',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: 'Welcome Back !',
                            style: GoogleFonts.poppins(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Icon(
                  CupertinoIcons.slider_horizontal_3,
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: DelayedDisplay(
                    slidingBeginOffset: Offset(0, -.35),
                    delay: Duration(
                      milliseconds: 700,
                    ),
                    child: Tarjeta(
                        color: Color(0xffB8DFDC),
                        height: 160,
                        icon: Icon(
                          Icons.token_outlined,
                          size: 28,
                        ),
                        title: '230k',
                        subtitle: 'Sales'),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: DelayedDisplay(
                    slidingBeginOffset: Offset(.35, 0),
                    delay: Duration(
                      milliseconds: 900,
                    ),
                    child: Tarjeta(
                        color: Color(0xffE8DFF3),
                        height: 180,
                        icon: Icon(
                          Icons.account_circle_outlined,
                          size: 28,
                        ),
                        title: '8.549k',
                        subtitle: 'Customers'),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: DelayedDisplay(
                    slidingBeginOffset: Offset(-.35, 0),
                    delay: Duration(
                      milliseconds: 1100,
                    ),
                    child: Tarjeta(
                        color: Color(0xffF2EEE8),
                        height: 180,
                        icon: Icon(
                          Icons.auto_awesome_mosaic_outlined,
                          size: 28,
                        ),
                        title: '1.423k',
                        subtitle: 'Products'),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: DelayedDisplay(
                    delay: Duration(
                      milliseconds: 1300,
                    ),
                    child: Tarjeta(
                        color: Color(0xffEF5DEDF),
                        height: 160,
                        icon: Icon(
                          CupertinoIcons.chart_pie,
                          size: 28,
                        ),
                        title: '\$9745',
                        subtitle: 'Revenue'),
                  ),
                ),
              ],
            ),
            SizedBox(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: CustomBottomNav()),
    );
  }
}
