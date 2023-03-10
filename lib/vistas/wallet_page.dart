import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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
      'color': Color(0xFFE9F4FA),
      'movimientos': [
        {
          'icon': Icon(Icons.music_note_outlined),
          'titulo': 'Spotify',
          'fecha': 'Mar 2, 12:53pm',
          'precio': '-\$999.99',
        },
        {
          'icon': Icon(Icons.local_grocery_store_outlined),
          'titulo': 'Grocery',
          'fecha': 'Mar 2, 12:53pm',
          'precio': '-\$999.99',
        },
        {
          'icon': Icon(Icons.food_bank_outlined),
          'titulo': 'Food',
          'fecha': 'Mar 2, 12:53pm',
          'precio': '-\$999.99',
        },
      ]
    },
    {
      'nombre': 'Roberto',
      'numero': '1234 5678',
      'color': Color(0xFFE5DCF1),
      'movimientos': [
        {
          'icon': Icon(Icons.ac_unit_outlined),
          'titulo': 'Lo que sea',
          'fecha': 'Mar 2, 12:53pm',
          'precio': '-\$999.99',
        },
        {
          'icon': Icon(Icons.ac_unit_outlined),
          'titulo': 'Comida',
          'fecha': 'Mar 2, 12:53pm',
          'precio': '-\$999.99',
        },
        {
          'icon': Icon(Icons.ac_unit_outlined),
          'titulo': 'No se',
          'fecha': 'Mar 2, 12:53pm',
          'precio': '-\$999.99',
        },
        {
          'icon': Icon(Icons.ac_unit_outlined),
          'titulo': 'No se',
          'fecha': 'Mar 2, 12:53pm',
          'precio': '-\$999.99',
        },
      ]
    },
    {
      'nombre': 'Luis',
      'numero': '1234 5678',
      'color': const Color(0xFFE9F4FA),
      'movimientos': [
        {
          'icon': Icon(Icons.shopping_cart_outlined),
          'titulo': 'Lo que sea',
          'fecha': 'Mar 2, 12:53pm',
          'precio': '-\$999.99',
        },
        {
          'icon': Icon(Icons.ac_unit_outlined),
          'titulo': 'Comida',
          'fecha': 'Mar 2, 12:53pm',
          'precio': '-\$999.99',
        },
      ],
    },
    {
      'nombre': '',
      'numero': '',
      'color': Colors.grey.shade300,
      'movimientos': []
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60),
            height: 350,
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
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: SizedBox(
              width: 350,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  for (int i = 0;
                      i < listCard[index]['movimientos'].length;
                      i++)
                    ListTile(
                      leading: listCard[index]['movimientos'][i]['icon'],
                      title: Text(
                        listCard[index]['movimientos'][i]['titulo'],
                        style: GoogleFonts.inter(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        listCard[index]['movimientos'][i]['fecha'],
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Text(
                        listCard[index]['movimientos'][i]['precio'],
                        style: GoogleFonts.inter(
                          fontSize: 16.5,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
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
