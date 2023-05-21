import 'package:flutter_shorts/features/auth/data/auth_repository.dart';
import 'package:flutter_shorts/features/shorts/application/shorts_service.dart';
import 'package:flutter_shorts/features/shorts/data/shorts_repository.dart';
import 'package:flutter_shorts/features/shorts/model/short/short.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'short_controller.g.dart';

extension ShortX on Short {
  bool isLikedByUser(String userId) {
    return likes.contains(userId);
  }
}

@riverpod
class ShortController extends _$ShortController {
  @override
  Short? build() {
    return null;
  }

  void changeCurrentShort(Short? short) {
    state = short;
  }
}

@riverpod
class ToggleLike extends _$ToggleLike {
  @override
  FutureOr<Short?> build() {
    return null;
  }

  Future<void> toggleLike(Short short) async {
    state = const AsyncLoading();
    final user = ref.read(appUserProvider);
    final shortService = ref.watch(shortServiceProvider);

    if (short.isLikedByUser(user!.id)) {
      state = await AsyncValue.guard(() => shortService.removeLike(short.id));
    } else {
      state = await AsyncValue.guard(() => shortService.like(short.id));
    }
    if (state.hasError == false && state.value != null) {
      ref.read(shortsProvider.notifier).updateShort(state.value!);
    }
  }
}
