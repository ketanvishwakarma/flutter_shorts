import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shorts_options_controller.g.dart';

@riverpod
class ShortsOptionController extends _$ShortsOptionController {
  @override
  bool build() {
    return true;
  }

  void toggleShowOptions() {
    state = !state;
  }
}
