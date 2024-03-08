import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:motion_challange/app/modules/home/controllers/home_controller.dart';
import 'package:motion_challange/app/modules/home/views/home_view.dart';

class PermintaanController extends GetxController {
  //TODO: Implement PermintaanController
  final namaTextController = TextEditingController().obs;
  final deskripsiTextController = TextEditingController().obs;
  final kategoriTextController = TextEditingController().obs;
  final hargaTextController = TextEditingController().obs;
  final jumlahTextController = TextEditingController().obs;
  final durasiTextController = TextEditingController().obs;
  final beratTextController = TextEditingController().obs;

  File? image;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void chooseImage() async {
    try {
      final file = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (file == null) return;
      final imagePath = File(file.path);
      image = imagePath;
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void onSubmit() async {
    const String url =
        'https://pasar.petani.telekardiologi.com/api/permintaan/add';
    Map<String, String> reqHeaders = {
      'Authorization':
          'Bearer 318|Ydb6BDnYRHIA4VNWN9InJkFxvGnYBVg4lEzpEteH2805b96d',
      'Accept': 'application/json',
    };
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(reqHeaders);
    request.fields.addAll({
      'id_petani': '37',
      'id_koperasi': '19',
      'kategori': kategoriTextController.value.text,
      'harga': hargaTextController.value.text,
      'berat': beratTextController.value.text,
      'durasi_tahan': durasiTextController.value.text,
      'jumlah': jumlahTextController.value.text,
      'name': namaTextController.value.text,
      'description': deskripsiTextController.value.text
    });
    request.files.add(await http.MultipartFile.fromPath('foto', image!.path));
    final response = await http.Response.fromStream(await request.send());

    if (response.statusCode == 201) {
      Get.snackbar(
          'Permintaan Ditambahkan', jsonDecode(response.body)['message']);
      await Future.delayed(const Duration(milliseconds: 500));
      final ctrlHome = Get.find<HomeController>();
      ctrlHome.getRequest();
      Get.delete<PermintaanController>();
      Get.to(() => const HomeView());
    } else {
      Get.snackbar('Permintaan Gagal', jsonDecode(response.body)['message']);
    }
  }
}
