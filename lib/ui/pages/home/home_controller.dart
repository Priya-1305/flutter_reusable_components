import 'package:get/get.dart';
import '../../../core/base_controller.dart';
import '../../../core/utils/debounce_mixin.dart';

class HomeController extends BaseController with DebounceMixin {
  final counter = 0.obs;
  final query = ''.obs;

  void inc() => counter.value++;
  void onSearchChanged(String v) {
    runDebounced(() => query.value = v);
  }

  @override
  void onClose() {
    disposeDebounce();
    super.onClose();
  }
}
