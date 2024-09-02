import 'package:anchor/core/components/expanded_horizontal.dart';
import 'package:anchor/core/components/eye_toggle.dart';
import 'package:anchor/core/components/squircle_clipper.dart';
import 'package:anchor/core/routes/router.dart';
import 'package:anchor/core/routes/router.gr.dart';
import 'package:anchor/core/theme/app_theme.dart';
import 'package:anchor/features/authorization/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:anchor/injection.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sign up',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 10,
                ),
                Text('Enter your personal information',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.secondaryTextColor(context))),
                const SizedBox(
                  height: 20,
                ),
                _SignUpForm(formGlobalKey: formGlobalKey),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => router.push(const SignInRoute()),
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: [
                              const TextSpan(text: 'Already have an account? '),
                              TextSpan(
                                  text: 'Sign in',
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

class _SignUpForm extends StatefulWidget {
  const _SignUpForm({required this.formGlobalKey});

  final GlobalKey<FormState> formGlobalKey;

  @override
  State<_SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<_SignUpForm> {
  bool isPasswordObscure = true;
  String emailErrorMessage = '';
  String passwordErrorMessage = '';
  String fullNameErrorMessage = '';
  String birthDateErrorMessage = '';
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formGlobalKey = widget.formGlobalKey;
    return BlocProvider(
      create: (context) => sl<SignUpBloc>(),
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          final bloc = context.read<SignUpBloc>();
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
                        .read<SignUpBloc>()
                        .add(SignUpEmailUpdateEvent(email: email)),
                    decoration: AppTheme.inputDecoration(
                      context,
                      hintText: 'Enter your email',
                    ),
                  ),
                ),
                if (emailErrorMessage != '')
                  Text(emailErrorMessage,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.error)),
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
                    onChanged: (password) =>
                        bloc.add(SignUpPasswordUpdateEvent(password: password)),
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
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.error)),
                const SizedBox(
                  height: 10,
                ),
                Text('Full name',
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
                    onChanged: (fullName) =>
                        bloc.add(SignUpFullNameUpdateEvent(fullName: fullName)),
                    decoration: AppTheme.inputDecoration(
                      context,
                      hintText: 'Enter your full name',
                    ),
                  ),
                ),
                if (fullNameErrorMessage != '')
                  Text(fullNameErrorMessage,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.error)),
                const SizedBox(
                  height: 10,
                ),
                Text('Birth date',
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
                    mouseCursor: SystemMouseCursors.click,
                    controller: dateController,
                    readOnly: true,
                    keyboardType: TextInputType.emailAddress,
                    onTap: () async {
                      await selectBirthDate();
                      bloc.add(SignUpBirthDateUpdateEvent(
                          birthDate: DateTime.tryParse(dateController.text) ??
                              DateTime.now()));
                    },
                    decoration: AppTheme.inputDecoration(context,
                        hintText: 'Choose your birth date',
                        suffixIcon: const MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Icon(TablerIcons.calendar))),
                  ),
                ),
                if (birthDateErrorMessage != '')
                  Text(birthDateErrorMessage,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.error)),
                const SizedBox(
                  height: 20,
                ),
                ExpandedHorizontally(
                    child: FilledButton(
                        onPressed: () {
                          if (formGlobalKey.currentState!.validate()) {
                            bloc.add(SignUpExecuteEvent());
                          }
                        },
                        style: AppTheme.bigButton,
                        child: const Text('Sign up'))),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> selectBirthDate() async {
    final dateNow = DateTime.now();
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: dateNow,
        firstDate: DateTime(1900),
        lastDate: dateNow);
    if (date != null) {
      setState(() {
        dateController.text = date.toString().split(' ')[0];
      });
    }
  }
}
