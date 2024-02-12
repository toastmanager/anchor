import 'package:anchor/components/strings.dart';
import 'package:anchor/components/user_avatar.dart';
import 'package:anchor/models/my_user_model.dart';
import 'package:anchor/utilities/user_service.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:unikit/unikit.dart';

class LeadersPage extends StatefulWidget {
  const LeadersPage({super.key});

  @override
  State<LeadersPage> createState() => _LeadersPageState();
}

class _LeadersPageState extends State<LeadersPage> {
  final appBarHeight = kToolbarHeight + 11 + 35;
  final UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _userService.getCurrentUser(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(
            child: Text('Пользователь отсутствует'),
          );
        }

        MyUser user = snapshot.data!;

        return Scaffold(
          appBar: UniAppBar(
            centerTitle: true,
            title: 'Рейтинг',
            height: appBarHeight,
            bottomActions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(IconlyLight.wallet),
                  const SizedBox(width: 8),
                  Text(user.earnedScores.toString()),
                ],
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: StreamBuilder(
              stream: _userService.getFirstFifteenLeaders(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return const Center(
                    child: Text('Пользователь отсутствует'),
                  );
                }
            
                final snapshotData = snapshot.data!.docs;
            
                return ListView.separated(
                  itemCount: snapshotData.length,
                  separatorBuilder: (_, index) => const SizedBox(height: 5),
                  itemBuilder: (context, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                            child: Text(
                              (index + 1).toString(),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.primary
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          UserAvatar(
                            imageURL: snapshotData[index]['picture'],
                            size: 40
                          ),
                          const SizedBox(width: 8),
                          Text(
                            surnameName(snapshotData[index]['fullname']),
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: snapshotData[index].id == user.uid
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.onBackground
                            ),
                          ),
                        ],
                      ),
                      Text(
                        snapshotData[index]['earnedScores'].toString(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      }
    );
  }
}