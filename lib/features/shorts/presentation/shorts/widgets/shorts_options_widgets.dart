import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shorts/core/constants/app_sizes.dart';
import 'package:flutter_shorts/features/auth/presentation/profile/profile_screen.dart';
import 'package:flutter_shorts/features/shorts/presentation/shorts/widgets/show_short_option_controller.dart';

class FlutterShortsBar extends ConsumerWidget {
  const FlutterShortsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final showOptions = ref.watch(showShortOptionControllerProvider);

    return AnimatedSlide(
      duration: const Duration(milliseconds: 150),
      offset: showOptions ? Offset.zero : const Offset(0, -1),
      curve: Curves.easeInOut,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.large,
        ),
        color: colorScheme.background.withOpacity(0.8),
        alignment: Alignment.center,
        height: kToolbarHeight + textTheme.titleLarge!.fontSize!.ceil(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'FlutterShorts',
              style: textTheme.titleLarge,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              icon: const Icon(
                CupertinoIcons.person_fill,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OptionsWidget extends ConsumerWidget {
  const OptionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final showOptions = ref.watch(showShortOptionControllerProvider);

    return AnimatedSlide(
      duration: const Duration(milliseconds: 150),
      offset: showOptions ? Offset.zero : const Offset(0, 0.1),
      curve: Curves.easeInOut,
      child: Align(
        key: UniqueKey(),
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.large,
          ),
          color: colorScheme.background.withOpacity(0.8),
          alignment: Alignment.center,
          height: kBottomNavigationBarHeight,
          child: Row(
            children: [
              ActionChip(
                avatar: const Icon(CupertinoIcons.hand_thumbsup_fill),
                label: const Text('Like'),
                onPressed: () {},
              ),
              gapWLarge,
              ActionChip(
                avatar: const Icon(CupertinoIcons.doc_plaintext),
                label: const Text('More'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
