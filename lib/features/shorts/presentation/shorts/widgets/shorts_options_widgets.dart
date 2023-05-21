import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shorts/core/constants/app_sizes.dart';
import 'package:flutter_shorts/features/shorts/presentation/shorts/widgets/shorts_options_controller.dart';

class FlutterShortsBar extends ConsumerWidget {
  const FlutterShortsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final showOptions = ref.watch(shortsOptionControllerProvider);

    return AnimatedSlide(
      duration: const Duration(milliseconds: 150),
      offset: showOptions ? Offset.zero : const Offset(0, -0.8),
      curve: Curves.easeInOut,
      child: SafeArea(
        key: UniqueKey(),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.large,
          ),
          color: colorScheme.background.withOpacity(0.2),
          alignment: Alignment.center,
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'FlutterShorts',
                style: textTheme.titleLarge,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.person_fill,
                ),
              )
            ],
          ),
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

    final showOptions = ref.watch(shortsOptionControllerProvider);

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
          color: colorScheme.background.withOpacity(0.5),
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
