import 'package:anchor/screens/welcome_page/sign_in_page.dart';
import 'package:anchor/screens/welcome_page/sign_up_page.dart';
import 'package:flutter/material.dart';
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
          children: [
            Row(
              children: [
                Expanded(child: UniButtonAccentMedium(
                  text: 'Войти',
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                    builder: (context) => SignInPage(),
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
                    builder: (context) => SignUpPageStepOne(),
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