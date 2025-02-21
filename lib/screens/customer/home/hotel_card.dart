import 'package:flockstay_mobile/constants/colors.dart';
import 'package:flutter/material.dart';

class HotelCard extends StatelessWidget {
  final String name;
  final String image;
  final String location;
  final int price;
  final double rating;
  final VoidCallback viewInfo;

  const HotelCard({
    super.key,
    required this.name,
    required this.image,
    required this.location,
    required this.price,
    required this.rating,
    required this.viewInfo,
  });

  @override
  Widget build(BuildContext context) {
    Size viewport = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: viewInfo,
      behavior: HitTestBehavior.translucent,
      child: AbsorbPointer(
        child: Container(
          width: viewport.width * 0.75,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(5, 5), blurRadius: 5, color: Colors.black26)
              ]),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: viewport.height * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(image), fit: BoxFit.cover)),
                  ),
                  IconButton(
                    alignment: Alignment.topRight,
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border_outlined),
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                      backgroundColor:
                          WidgetStateProperty.all(Colors.black.withAlpha(80)),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 180,
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                        ),
                      ),
                      RichText(
                          text: TextSpan(
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                              ),
                              children: [
                            TextSpan(
                              text: "\$$price",
                              style: const TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: "/night",
                              style: TextStyle(
                                  color:
                                      const Color(0xff303030).withOpacity(0.5)),
                            )
                          ])),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: flockCyan,
                            size: 17,
                          ),
                          Text(location,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xff303030)
                                      .withOpacity(0.5))),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 17,
                          ),
                          Text("$rating",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
