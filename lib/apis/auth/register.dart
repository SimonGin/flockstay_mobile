// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flockstay_mobile/services/dio_client.dart';

Future<void> register(String phone, String name, String password) async {
  Dio dio = DioClient().dio;

  try {
    Response response = await dio.post("/auth/register",
        data: {"phone": phone, "username": name, "password": password});
    if (response.statusCode == 200) {
      print("Registration successful!");
    } else if (response.statusCode == 409) {
      print("Phone number already in use!");
    } else {
      print("Registration failed!");
    }
  } catch (e) {
    print("Error: $e");
  }
}
