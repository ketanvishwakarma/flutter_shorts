import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shorts/common_widgets/custom_button.dart';
import 'package:flutter_shorts/common_widgets/custom_dialogs.dart';
import 'package:flutter_shorts/common_widgets/status_bar_annotated_region_widget.dart';
import 'package:flutter_shorts/core/constants/app_sizes.dart';
import 'package:flutter_shorts/features/auth/presentation/sign_in/sign_in_controller.dart';
import 'package:flutter_shorts/utils/validators.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final formKey = GlobalKey<FormState>();

  final _emailEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    ref.listen(
      signInControllerProvider,
      (_, state) {
        state.whenOrNull(
          error: (error, _) {
            showExceptionAlertDialog(
              context: context,
              title: 'Failed to send magic link 😥',
              exception: error,
            );
          },
        );
      },
    );

    return StatusBarAnnotatedRegionWidget(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.large),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.15,
                ),
                Text(
                  'FlutterShorts',
                  style: textTheme.titleLarge,
                ),
                Text(
                  "Let's explore flutter in shorts! 😉",
                  style: textTheme.bodyLarge,
                ),
                gapHLarge,
                Card(
                  margin: EdgeInsets.zero,
                  color: colorScheme.onBackground.withOpacity(0.05),
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.large),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Please enter your email to continue 🤩',
                            style: textTheme.titleMedium,
                          ),
                        ),
                        TextFormField(
                          controller: _emailEC,
                          autofocus: true,
                          decoration: const InputDecoration(
                            hintText: 'user123@domain.com',
                            labelText: 'Email',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: MultiValidator([
                            requiredValidator,
                            emailValidator,
                          ]).call,
                          onFieldSubmitted: (_) {
                            onSendMagicLinkTap();
                          },
                        ),
                        gapHLarge,
                        Text(
                          // ignore: lines_longer_than_80_chars
                          "Using magic link, You don't need to remember password. You can just click on the magic link which we will send to your email",
                          style: textTheme.bodySmall!.copyWith(
                            color: colorScheme.onBackground.withOpacity(0.5),
                          ),
                        ),
                        gapHMedium,
                        Consumer(
                          builder: (context, ref, child) {
                            final state = ref.watch(signInControllerProvider);
                            return CustomButton(
                              text: 'Send magic link 😎',
                              isLoading: state.isLoading,
                              onPressed: onSendMagicLinkTap,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onSendMagicLinkTap() async {
    _emailEC.text = _emailEC.text.trim();

    final formIsValid = formKey.currentState?.validate() ?? false;

    if (formIsValid) {
      final signInController = ref.read(signInControllerProvider.notifier);
      final success = await signInController.sendMagicLink(
        email: _emailEC.text.trim(),
      );
      if (success && context.mounted) {
        await showAlertDialog(
          context: context,
          title: 'Magic link sent ✅',
          content: 'We just sent you magic link, Please check out your inbox.',
        );
      }
    }
  }
}
