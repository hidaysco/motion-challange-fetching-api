import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_challange/app/modules/home/widgets/card_widget.dart';
import 'package:motion_challange/app/modules/permintaan/bindings/permintaan_binding.dart';
import 'package:motion_challange/app/modules/permintaan/views/permintaan_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF3FAF3),
      body: SafeArea(child: ProdukView(controller: controller)),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
              currentIndex: controller.indexButtomBar.value,
              selectedItemColor: const Color(0xFF17C118),
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              unselectedItemColor: Colors.grey,
              onTap: controller.onPressButtomBar,
              items: const [
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/home-2.png'),
                    size: 40,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/harvest.png'),
                    size: 40,
                  ),
                  label: 'Produk',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/transaction-minus.png'),
                    size: 40,
                  ),
                  label: 'Riwayat',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/profile-circle.png'),
                    size: 40,
                  ),
                  label: 'Profil',
                ),
              ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const PermintaanView(), binding: PermintaanBinding());
        },
        backgroundColor: const Color(0xFF62C172),
        shape: const CircleBorder(eccentricity: 1),
        child: const Icon(
          Icons.add_rounded,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ProdukView extends StatelessWidget {
  const ProdukView({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: Color(0xFF62C172)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 34,
                ),
                Text(
                  'List Produk',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 18,
                ),
                SizedBox(
                  height: 40,
                  child: TextField(
                    style: GoogleFonts.poppins(fontSize: 16),
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 5),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Cari Produk',
                        hintStyle: GoogleFonts.poppins(),
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none)),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(() => GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 220,
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                itemCount: controller.requestList.length,
                itemBuilder: (_, int idx) {
                  return CardWidget(controller.requestList[idx]);
                })),
          ),
        ),
      ],
    );
  }
}
