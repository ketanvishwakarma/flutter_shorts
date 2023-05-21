import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShortMediaWidget extends StatelessWidget {
  const ShortMediaWidget({
    required this.url,
    this.width,
    this.height,
    super.key,
  });

  final String? url;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: width,
      height: height,
      color: colorScheme.primary.withOpacity(0.2),
      child: url == null
          ? const Icon(CupertinoIcons.photo)
          : CachedNetworkImage(
              imageUrl: url!,
              fit: BoxFit.cover,
              placeholder: (context, url) {
                return const Icon(CupertinoIcons.photo);
              },
            ),
    );
  }
}
