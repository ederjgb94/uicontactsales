import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletCardFinal extends StatelessWidget {
  final Color color;
  final String numero;
  final String nombre;
  final int indexP;
  final int indexL;
  final int tamano;

  const WalletCardFinal({
    super.key,
    required this.color,
    required this.numero,
    required this.nombre,
    required this.indexP,
    required this.indexL,
    required this.tamano,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(40),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: indexL == tamano - 1
            ? Colors.grey.shade300
            : indexL == indexP
                ? color
                : color.withOpacity(.8),
        borderRadius: BorderRadius.circular(50),
      ),
      child: indexL == tamano - 1 ? add() : tarjeta(),
    );
  }

  Container add() {
    return Container(
      child: const Icon(Icons.add),
    );
  }

  Column tarjeta() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
          width: 60,
          child: Stack(
            clipBehavior: Clip.hardEdge,
            alignment: Alignment.topRight,
            children: [
              Positioned(
                left: 23,
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Color(0xFF9EA5AB),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(''),
                ),
              ),
              Positioned(
                right: 25,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(''),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'CARD NUMBER',
          style: GoogleFonts.inter(
            fontSize: 10,
          ),
        ),
        Text(
          numero,
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            wordSpacing: 1.5,
          ),
        ),
        const SizedBox(
          height: 44,
        ),
        Text(
          nombre,
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class Mov extends StatelessWidget {
  final Icon icon;
  final String titulo;
  final String fecha;
  final String precio;

  const Mov({
    super.key,
    required this.icon,
    required this.titulo,
    required this.fecha,
    required this.precio,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(titulo),
          subtitle: Text(fecha),
          trailing: Text(
            '-\$$precio',
            style: GoogleFonts.inter(
              fontSize: 18,
            ),
          ),
          leading: icon,
        ),
        const Divider(
          height: 0,
          thickness: 1,
        ),
      ],
    );
  }
}

class Movimiento extends StatelessWidget {
  final Icon icon;
  final String titulo;
  final String fecha;
  final String precio;
  final String imagen;

  const Movimiento({
    super.key,
    required this.icon,
    required this.titulo,
    required this.fecha,
    required this.precio,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          //color: Colors.green,
          ),
      child: Row(
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagen),
                //fit: BoxFit.cover,
              ),
            ),
            //child: Text(''),
          ),
          SizedBox(
            width: 25,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    //alignment: Alignment.bottomCenter,
                    child: Text(
                      titulo,
                      style: GoogleFonts.inter(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    //alignment: Alignment.bottomCenter,
                    child: Text(
                      fecha,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                '-\$' + precio,
                style: GoogleFonts.inter(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
