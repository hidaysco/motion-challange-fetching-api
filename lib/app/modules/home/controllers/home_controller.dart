import 'dart:convert';

import 'package:get/get.dart';
import 'package:motion_challange/app/data/model/request_vegetable_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final indexButtomBar = 0.obs;
  var requestList = <RequestVegetable>[].obs;
  var isLoading = true;

  void getRequest() async {
    const String url =
        'https://pasar.petani.telekardiologi.com/api/permintaan/';
    var response = await http.get(Uri.parse(url), headers: <String, String>{
      'Authorization':
          'Bearer 318|Ydb6BDnYRHIA4VNWN9InJkFxvGnYBVg4lEzpEteH2805b96d',
    });
    if (response.statusCode == 200) {
      final List res = jsonDecode(response.body)['data'];
      requestList.value = res.map((e) => RequestVegetable.formJson(e)).toList();
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getRequest();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onPressButtomBar(int val) => {indexButtomBar.value = val, update()};

  void onSubmit() {}
}
