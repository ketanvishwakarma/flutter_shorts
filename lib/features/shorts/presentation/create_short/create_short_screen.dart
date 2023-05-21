import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shorts/features/shorts/presentation/create_short/create_short_controller.dart';

class CreateShortScreen extends ConsumerStatefulWidget {
  const CreateShortScreen({super.key});

  @override
  ConsumerState<CreateShortScreen> createState() => _CreateShortScreenState();
}

class _CreateShortScreenState extends ConsumerState<CreateShortScreen> {
  final _titleEC = TextEditingController();
  final _descriptionEC = TextEditingController();
  final _mediaEC = TextEditingController();
  final _moreEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen(createShortControllerProvider, (_, state) {
      // Show error and progress
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: _titleEC,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _descriptionEC,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _mediaEC,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _moreEC,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                final createShortController =
                    ref.read(createShortControllerProvider.notifier);
                final success = await createShortController.create(
                  title: _titleEC.text,
                  description: _descriptionEC.text,
                  mediaUrl: _mediaEC.text,
                  moreUrl: _moreEC.text,
                );
                if (success) {
                  log('Added');
                }
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
