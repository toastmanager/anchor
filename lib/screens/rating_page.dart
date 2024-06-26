import 'package:anchor/components/strings.dart';
import 'package:anchor/components/user_avatar.dart';
import 'package:anchor/models/my_user_model.dart';
import 'package:anchor/utilities/user_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:unikit/unikit.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  final appBarHeight = kToolbarHeight + 11 + 35;
  final UserService _userService = UserService();

  late Future<MyUser?> currentUser;
  late Stream<QuerySnapshot<Map<String, dynamic>>> leaders;

  @override
  void initState() {
    super.initState();
    currentUser = _userService.getCurrentUser();
    leaders = _userService.getFirstFifteenLeaders();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: currentUser,
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
                  Icon(
                    IconlyLight.wallet,
                    color: Theme.of(context).colorScheme.primary
                  ),
                  const SizedBox(width: 8),
                  Text(
                    user.earnedScores.toString(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary
                    ),
                  ),
                ],
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: StreamBuilder(
              stream: leaders,
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
            
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onSurfaceVariant
                    )
                  ),
                  child: ListView.builder(
                    itemCount: snapshotData.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            )
                          )
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Row(
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
                                  size: 36
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
                );
              },
            ),
          ),
        );
      }
    );
  }
}