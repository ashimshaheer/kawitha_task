import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../utils/preference.dart';
import '../../../helpers/service.dart';
import '../../home/view/home_page.dart';
import '../model/user_model.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserModel userData = UserModel();

  Future login({required BuildContext context}) async {
    try {
      List response = await ServerClient.post(
        'https://dummyjson.com/auth/login',
        data: {'username': userController.text, 'password': passwordController.text},
        post: true,
      );
      if (response.first >= 200 || response.first < 300) {
        // var data = jsonDecode(response.last);
        // log('data is $data');
        userData = UserModel.fromJson(response.last);
        //  log('data issssssssssss $data');
        AppPref.userToken = userData.accessToken.toString();
        AppPref.refreshToken = userData.refreshToken.toString();
        AppPref.isSignedIn = true;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        userController.clear();
        passwordController.clear();
      } else {
        AlertDialog(
          title: const Text('Error'),
          content: Text(response.last.toString()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            )
          ],
        );
        userController.clear();
        passwordController.clear();
      }
    } catch (e) {
      log('error is $e');
      userController.clear();
      passwordController.clear();
    } finally {
      notifyListeners();
    }
  }

  logout({required BuildContext context}) async {
    AppPref.isSignedIn = false;
    AppPref.userToken = '';
    AppPref.refreshToken = '';
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
    notifyListeners();
  }
}
