import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shorts/features/auth/data/auth_repository.dart';
import 'package:flutter_shorts/features/auth/presentation/sign_in/sing_in_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://kqijxmfrodnexcsyxcbx.supabase.co',
    anonKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterShorts',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home: const AuthWrapper(),
    );
  }
}

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(authStateChangesProvider).maybeWhen(
      data: (data) {
        if (data != null) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Hello world'),
                  ElevatedButton(
                    onPressed: () async {
                      final authRepository = ref.read(authRepositoryProvider);
                      await authRepository.signOut();
                    },
                    child: const Text('SignOut'),
                  )
                ],
              ),
            ),
          );
        } else {
          return const SignInScreen();
        }
      },
      orElse: () {
        return const SignInScreen();
      },
    );
  }
}
