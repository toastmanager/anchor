import 'package:anchor/components/strings.dart';
import 'package:anchor/components/user_avatar.dart';
import 'package:anchor/models/my_user_model.dart';
import 'package:anchor/screens/welcome/welcome_page.dart';
import 'package:anchor/utilities/user_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unikit/unikit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    required this.height,
    required this.user,
    required this.userService,
    this.onUserChange,
  });

  final double height;
  final MyUser? user;
  final UserService userService;
  final Function? onUserChange;

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

  bool isEditMode = false;

  void switchEditMode() {
    setState(() {
      isEditMode = !isEditMode;
    });
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
    
    String rightSideText = 'Редактировать';
    String leftSideText = 'Выйти';
    if (isEditMode) {
      leftSideText = 'Отмена';
      rightSideText = 'Готово';
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      child: SizedBox(
                        width: 100,
                        child: Text(
                          leftSideText,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.error,
                              ),
                        ),
                      ),
                      onPressed: () async {
                        if (isEditMode) {
                          switchEditMode();
                        } else {
                          await userService.logOut();
                          if (mounted) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const WelcomePage(),
                                ));
                          }
                        }
                      },
                    ),
                    UserAvatar(
                      imageURL: user?.picture,
                      size: 74,
                    ),
                    TextButton(
                      child: SizedBox(
                        width: 105,
                        child: Text(
                          rightSideText,
                          textAlign: TextAlign.end,
                        ),
                      ),
                      onPressed: () async {
                        if (isEditMode) {
                          await userService.updateUserInfo(
                            picture: user?.picture,
                            birthDate: Timestamp.fromDate(DateFormat('yyyy.MM.dd').parse(birthDateController.text.trim())),
                            email: emailController.text.trim(),
                            fullname: fullnameController.text.trim(),
                          );
                          if (widget.onUserChange != null) {
                            widget.onUserChange!();
                          }
                        }
                        switchEditMode();
                      },
                    ),
                  ],
                ),
                if (isEditMode)
                  TextButton(
                    onPressed: () {},
                    child: const Text('Загрузить аватрку')
                  ),
              ],
            ),
            Column(
              children: [
                UniTextField(
                  controller: fullnameController,
                  labelText: 'ФИО',
                  readOnly: !isEditMode,
                ),
                const SizedBox(height: 20),
                UniTextField(
                  controller: emailController,
                  labelText: 'Почта',
                  readOnly: !isEditMode,
                ),
                const SizedBox(height: 20),
                UniTextField(
                  controller: birthDateController,
                  labelText: 'Дата рождения',
                  readOnly: !isEditMode,
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
