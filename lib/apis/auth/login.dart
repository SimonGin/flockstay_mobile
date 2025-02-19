// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:flockstay_mobile/models/auth/login_response.dart';
import 'package:flockstay_mobile/routes/index.dart';
import 'package:flockstay_mobile/services/dio_client.dart';
import 'package:quickalert/quickalert.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> login(String phone, String password) async {
  if (phone.isEmpty || password.isEmpty) {
    QuickAlert.show(
      context: navigatorKey.currentContext!,
      type: QuickAlertType.warning,
      text: "Please fill in all the inputs before logging in!",
    );
    return;
  }
  Dio dio = DioClient().dio;

  try {
    Response response = await dio
        .post("/auth/login", data: {"phone": phone, "password": password});
    if (navigatorKey.currentContext == null) {
      print("Navigator context is null! Cannot show alert.");
      return;
    }
    switch (response.statusCode) {
      case 200:
        LoginResponse loginData = LoginResponse.fromJson(response.data);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', loginData.accessToken);
        QuickAlert.show(
          context: navigatorKey.currentContext!,
          type: QuickAlertType.success,
          text: "Login successfully!",
          onConfirmBtnTap: () =>
              GoRouter.of(navigatorKey.currentContext!).goNamed("home"),
        );
        break;
      case 401:
      case 404:
        QuickAlert.show(
          context: navigatorKey.currentContext!,
          type: QuickAlertType.error,
          text: "Phone number or password is incorrect!",
        );
        break;
      default:
        QuickAlert.show(
          context: navigatorKey.currentContext!,
          type: QuickAlertType.error,
          text: "Something went wrong! Please try again later.",
        );
    }
  } catch (e) {
    print("Error: $e");
  }
}
