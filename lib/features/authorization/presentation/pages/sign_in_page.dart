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
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sign in'),
            const SizedBox(
              height: 10,
            ),
            Text('Enter your account details'),
            const SizedBox(
              height: 20,
            ),
            Text('Email'),
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
            Text('Password'),
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
                    child: const Text('Sign in')))
          ],
        ),
      ),
    );
  }
}
