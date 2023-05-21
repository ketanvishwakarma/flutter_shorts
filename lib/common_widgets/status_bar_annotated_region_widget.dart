import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarAnnotatedRegionWidget extends StatelessWidget {
  const StatusBarAnnotatedRegionWidget({
    required this.child,
    this.allowTransparent = false,
    super.key,
  });

  final Widget child;
  final bool allowTransparent;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: allowTransparent
            ? Colors.transparent
            : colorScheme.background.withOpacity(0.5),
      ),
      child: child,
    );
  }
}
