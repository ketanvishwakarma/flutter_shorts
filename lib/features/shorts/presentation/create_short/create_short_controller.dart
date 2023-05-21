import 'package:flutter_shorts/features/auth/data/auth_repository.dart';
import 'package:flutter_shorts/features/shorts/data/shorts_repository.dart';
import 'package:flutter_shorts/features/shorts/model/create_short/create_short.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_short_controller.g.dart';

@riverpod
class CreateShortController extends _$CreateShortController {
  @override
  FutureOr<void> build() {}

  Future<bool> create({
    required String title,
    required String description,
    required String mediaUrl,
    required String moreUrl,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _createShort(
        title: title,
        description: description,
        mediaUrl: mediaUrl,
        moreUrl: moreUrl,
      ),
    );
    return state.hasError == false;
  }

  Future<void> _createShort({
    required String title,
    required String description,
    required String mediaUrl,
    required String moreUrl,
  }) {
    final shortsRepository = ref.read(shortsRepositoryProvider);
    final user = ref.read(authRepositoryProvider).currentUser;
    final createShort = CreateShort(
      mediaUrl: mediaUrl,
      title: title,
      description: description,
      moreUrl: moreUrl,
      creatorId: user!.id,
    );
    return shortsRepository.createShort(createShort);
  }
}
