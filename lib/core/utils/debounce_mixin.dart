import 'dart:async';

mixin DebounceMixin {
  Timer? _debounce;
  void runDebounced(
    void Function() action, {
    Duration duration = const Duration(milliseconds: 350),
  }) {
    _debounce?.cancel();
    _debounce = Timer(duration, action);
  }

  void disposeDebounce() => _debounce?.cancel();
}
