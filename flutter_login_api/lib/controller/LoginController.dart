import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import '../model/user.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  String _msg = "";

  // Submit Method
  Future<void> submit() async {
    // Ensure text is trimmed to avoid empty spaces
    User user = User(
      username: username.text.trim(),
      password: password.text.trim(),
    );

    bool validateResult = ValidateUser(user);

    if (validateResult) {
      bool serverResponse = await authenticatedUser(user);
      if (serverResponse) {
        await showMessage(
          context: Get.context!,
          title: 'Success',
          message: "User Login Successfully !",
        );
      } else {
        await showMessage(
          context: Get.context!,
          title: 'Error',
          message: "Incorrect username or password",
        );
      }
    } else {
      await showMessage(
        context: Get.context!,
        title: 'Error',
        message: _msg,
      );
    }
  }

  // Validate User Method
  bool ValidateUser(User user) {
    // No need to check for null as they will never be null here
    if (user.username.toString().isEmpty || user.password.toString().isEmpty) {
      _msg = "Username or Password cannot be empty";
      return false;
    }
    return true;
  }

  // Authenticated User
  Future<bool> authenticatedUser(User user) async {
    Dio dio = Dio(BaseOptions(connectTimeout: Duration(seconds: 5)));
    String url = 'https://dummyjson.com/auth/login';

    try {
      Map<String, dynamic> requestData = {
        'username': user.username,
        'password': user.password,
      };

      final response = await dio.post(url, data: requestData);

      return response.statusCode == 200;
    } catch (e) {
      print("Error during authentication: $e"); // Log error for debugging
      return false;
    }
  }

  // Show dialog alert to confirm
  showMessage({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              child: Text('Ok'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
