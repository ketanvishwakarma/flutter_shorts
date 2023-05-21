import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'show_short_option_controller.g.dart';

@riverpod
class ShowShortOptionController extends _$ShowShortOptionController {
  @override
  bool build() {
    return true;
  }

  void toggleShowOptions() {
    state = !state;
  }
}
