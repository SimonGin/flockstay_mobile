// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:flockstay_mobile/models/auth/auth_entity.dart';
import 'package:flockstay_mobile/services/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<AuthEntity?> getMe() async {
  Dio dio = DioClient().dio;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("access_token");

  if (token == null) {
    print("No token found! User must log in.");
    return null;
  }

  try {
    Response response = await dio.get(
      "/me",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
    switch (response.statusCode) {
      case 200:
        AuthEntity authEntity = AuthEntity.fromJson(response.data["user"]);
        return authEntity;
      default:
        return null;
    }
  } catch (e) {
    print("Error: $e");
  }
  return null;
}
