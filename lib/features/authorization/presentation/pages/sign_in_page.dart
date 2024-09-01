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
            Text('Enter your account details'),
            Text('Email'),
            SquircleClipper(
              side: AppTheme.borderSide(context),
              child: TextField(
                decoration: AppTheme.inputDecoration(
                  context,
                  hintText: 'Enter your email',
                ),
              ),
            ),
            Text('Password'),
          ],
        ),
      ),
    );
  }
}
