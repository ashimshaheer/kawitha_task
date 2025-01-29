import 'dart:developer';

import 'package:flutter/widgets.dart';

import '../../../helpers/service.dart';
import '../model/dara.dart';

class HomeProvider extends ChangeNotifier {
  ListDatas listDatas = ListDatas();

  Future<void> getHomeData() async {
    try {
      List response = await ServerClient.get('https://jsonplaceholder.typicode.com/comments');
      if (response.first >= 200 || response.first < 300) {
        listDatas = ListDatas.fromJson(response.last);
      } else {
        log('error is $response');
      }
    } catch (e) {
      log('error is $e');
    } finally {
      notifyListeners();
    }
  }
}
