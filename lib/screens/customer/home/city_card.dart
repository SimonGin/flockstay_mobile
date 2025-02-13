import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final String name, image;
  final int hotelNum;

  const CityCard(
      {super.key,
      required this.name,
      required this.image,
      required this.hotelNum});

  @override
  Widget build(BuildContext context) {
    Size viewport = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        height: viewport.height * 0.28,
        width: viewport.width * 0.38,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: const [
            BoxShadow(
                offset: Offset(5, 5), blurRadius: 5, color: Colors.black26)
          ],
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
          height: viewport.height * 0.28,
          width: viewport.width * 0.38,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.6),
                  ]))),
      Positioned(
        bottom: 10,
        left: 10,
        right: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Text("$hotelNum ${hotelNum == 1 ? 'Hotel' : 'Hotels'}",
                style: const TextStyle(color: Colors.white))
          ],
        ),
      )
    ]);
  }
}
