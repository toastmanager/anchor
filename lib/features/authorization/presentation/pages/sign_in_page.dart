import 'package:anchor/core/components/expanded_horizontal.dart';
import 'package:anchor/core/components/eye_toggle.dart';
import 'package:anchor/core/components/squircle_clipper.dart';
import 'package:anchor/core/theme/app_theme.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sign in',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 10,
            ),
            Text('Enter your account details',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppTheme.secondaryTextColor(context)
            )),
            const SizedBox(
              height: 20,
            ),
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
              child: TextField(
                decoration: AppTheme.inputDecoration(
                  context,
                  hintText: 'Enter your email',
                ),
              ),
            ),
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
              child: TextField(
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
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Forgot your password?'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ExpandedHorizontally(
                child: FilledButton(
                    onPressed: () {},
                    style: AppTheme.bigButton,
                    child: const Text('Sign in'))),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          const TextSpan(text: 'Don\'t have an account? '),
                          TextSpan(
                              text: 'Sign up',
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
    );
  }
}
