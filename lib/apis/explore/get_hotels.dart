import 'package:dio/dio.dart';
import 'package:flockstay_mobile/models/hotel/hotel.dart';
import 'package:flockstay_mobile/services/dio_client.dart';
import 'package:flutter/material.dart';

Future<List<Hotel>> getHotels() async {
  Dio dio = DioClient().dio;

  try {
    Response response = await dio.get("/explore/hotels");
    switch (response.statusCode) {
      case 200:
        List<Hotel> hotels =
            Hotel.fromJsonList(response.data["metadata"]["data"]);
        return hotels;
      default:
        break;
    }
  } catch (e) {
    debugPrint("Error: $e");
  }
  return [];
}
