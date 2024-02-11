import 'dart:developer';

import 'package:anchor/app.dart';
import 'package:anchor/components/simple_alert.dart';
import 'package:anchor/utilities/user_service.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:unikit/unikit.dart';

class SignUpPageStepOne extends StatefulWidget {
  const SignUpPageStepOne({super.key});

  @override
  State<SignUpPageStepOne> createState() => _SignUpPageStepOneState();
}

class _SignUpPageStepOneState extends State<SignUpPageStepOne> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fullnameController = TextEditingController();

  bool isObscure = true;

  void changeObscure() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  void _signUp() async {
    try {
      await UserService().signUp(
        emailController.text.trim(),
        passwordController.text.trim(),
        fullnameController.text.trim(),
      ).catchError((e) => throw e);
      if (mounted) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const MainApp(),
        ));
      }
    } catch (e) {
      log(e.toString());
      if (mounted) {
        simpleAlert(e.toString(), context);
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
              const Text('Регистрация'),
              const SizedBox(height: 10),
              const Text('Введите свою личную информацию'),
              const SizedBox(height: 20),
              const Text('Почта'),
              const SizedBox(height: 10),
              UniTextField(
                controller: emailController,
                hintText: 'Введите свою почту',
              ),
              const Text('ФИО'),
              const SizedBox(height: 10),
              UniTextField(
                controller: fullnameController,
                hintText: 'Введите ваше ФИО',
              ),
              const Text('Пароль'),
              const SizedBox(height: 10),
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
                    text: 'Зарегистрироваться',
                    onPressed: () => _signUp(),
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}