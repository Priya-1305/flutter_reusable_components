import 'package:get/get.dart';

class BaseController extends GetxController {
  final isLoading = false.obs;
  final error = RxnString();

  void wrapLoading(Future<void> Function() block) async {
    try {
      isLoading.value = true;
      error.value = null;
      await block();
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
