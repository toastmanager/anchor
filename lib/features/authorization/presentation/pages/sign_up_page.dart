import 'package:anchor/core/components/expanded_horizontal.dart';
import 'package:anchor/core/components/eye_toggle.dart';
import 'package:anchor/core/components/squircle_clipper.dart';
import 'package:anchor/core/routes/router.dart';
import 'package:anchor/core/routes/router.gr.dart';
import 'package:anchor/core/theme/app_theme.dart';
import 'package:anchor/injection.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isPasswordObscure = true;
  final router = sl<AppRouter>();
  final _formGlobalKey = GlobalKey<FormState>();
  String emailErrorMessage = '';
  String passwordErrorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sign up',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 10,
                ),
                Text('Enter your personal information',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppTheme.secondaryTextColor(context))),
                const SizedBox(
                  height: 20,
                ),
                _signUpForm(context),
                const SizedBox(
                  height: 20,
                ),
                ExpandedHorizontally(
                    child: FilledButton(
                        onPressed: () {},
                        style: AppTheme.bigButton,
                        child: const Text('Next'))),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => router.push(const SignInRoute()),
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: [
                              const TextSpan(text: 'Already have an account? '),
                              TextSpan(
                                  text: 'Sign in',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)),
                            ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Form _signUpForm(BuildContext context) {
    return Form(
      key: _formGlobalKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Email',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(
            height: 10,
          ),
          SquircleClipper(
            side: AppTheme.borderSide(context),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: AppTheme.inputDecoration(
                context,
                hintText: 'Enter your email',
              ),
            ),
          ),
          if (emailErrorMessage != '')
            Text(emailErrorMessage,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Theme.of(context).colorScheme.error)),
          const SizedBox(
            height: 10,
          ),
          Text('Password',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(
            height: 10,
          ),
          SquircleClipper(
            side: AppTheme.borderSide(context),
            child: TextFormField(
              obscureText: isPasswordObscure,
              decoration: AppTheme.inputDecoration(context,
                  hintText: 'Enter your password',
                  suffix: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: EyeToggleButton(
                      isOpen: isPasswordObscure,
                      onTap: () => setState(() {
                        isPasswordObscure = !isPasswordObscure;
                      }),
                    ),
                  )),
            ),
          ),
          if (passwordErrorMessage != '')
            Text(passwordErrorMessage,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Theme.of(context).colorScheme.error)),
        ],
      ),
    );
  }
}
