import 'package:anchor/core/theme/app_theme.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smooth_corner/smooth_corner.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 40,
          icon: const Icon(TablerIcons.arrow_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sign in'),
            Text('Enter your account details'),
            Text('Email'),
            // TODO: Move to component
            SmoothContainer(
              smoothness: 1,
              side: AppTheme.borderSide(context),
              borderRadius: BorderRadius.circular(12),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none
                  ),
                  hintText: 'Enter your email',
                  hintStyle: AppTheme.hintStyle(context),
                  suffix: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(12),
                      child: const Icon(TablerIcons.eye)),
                  )
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
