import 'package:anchor/core/components/expanded_horizontal.dart';
import 'package:anchor/core/routes/router.dart';
import 'package:anchor/core/routes/router.gr.dart';
import 'package:anchor/core/theme/app_theme.dart';
import 'package:anchor/injection.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class AuthChoosePage extends StatelessWidget {
  const AuthChoosePage({super.key});

  @override
  Widget build(BuildContext context) {
    final router = sl<AppRouter>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child:
                    SvgPicture.asset('assets/images/welcome_illustration.svg')),
            const SizedBox(height: 65),
            Text(
              'Let\'s achieve success together',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              'Show your skills with us!',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.secondaryTextColor(context)),
            ),
            const SizedBox(height: 20),
            ExpandedHorizontally(
                child: FilledButton(
              onPressed: () => router.push(const SignInRoute()),
              style: AppTheme.bigButton,
              child: const Text('Sign in'),
            )),
            const SizedBox(height: 20),
            ExpandedHorizontally(
                child: OutlinedButton(
              onPressed: () => router.push(const SignUpRoute()),
              style: AppTheme.bigButton,
              child: const Text('Sign up'),
            )),
          ],
        ),
      ),
    );
  }
}
