import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool?> showAlertDialog({
  required BuildContext context,
  required String title,
  String? content,
  String? cancelActionText,
  String defaultActionText = 'Ok',
}) async {
  final textTheme = Theme.of(context).textTheme;
  if (kIsWeb || !Platform.isIOS) {
    return showDialog(
      context: context,
      barrierDismissible: cancelActionText != null,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: textTheme.titleLarge,
        ),
        content: content != null ? Text(content) : null,
        actions: <Widget>[
          if (cancelActionText != null)
            TextButton(
              child: Text(cancelActionText),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          TextButton(
            child: Text(defaultActionText),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
  }
  return showCupertinoDialog(
    context: context,
    barrierDismissible: cancelActionText != null,
    builder: (context) => CupertinoAlertDialog(
      title: Text(
        title,
        style: textTheme.titleLarge,
      ),
      content: content != null ? Text(content) : null,
      actions: <Widget>[
        if (cancelActionText != null)
          CupertinoDialogAction(
            child: Text(cancelActionText),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        CupertinoDialogAction(
          child: Text(defaultActionText),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    ),
  );
}

Future<void> showExceptionAlertDialog({
  required BuildContext context,
  required String title,
  required dynamic exception,
}) {
  String? errorMessage;
  if (exception is AuthException) {
    errorMessage = exception.message;
  }
  return showAlertDialog(
    context: context,
    title: title,
    content: errorMessage ?? exception.toString(),
  );
}
