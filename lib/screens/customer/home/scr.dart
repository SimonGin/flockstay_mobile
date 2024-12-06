import 'package:flockstay_mobile/constants/colors.dart';
import 'package:flockstay_mobile/screens/customer/home/city_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "FlockStay",
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: flockCyan, // Replace with your `flockCyan`
                      ),
                    ),
                  ),
                  Column(children: [
                    Text(
                      "Current Location",
                      style: TextStyle(
                          color: const Color(0xff303030).withOpacity(0.25),
                          fontWeight: FontWeight.w500),
                    ),
                    const Row(children: [
                      Icon(Icons.location_on, color: flockCyan),
                      Text(
                        "Ho Chi Minh City",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      )
                    ])
                  ])
                ],
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.only(
                    left: 15, right: 10, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 5,
                        color: Colors.black12)
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.search),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Where do you wanna go?",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Anywhere | Any week | Add guests",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.35)))
                        ]),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        border: Border.all(color: const Color(0xffE3E3E4)),
                      ),
                      child: Icon(MdiIcons.tuneVariant),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Text(
                    "Explore cities",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Wrap(
            spacing: 10,
            children: [
              CityCard(
                name: "New York",
                image: "assets/images/city_2.jpg",
                hotelNum: 186,
              ),
              CityCard(
                name: "Da Nang",
                image: "assets/images/city_1.webp",
                hotelNum: 256,
              ),
              CityCard(
                name: "New York",
                image: "assets/images/city_2.jpg",
                hotelNum: 186,
              ),
            ],
          ),
        )
      ],
    ));
  }
}
