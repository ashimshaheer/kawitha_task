import 'dart:convert';
import 'dart:developer';

import 'package:flutter/widgets.dart';

import '../../../helpers/service.dart';
import '../model/dara.dart';

class HomeProvider extends ChangeNotifier {
  List<ListDatas> listDatas = [];

  Future<void> getHomeData() async {
    try {
      List response = await ServerClient.get('https://jsonplaceholder.typicode.com/comments');
      if (response.first >= 200 || response.first < 300) {
        var data = jsonDecode(response.last);
        listDatas = List<ListDatas>.from(data.map((item) => ListDatas.fromJson(item)));
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
