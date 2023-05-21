import 'package:flutter/widgets.dart';
import 'package:flutter_shorts/common_widgets/custom_dialogs.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchWebsite(
  BuildContext context,
  String url,
) async {
  try {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } on Exception {
    await showExceptionAlertDialog(
      context: context,
      title: 'Failed 😥',
      exception: 'Can not open URL',
    );
  }
}
