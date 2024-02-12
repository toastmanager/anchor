import 'package:anchor/screens/welcome/sign_in_page.dart';
import 'package:anchor/screens/welcome/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unikit/unikit.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/images/welcome_illustration.svg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width - 32,
            ),
            const SizedBox(height: 20),
            Text(
              'Добьёмся успехов вместе',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "Прояви свои навыки вместе с нами!",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontSize: 14
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: UniButtonAccentMedium(
                  text: 'Войти',
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const SignInPage(),
                  )),
                )),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: UniElevatedButton(
                  text: 'Зарегистрироваться',
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  foregroundColor: Theme.of(context).colorScheme.onBackground,
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    width: 1.5,
                  ),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const SignUpPageStepOne(),
                  )),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}