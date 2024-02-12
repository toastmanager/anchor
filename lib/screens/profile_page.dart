import 'package:anchor/components/strings.dart';
import 'package:anchor/models/my_user_model.dart';
import 'package:anchor/screens/welcome_page/welcome_page.dart';
import 'package:anchor/utilities/user_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unikit/unikit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late final TabController tabController;
  final int tabsAmount = 1;
  final UserService userService = UserService();
  late final Future<MyUser?> user;

  @override
  void initState() {
    user = userService.getCurrentUser();
    tabController = TabController(length: tabsAmount, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final List<Widget> tabsList = <Widget>[
      FutureBuilder(
        future: user,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator()
                ),
              );
            }
            return const Center(
              child: Text(
                'no user data'
              ),
            );
          }
          MyUser? user = snapshot.data;
          var fullnameController = TextEditingController(
            text: user?.fullname, 
          );
          var emailController = TextEditingController(
            text: user?.email,
          );
          var birthDateController = TextEditingController(
            text: DateFormat('yyyy.MM.dd').format(user!.birthDate.toDate())
          );

          ImageProvider<Object> userImage = user.picture != null
                ? CachedNetworkImageProvider(user.picture!)
                : const AssetImage('assets/images/default_avatar.png') as ImageProvider<Object>;

          return Column(
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
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      await userService.logOut();
                      if (mounted) {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => const WelcomePage(),
                        ));
                      }
                    },
                  ),
                  ClipOval(
                    child: Image(
                      image: userImage,
                      height: 74,
                      width: 74,
                      fit: BoxFit.cover,
                    ),
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
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => const WelcomePage(),
                    ));
                  }
                },
              ),
            ],
          );
        }
      ),
    ];

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            child: TabBarView(
              controller: tabController,
              children: tabsList,
            ),
          ),
        ),
      ),
    );
  }
}