import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/permintaan/bindings/permintaan_binding.dart';
import '../modules/permintaan/bindings/permintaan_binding.dart';
import '../modules/permintaan/views/permintaan_view.dart';
import '../modules/permintaan/views/permintaan_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PERMINTAAN,
      page: () => const PermintaanView(),
      binding: PermintaanBinding(),
    ),
  ];
}
