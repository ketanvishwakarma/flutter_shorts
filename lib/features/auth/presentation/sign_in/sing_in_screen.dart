import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shorts/features/auth/presentation/sign_in/sign_in_controller.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _emailEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen(signInControllerProvider, (_, state) {
      // Show error and progress
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailEC,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                final signInController =
                    ref.read(signInControllerProvider.notifier);
                final success = await signInController.sendMagicLink(
                  email: _emailEC.text.trim(),
                );
                if (success) {
                  log('Email sent');
                }
              },
              child: const Text('Send magic link'),
            )
          ],
        ),
      ),
    );
  }
}
