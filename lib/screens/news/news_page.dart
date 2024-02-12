import 'package:anchor/models/my_user_model.dart';
import 'package:anchor/models/news_model.dart';
import 'package:anchor/screens/news/news_card.dart';
import 'package:anchor/utilities/news_service.dart';
import 'package:anchor/utilities/user_service.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final UserService _userService = UserService();
  final NewsService _newsService = NewsService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _newsService.getNews(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(
            child: Text('Список пуст'),
          );
        }
    
        List newsList = snapshot.data?.docs ?? [];
    
        return Scaffold(
          body: ListView.separated(
            itemCount: newsList.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              News newsItem = newsList[index].data();
              return FutureBuilder(
                future: _userService.getUserByUid(newsItem.author),
                builder: (context, authorSnapshot) {
                  if (!authorSnapshot.hasData) {
                    if (authorSnapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return const Center(
                      child: Text('Пользователь отсутствует'),
                    );
                  }

                  MyUser author = authorSnapshot.data!;

                  return NewsCard(
                    author: author,
                    likesAmount: newsItem.likes.length,
                    createdAt: newsItem.createdAt,
                    description: newsItem.description
                  );
                },
              );
            }
          ),
        );
      },
    );
  }
}