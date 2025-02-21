import 'package:flockstay_mobile/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HotelInfoScreen extends StatelessWidget {
  const HotelInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size viewport = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              height: viewport.height * 0.4,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/hotel_1.jpg"),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: const Icon(Icons.chevron_left),
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(Colors.black),
                      backgroundColor: WidgetStateProperty.all(Colors.white),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border_outlined),
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(Colors.black),
                      backgroundColor: WidgetStateProperty.all(Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: viewport.height * 0.3,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, -30),
                      blurRadius: 35,
                      color: flockCyan.withOpacity(0.4),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "The Grand New York",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: flockCyan,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text("455 5th Ave, Manhattan",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color:
                                    const Color(0xff303030).withOpacity(0.8))),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          SizedBox(width: 5),
                          Text("4.8 (4.9K Reviews)",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ]),
                        Row(
                          children: [
                            RichText(
                                text: const TextSpan(
                                    style: TextStyle(color: Colors.black),
                                    children: [
                                  TextSpan(
                                    text: "\$180",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "/night",
                                    style: TextStyle(fontSize: 15),
                                  )
                                ])),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      color: Color(0xffEBEBEB),
                    ),
                    const Text(
                        "A luxurious hotel in the heart of NYC with breathtaking skyline views."),
                    const Text(
                      "What we offer",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
