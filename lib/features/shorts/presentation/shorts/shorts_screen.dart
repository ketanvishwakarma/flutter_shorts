import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shorts/common_widgets/status_bar_annotated_region_widget.dart';
import 'package:flutter_shorts/features/shorts/data/shorts_repository.dart';
import 'package:flutter_shorts/features/shorts/presentation/shorts/widgets/short_content_widget.dart';
import 'package:flutter_shorts/features/shorts/presentation/shorts/widgets/short_controller.dart';
import 'package:flutter_shorts/features/shorts/presentation/shorts/widgets/shorts_options_widgets.dart';

class ShortsScreen extends ConsumerStatefulWidget {
  const ShortsScreen({super.key});

  @override
  ConsumerState<ShortsScreen> createState() => _ShortsScreenState();
}

class _ShortsScreenState extends ConsumerState<ShortsScreen> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final shortsValue = ref.watch(shortsProvider);

    ref.listen(shortsProvider, (_, state) {
      state.whenOrNull(
        data: (data) {
          if (data.isNotEmpty && ref.read(shortControllerProvider) == null) {
            ref
                .read(shortControllerProvider.notifier)
                .changeCurrentShort(data.first);
          }
        },
      );
    });

    return StatusBarAnnotatedRegionWidget(
      allowTransparent: true,
      child: Scaffold(
        body: shortsValue.when(
          data: (shorts) {
            return Stack(
              children: [
                PageView.builder(
                  controller: pageController,
                  scrollDirection: Axis.vertical,
                  itemCount: shorts.length,
                  onPageChanged: (index) {
                    final short = shorts.elementAt(index);
                    ref
                        .read(shortControllerProvider.notifier)
                        .changeCurrentShort(short);
                  },
                  itemBuilder: (context, index) {
                    final short = shorts.elementAt(index);
                    return ShortContentWidget(short: short);
                  },
                ),
                const FlutterShortsBar(),
                const OptionsWidget(),
              ],
            );
          },
          error: (error, stackTrace) {
            return const SizedBox.shrink();
          },
          loading: () {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          },
        ),
      ),
    );
  }
}
