import 'package:anchor/components/strings.dart';
import 'package:anchor/components/user_avatar.dart';
import 'package:anchor/models/my_user_model.dart';
import 'package:anchor/screens/welcome/welcome_page.dart';
import 'package:anchor/utilities/user_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unikit/unikit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    required this.height,
    required this.user,
    required this.userService,
  });

  final double height;
  final MyUser? user;
  final UserService userService;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late final MyUser? user;
  late final UserService userService;

  @override
  void initState() {
    user = widget.user;
    userService = widget.userService;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var fullnameController = TextEditingController(
      text: user?.fullname,
    );
    var emailController = TextEditingController(
      text: user?.email,
    );
    var birthDateController = TextEditingController(
        text: DateFormat('yyyy.MM.dd')
            .format(user!.birthDate.toDate()));

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  child: SizedBox(
                    width: 100,
                    child: Text(
                      'Выйти',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(
                            color: Theme.of(context).colorScheme.error,
                          ),
                    ),
                  ),
                  onPressed: () async {
                    await userService.logOut();
                    if (mounted) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomePage(),
                          ));
                    }
                  },
                ),
                UserAvatar(
                  imageURL: user?.picture,
                  size: 74,
                ),
                TextButton(
                  child: const SizedBox(
                    width: 105,
                    child: Text(
                      'Редактировать',
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Column(
              children: [
                UniTextField(
                  controller: fullnameController,
                  labelText: 'ФИО',
                  readOnly: true,
                ),
                const SizedBox(height: 20),
                UniTextField(
                  controller: emailController,
                  labelText: 'Почта',
                  readOnly: true,
                ),
                const SizedBox(height: 20),
                UniTextField(
                  controller: birthDateController,
                  labelText: 'Дата рождения',
                  readOnly: true,
                  keyboardType: TextInputType.datetime,
                  inputFormatters: [dateInputMask],
                ),
              ],
            ),
            UniButtonAccentMedium(
              text: 'Удалить Аккаунт',
              onPressed: () async {
                userService.deleteAccount();
                if (mounted) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomePage(),
                      ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
