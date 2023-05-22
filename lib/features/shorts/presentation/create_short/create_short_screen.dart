import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shorts/common_widgets/custom_button.dart';
import 'package:flutter_shorts/common_widgets/custom_dialogs.dart';
import 'package:flutter_shorts/core/constants/app_sizes.dart';
import 'package:flutter_shorts/features/shorts/presentation/create_short/create_short_controller.dart';
import 'package:flutter_shorts/utils/validators.dart';

class CreateShortScreen extends ConsumerStatefulWidget {
  const CreateShortScreen({super.key});

  @override
  ConsumerState<CreateShortScreen> createState() => _CreateShortScreenState();
}

class _CreateShortScreenState extends ConsumerState<CreateShortScreen> {
  final formKey = GlobalKey<FormState>();

  final _titleEC = TextEditingController();
  final _descriptionEC = TextEditingController();
  final _mediaEC = TextEditingController();
  final _moreEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    ref.listen(createShortControllerProvider, (_, state) {
      state.whenOrNull(
        error: (error, _) {
          showExceptionAlertDialog(
            context: context,
            title: 'Failed to create 😥',
            exception: error,
          );
        },
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Short'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.large),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                // ignore: lines_longer_than_80_chars
                'You can also add new shorts and it can be accessed by all the users.',
                style: textTheme.bodyMedium!.copyWith(
                  color: colorScheme.onBackground.withOpacity(0.5),
                ),
              ),
              TextFormField(
                controller: _titleEC,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                maxLength: 50,
                validator: requiredValidator.call,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _descriptionEC,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
                maxLength: 400,
                validator: requiredValidator.call,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _mediaEC,
                decoration: const InputDecoration(
                  labelText: 'Media URL',
                ),
                validator: requiredValidator.call,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _moreEC,
                decoration: const InputDecoration(
                  labelText: 'More/Reference URL ',
                ),
                validator: requiredValidator.call,
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(createShortControllerProvider);

                  return CustomButton(
                    text: 'Create 🚀',
                    isLoading: state.isLoading,
                    onPressed: onCreateTap,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onCreateTap() async {
    _titleEC.text = _titleEC.text.trim();
    _descriptionEC.text = _descriptionEC.text.trim();
    _mediaEC.text = _mediaEC.text.trim();
    _moreEC.text = _moreEC.text.trim();

    final formIsValid = formKey.currentState?.validate() ?? false;

    if (formIsValid) {
      final createShortController =
          ref.read(createShortControllerProvider.notifier);
      final success = await createShortController.create(
        title: _titleEC.text,
        description: _descriptionEC.text,
        mediaUrl: _mediaEC.text,
        moreUrl: _moreEC.text,
      );
      if (success && context.mounted) {
        await showAlertDialog(
          context: context,
          title: 'Successfully Created ✅',
          content:
              // ignore: lines_longer_than_80_chars
              'Thank you for the contribution, Once your short is approved then it will be visible in the feed.',
        );
      }
    }
  }
}
