import 'package:flutter/material.dart';
import 'package:flutter_shorts/core/constants/app_sizes.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    super.key,
    this.isLoading = false,
    this.onPressed,
  });
  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(40, 40),
        padding: const EdgeInsets.all(AppSizes.medium),
      ),
      child: isLoading
          ? const SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator.adaptive(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.large,
              ),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: textTheme.titleMedium!.copyWith(
                  color: colorScheme.primary,
                ),
              ),
            ),
    );
  }
}
