// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:flockstay_mobile/routes/index.dart';
import 'package:flockstay_mobile/services/dio_client.dart';
import 'package:quickalert/quickalert.dart';
import 'package:go_router/go_router.dart';

Future<void> register(String phone, String name, String password) async {
  if (phone.isEmpty || name.isEmpty || password.isEmpty) {
    QuickAlert.show(
      context: navigatorKey.currentContext!,
      type: QuickAlertType.warning,
      text: "Please fill in all the inputs before registering!",
    );
    return;
  }

  Dio dio = DioClient().dio;

  try {
    Response response = await dio.post("/auth/register",
        data: {"phone": phone, "username": name, "password": password});
    if (navigatorKey.currentContext == null) {
      print("Navigator context is null! Cannot show alert.");
      return;
    }
    switch (response.statusCode) {
      case 200:
        QuickAlert.show(
          context: navigatorKey.currentContext!,
          type: QuickAlertType.success,
          text: "Registration successful!",
          onConfirmBtnTap: () =>
              {GoRouter.of(navigatorKey.currentContext!).goNamed("login")},
        );
        break;
      case 409:
        QuickAlert.show(
          context: navigatorKey.currentContext!,
          type: QuickAlertType.error,
          text: "Phone number already registered!",
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
