import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shorts/common_widgets/gradient_overlay_widget.dart';
import 'package:flutter_shorts/core/constants/app_sizes.dart';
import 'package:flutter_shorts/features/shorts/model/short/short.dart';
import 'package:flutter_shorts/features/shorts/presentation/shorts/widgets/short_media_widget.dart';
import 'package:flutter_shorts/features/shorts/presentation/shorts/widgets/show_short_option_controller.dart';

class ShortContentWidget extends ConsumerStatefulWidget {
  const ShortContentWidget({
    required this.short,
    super.key,
  });

  final Short short;

  @override
  ConsumerState<ShortContentWidget> createState() =>
      _ShortContentsWidgetState();
}

class _ShortContentsWidgetState extends ConsumerState<ShortContentWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return SizedBox.fromSize(
      size: size,
      child: Column(
        children: [
          _MediaWidget(url: widget.short.mediaUrl),
          Flexible(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                ref
                    .read(showShortOptionControllerProvider.notifier)
                    .toggleShowOptions();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.large,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gapHLarge,
                    Text(
                      widget.short.title,
                      style: textTheme.titleLarge,
                    ),
                    gapHMedium,
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        widget.short.description,
                        style: textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          gapHMedium,
        ],
      ),
    );
  }
}

class _MediaWidget extends StatelessWidget {
  const _MediaWidget({
    required this.url,
  });

  final String? url;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ShortMediaWidget(url: url),
          GradientOverlayWidget(
            colors: [
              colorScheme.background.withOpacity(0.8),
              Colors.transparent,
              colorScheme.background.withOpacity(0.8),
            ],
          ),
        ],
      ),
    );
  }
}
