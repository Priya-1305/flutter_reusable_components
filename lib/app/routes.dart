import 'package:get/get.dart';
import '../ui/pages/home/home_page.dart';

class AppRoutes {
  static const home = '/';
  static final pages = [GetPage(name: home, page: () => const HomePage())];
}
