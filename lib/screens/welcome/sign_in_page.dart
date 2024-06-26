import 'dart:developer';

import 'package:anchor/app.dart';
import 'package:anchor/components/simple_alert.dart';
import 'package:anchor/utilities/user_service.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:unikit/unikit.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool isObscure = true;

  void changeObscure() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  void _signIn() async {
    try {
      await UserService().signIn(
        emailController.text.trim(),
        passwordController.text.trim()
      ).catchError((e) => throw e);
      if (mounted) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const MainApp(),
        ));
      }
    } catch (e) {
      log(e.toString());
      if (mounted) {
        simpleTextAlert(e.toString(), context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    IconData passwordIcon = IconlyBold.show;
    if (isObscure == false) {
      passwordIcon = IconlyBold.hide;
    }

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Вход',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'Введите данные вашего аккаунта',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Почта',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              UniTextField(
                controller: emailController,
                hintText: 'Введите свою почту',
              ),
              const SizedBox(height: 10),
              Text(
                'Пароль',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              UniTextField(
                controller: passwordController,
                hintText: 'Введите пароль',
                obscureText: isObscure,
                suffixIcon: IconButton(
                  onPressed: () => changeObscure(),
                  icon: Icon(passwordIcon)
                ),
              ),
              TextButton(onPressed: () {}, child: const Text('Забыли пароль?',)),
              Row(
                children: [
                  Expanded(child: UniButtonAccentMedium(
                    text: 'Войти',
                    onPressed: () => _signIn(),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}