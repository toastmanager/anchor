import 'package:anchor/core/components/expanded_horizontal.dart';
import 'package:anchor/core/components/eye_toggle.dart';
import 'package:anchor/core/components/squircle_clipper.dart';
import 'package:anchor/core/routes/router.dart';
import 'package:anchor/core/routes/router.gr.dart';
import 'package:anchor/core/theme/app_theme.dart';
import 'package:anchor/features/authorization/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:anchor/injection.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  final Function(bool?) onResult;

  const SignInPage({super.key, required this.onResult});

  @override
  Widget build(BuildContext context) {
    final router = sl<AppRouter>();
    final formGlobalKey = GlobalKey<FormState>();
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
                        color: AppTheme.secondaryTextColor(context))),
                const SizedBox(
                  height: 20,
                ),
                _SignInForm(formGlobalKey, onResult),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => router.push(SignUpRoute(
                        onResult: onResult
                      )),
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
        ),
      ),
    );
  }
}

class _SignInForm extends StatefulWidget {
  const _SignInForm(this.formGlobalKey, this.onResult);

  final Function(bool?) onResult;
  final GlobalKey<FormState> formGlobalKey;

  @override
  State<_SignInForm> createState() => __SignInFormState();
}

class __SignInFormState extends State<_SignInForm> {
  bool isPasswordObscure = true;
  String emailErrorMessage = '';
  String passwordErrorMessage = '';

  @override
  Widget build(BuildContext context) {
    final formGlobalKey = widget.formGlobalKey;
    return BlocProvider(
      create: (context) => sl<SignInBloc>(),
      child: BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
        if (state is SignInSuccess) {
          widget.onResult.call(true);
        }
        if (state is SignInFailed) {
          widget.onResult.call(false);
        }
        return Form(
          key: formGlobalKey,
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
                  onChanged: (email) => context
                      .read<SignInBloc>()
                      .add(SignInEmailUpdateEvent(email: email)),
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
                  onChanged: (password) => context
                      .read<SignInBloc>()
                      .add(SignInPasswordUpdateEvent(password: password)),
                  decoration: AppTheme.inputDecoration(context,
                      hintText: 'Enter your password',
                      suffixIcon: Padding(
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
                      onPressed: () {
                        if (formGlobalKey.currentState!.validate()) {
                          context.read<SignInBloc>().add(SignInExecuteEvent());
                        }
                      },
                      style: AppTheme.bigButton,
                      child: const Text('Sign in'))),
            ],
          ),
        );
      }),
    );
  }
}
