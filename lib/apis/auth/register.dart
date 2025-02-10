// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:flockstay_mobile/routes/index.dart';
import 'package:flockstay_mobile/services/dio_client.dart';
import 'package:quickalert/quickalert.dart';
import 'package:go_router/go_router.dart';

Future<void> register(String phone, String name, String password) async {
  Dio dio = DioClient().dio;

  try {
    Response response = await dio.post("/auth/register",
        data: {"phone": phone, "username": name, "password": password});
    if (navigatorKey.currentContext == null) {
      print("Navigator context is null! Cannot show alert.");
      return;
    }
    if (response.statusCode == 200) {
      QuickAlert.show(
        context: navigatorKey.currentContext!,
        type: QuickAlertType.success,
        text: "Registration successful!",
        onConfirmBtnTap: () =>
            {GoRouter.of(navigatorKey.currentContext!).goNamed("login")},
      );
    } else if (response.statusCode == 409) {
      QuickAlert.show(
        context: navigatorKey.currentContext!,
        type: QuickAlertType.error,
        text: "Phone number already registered!",
      );
    } else {
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
