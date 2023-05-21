import 'package:flutter/material.dart';

class AppSizes {
  const AppSizes._();

  static const large = 16.0;
  static const medium = 8.0;
  static const small = 4.0;
}

const gapHLarge = SizedBox(height: AppSizes.large);
const gapHMedium = SizedBox(height: AppSizes.medium);
const gapHSmall = SizedBox(height: AppSizes.small);

const gapWLarge = SizedBox(width: AppSizes.large);
const gapWMedium = SizedBox(width: AppSizes.medium);
const gapWSmall = SizedBox(width: AppSizes.small);
