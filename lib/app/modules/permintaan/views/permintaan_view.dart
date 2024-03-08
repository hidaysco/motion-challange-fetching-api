import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_challange/app/shared/widgets/input_label.dart';

import '../controllers/permintaan_controller.dart';

class PermintaanView extends GetView<PermintaanController> {
  const PermintaanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF3FAF3),
        appBar: AppBar(
          backgroundColor: const Color(0xFF62C172),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Get.back(),
          ),
          title: Text(
            'Kirim Permintaan',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelField('Foto Produk'),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width) / 4,
                    height: (MediaQuery.of(context).size.width) / 4,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    // decoration: BoxDecoration(color: Colors.white),
                    child: (controller.image == null)
                        ? IconButton(
                            icon: const Icon(Icons.camera_alt),
                            onPressed: () {
                              controller.chooseImage();
                            },
                          )
                        : Image.file((controller.image!)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  LabelField('Nama Produk'),
                  TextFormField(
                    cursorColor: const Color(0xFF62C172),
                    controller: controller.namaTextController.value,
                    decoration: const InputDecoration(
                        hoverColor: Color(0xFF62C172),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusColor: Color(0xFF62C172),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF62C172)))),
                  ),
                  LabelField('Deskripsi Produk'),
                  TextFormField(
                    cursorColor: const Color(0xFF62C172),
                    controller: controller.deskripsiTextController.value,
                    decoration: const InputDecoration(
                        hoverColor: Color(0xFF62C172),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusColor: Color(0xFF62C172),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF62C172)))),
                  ),
                  LabelField('Kategori'),
                  TextFormField(
                    cursorColor: const Color(0xFF62C172),
                    controller: controller.kategoriTextController.value,
                    decoration: const InputDecoration(
                        hoverColor: Color(0xFF62C172),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusColor: Color(0xFF62C172),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF62C172)))),
                  ),
                  LabelField('Harga'),
                  TextFormField(
                    cursorColor: const Color(0xFF62C172),
                    controller: controller.hargaTextController.value,
                    decoration: const InputDecoration(
                        hoverColor: Color(0xFF62C172),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusColor: Color(0xFF62C172),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF62C172)))),
                  ),
                  LabelField('Jumlah'),
                  TextFormField(
                    cursorColor: const Color(0xFF62C172),
                    controller: controller.jumlahTextController.value,
                    decoration: const InputDecoration(
                        hoverColor: Color(0xFF62C172),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusColor: Color(0xFF62C172),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF62C172)))),
                  ),
                  LabelField('Durasi Tahan'),
                  TextFormField(
                    cursorColor: const Color(0xFF62C172),
                    controller: controller.durasiTextController.value,
                    decoration: const InputDecoration(
                        hoverColor: Color(0xFF62C172),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusColor: Color(0xFF62C172),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF62C172)))),
                  ),
                  LabelField('Berat'),
                  RichText(
                      text: TextSpan(
                          text: 'Dalam',
                          style: GoogleFonts.poppins(color: Color(0xFF333333)),
                          children: <TextSpan>[
                        TextSpan(
                            text: ' gram',
                            style: GoogleFonts.poppins(
                                color: const Color(0xFF62C172))),
                        TextSpan(
                          text: ' (contoh: 500gr untuk 1 ikat)',
                          style: GoogleFonts.poppins(color: Colors.grey),
                        )
                      ])),
                  TextFormField(
                    cursorColor: const Color(0xFF62C172),
                    controller: controller.beratTextController.value,
                    decoration: const InputDecoration(
                        hoverColor: Color(0xFF62C172),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusColor: Color(0xFF62C172),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF62C172)))),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    color: const Color(0xFF62C172),
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: controller.onSubmit,
                        child: Text(
                          'Kirim',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
