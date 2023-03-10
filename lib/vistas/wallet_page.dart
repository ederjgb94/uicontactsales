import 'package:flutter/material.dart';
import '../widgets/Cwallet.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key, required this.title});

  final String title;

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final PageController controller = PageController();
  int index = 0;

  List<Map<String, dynamic>> listCard = [
    {
      'nombre': 'Ana',
      'numero': '1234 5678',
      'color': Colors.teal,
    },
    {
      'nombre': 'Roberto',
      'numero': '1234 5678',
      'color': Colors.red,
    },
    {
      'nombre': 'Luis',
      'numero': '1234 5678',
      'color': Colors.blue,
    },
    {
      'nombre': '',
      'numero': '',
      'color': Colors.grey.shade300,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 100),
            height: 390,
            child: PageView(
              physics: const BouncingScrollPhysics(),
              padEnds: false,
              onPageChanged: (index) {
                setState(() {
                  this.index = index;
                });
              },
              controller: PageController(viewportFraction: 0.65),
              children: List.generate(
                listCard.length,
                (index) => WalletCardFinal(
                  tamano: listCard.length,
                  color: listCard[index]['color'],
                  indexL: index,
                  indexP: this.index,
                  nombre: listCard[index]['nombre'],
                  numero: listCard[index]['numero'],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 350,
              decoration: const BoxDecoration(
                  //color: Color.fromARGB(255, 101, 151, 179),
                  ),
              child: ListView(
                physics: const BouncingScrollPhysics(),
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
