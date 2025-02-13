import 'package:flockstay_mobile/apis/explore/get_hotels.dart';
import 'package:flockstay_mobile/models/hotel/hotel.dart';
import 'package:flutter/material.dart';
import 'package:flockstay_mobile/screens/customer/home/hotel_card.dart';

class PopularHotelList extends StatefulWidget {
  const PopularHotelList({
    super.key,
  });

  @override
  State<PopularHotelList> createState() => _PopularHotelListState();
}

class _PopularHotelListState extends State<PopularHotelList> {
  List<Hotel> popHotels = [];
  @override
  void initState() {
    super.initState();
    loadPopHotelList();
  }

  Future<void> loadPopHotelList() async {
    popHotels = await getHotels();
    if (mounted) {
      setState(() {
        popHotels = popHotels;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Wrap(
          spacing: 10,
          children: popHotels.map((hotel) {
            return HotelCard(
              name: hotel.name,
              image: hotel.images[0],
              location: hotel.city,
              price: 100,
              rating: hotel.rating,
            );
          }).toList()),
    );
  }
}
