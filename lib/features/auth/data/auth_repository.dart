import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart'
    show GoTrueClient, Supabase, User;

part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository(this._auth);

  final GoTrueClient _auth;

  Future<void> signInWithEmailMagicLink(String email) {
    return _auth.signInWithOtp(
      email: email,
      emailRedirectTo: 'io.supabase.fluttershorts://login-callback/',
    );
  }

  Future<void> signOut() {
    return _auth.signOut();
  }

  Stream<User?> authStateChanges() {
    return _auth.onAuthStateChange.map((authState) {
      return authState.session?.user;
    });
  }

  User? get currentUser => _auth.currentUser;
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(Supabase.instance.client.auth);
}

@Riverpod(keepAlive: true)
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  return ref.read(authRepositoryProvider).authStateChanges();
}

@Riverpod(keepAlive: true)
User? appUser(AppUserRef ref) {
  return ref.watch(authRepositoryProvider).currentUser;
}
