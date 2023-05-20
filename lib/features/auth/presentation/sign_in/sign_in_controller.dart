import 'package:flutter_shorts/features/auth/data/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  @override
  FutureOr<void> build() {}

  Future<bool> sendMagicLink({
    required String email,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _signInWithEmailMagicLink(email),
    );
    return state.hasError == false;
  }

  Future<void> _signInWithEmailMagicLink(String email) {
    final authRepository = ref.read(authRepositoryProvider);
    return authRepository.signInWithEmailMagicLink(email);
  }
}
