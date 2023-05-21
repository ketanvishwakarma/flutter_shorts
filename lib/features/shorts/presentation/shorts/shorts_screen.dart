import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shorts/features/shorts/data/shorts_repository.dart';

class ShortsScreen extends ConsumerStatefulWidget {
  const ShortsScreen({super.key});

  @override
  ConsumerState<ShortsScreen> createState() => _ShortsScreenState();
}

class _ShortsScreenState extends ConsumerState<ShortsScreen> {
  @override
  Widget build(BuildContext context) {
    final shortsValue = ref.watch(shortsProvider);
    return shortsValue.when(
      data: (shorts) {
        return Scaffold(
          body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: shorts.length,
            itemBuilder: (context, index) {
              final short = shorts.elementAt(index);
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(short.title),
                    Text(short.description),
                    Text(short.mediaUrl),
                    Text(short.moreUrl),
                  ],
                ),
              );
            },
          ),
        );
      },
      error: (error, stackTrace) {
        return const Scaffold(
          body: SizedBox.shrink(),
        );
      },
      loading: () {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }
}
