import 'package:dio/dio.dart';
import 'package:flockstay_mobile/models/city/city.dart';
import 'package:flockstay_mobile/services/dio_client.dart';
import 'package:flutter/material.dart';

Future<List<City>> getCities() async {
  Dio dio = DioClient().dio;

  try {
    Response response = await dio.get("/explore/cities");
    switch (response.statusCode) {
      case 200:
        List<City> cities =
            City.fromJsonList(response.data["metadata"]["data"]);
        return cities;
      default:
        break;
    }
  } catch (e) {
    debugPrint("Error: $e");
  }
  return [];
}
