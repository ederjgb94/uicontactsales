import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scaled_list/scaled_list.dart';
import '../widgets/Cwallet.dart';
import '../widgets/tarjeta.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key, required this.title});

  final String title;

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final PageController controller = PageController();
  List<Map<String, String>> tarjetas = [
    {
      'numero': '3829 4820',
      'nombre': "Nombre",
      'fecha': "fecha",
      'cvv': "cvv",
    },
    {
      'numero': '3829 4820',
      'nombre': "Nombre",
      'fecha': "fecha",
      'cvv': "cvv",
    },
    {
      'numero': '3829 4820',
      'nombre': "Nombre",
      'fecha': "fecha",
      'cvv': "cvv",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //clipBehavior: Clip.none,
        //alignment: Alignment.center,
        children: [
          //const SizedBox(height: 300),
          Container(
            padding: const EdgeInsets.only(top: 100),
            height: 390,
            //width: 400,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              controller: ScrollController(
                initialScrollOffset: 200,
              ),
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(
                  width: 15,
                ),
                const WalletCard(
                    numero: '3829 4820',
                    nombre: "Nombre",
                    fecha: "fecha",
                    cvv: "cvv",
                    color: Color(0xFFE9F4FA)),
                const WalletCard(
                    numero: '1234 5678',
                    nombre: "Nombre",
                    fecha: "fecha",
                    cvv: "cvv",
                    color: Color(0xFFE5DCF1)),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: 350,
              decoration: const BoxDecoration(
                  //color: Color.fromARGB(255, 101, 151, 179),
                  ),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: const [
                  Movimiento(
                    icon: Icon(Icons.ac_unit_outlined),
                    titulo: "Spotify",
                    fecha: "Mar 2, 12:53pm",
                    precio: "999.99",
                    imagen: 'assets/logotipo-de-spotify.png',
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Movimiento(
                    icon: Icon(Icons.ac_unit_outlined),
                    titulo: "Grocery",
                    fecha: "Mar 2, 12:53pm",
                    precio: "999.99",
                    imagen: 'assets/food.png',
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Movimiento(
                    icon: Icon(Icons.ac_unit_outlined),
                    titulo: "Food",
                    fecha: "Mar 2, 12:53pm",
                    precio: "999.99",
                    imagen: 'assets/porcion-de-pizza.png',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
