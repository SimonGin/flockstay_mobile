import 'package:flockstay_mobile/apis/explore/get_cities.dart';
import 'package:flockstay_mobile/models/city/city.dart';
import 'package:flockstay_mobile/screens/customer/home/city_card.dart';
import 'package:flutter/material.dart';

class ExploreCityList extends StatefulWidget {
  const ExploreCityList({
    super.key,
  });

  @override
  State<ExploreCityList> createState() => _ExploreCityListState();
}

class _ExploreCityListState extends State<ExploreCityList> {
  List<City> exploreCities = [];

  @override
  void initState() {
    super.initState();
    loadExploreCities();
  }

  Future<void> loadExploreCities() async {
    exploreCities = await getCities();
    if (mounted) {
      setState(() {
        exploreCities = exploreCities;
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
          children: exploreCities.map((city) {
            return CityCard(
              name: city.name,
              image: city.image,
              hotelNum: 1,
            );
          }).toList()),
    );
  }
}
