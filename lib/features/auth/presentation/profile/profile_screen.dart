import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shorts/common_widgets/custom_dialogs.dart';
import 'package:flutter_shorts/features/auth/data/auth_repository.dart';
import 'package:flutter_shorts/features/auth/presentation/profile/profile_controller.dart';
import 'package:flutter_shorts/features/shorts/presentation/create_short/create_short_screen.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          const _UserEmailWidget(),
          const Divider(
            height: 0,
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.add_circled),
            title: const Text('Create Short'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const CreateShortScreen(),
                ),
              );
            },
          ),
          const Divider(
            height: 0,
          ),
          const _SignOutWidget(),
        ],
      ),
    );
  }
}

class _UserEmailWidget extends ConsumerWidget {
  const _UserEmailWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(appUserProvider);
    if (user != null) {
      return ListTile(
        leading: const Icon(CupertinoIcons.person_circle),
        title: Text(user.email!),
      );
    }
    return const SizedBox.shrink();
  }
}

class _SignOutWidget extends ConsumerWidget {
  const _SignOutWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      profileControllerProvider,
      (_, state) {
        state.whenOrNull(
          error: (error, _) {
            showExceptionAlertDialog(
              context: context,
              title: 'Sign out failed 😥',
              exception: error,
            );
          },
        );
      },
    );
    final state = ref.watch(profileControllerProvider);
    return ListTile(
      leading: const Icon(CupertinoIcons.square_arrow_left),
      onTap: () async {
        final logout = await showAlertDialog(
          context: context,
          title: 'Are you sure?',
          defaultActionText: 'Yes',
          cancelActionText: 'No',
        );
        if (logout ?? false) {
          final profileController =
              ref.read(profileControllerProvider.notifier);
          final success = await profileController.signOut();
          if (success && context.mounted) {
            Navigator.of(context).pop();
          }
        }
      },
      title: const Text('Sign out'),
      trailing: state.isLoading
          ? const SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator.adaptive(),
            )
          : null,
    );
  }
}
