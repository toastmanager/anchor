import 'package:anchor/models/my_user_model.dart';
import 'package:anchor/models/news_model.dart';
import 'package:anchor/utilities/news_service.dart';
import 'package:anchor/utilities/user_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unikit/unikit.dart';

class NewsCreatePage extends StatefulWidget {
  const NewsCreatePage({super.key});

  @override
  State<NewsCreatePage> createState() => _NewsCreatePageState();
}

class _NewsCreatePageState extends State<NewsCreatePage> {
  final double appBarHeight = kToolbarHeight + 11;
  final _authService = UserService();
  final _newsService = NewsService();

  XFile? image;
  late final TextEditingController imagePathController;
  final ImagePicker _picker = ImagePicker();

  final descriptionController = TextEditingController();
  late final List<UniTextField> textFields;

  @override
  void initState() {
    super.initState();

    final imagePathController = TextEditingController(
      text: image == null ? '' : image!.path.toString()
    );

    textFields = [
      UniTextField(
        labelText: 'Описание',
        hintText: 'Введите описание',
        controller: descriptionController,
      ),
      UniTextField(
        labelText: 'Изображение',
        hintText: 'Выберите изображение',
        controller: imagePathController,
        readOnly: true,
        onTap: () async {
          image = await _picker.pickImage(source: ImageSource.gallery);
          setState(() {
            imagePathController.text = image == null ? '' : image!.path.toString();
          });
        },
      ),
    ];
  }

  void _addNews() async {
    MyUser? user = await _authService.getCurrentUser();
    final news = News(
      uid: '',
      author: user!.uid,
      description: descriptionController.text,
      createdAt: Timestamp.now(),
      imageURL: image?.path,
      likes: const [],
      bookmarks: const [],
    );
    await _newsService.createNews(news, image, user.uid);
    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UniAppBar(
        centerTitle: true,
        title: 'Добавить новость',
        height: appBarHeight,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(bottom: 10),
                itemCount: textFields.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) => textFields[index],
              ),
            ),
            Row(
              children: [
                Expanded(child: UniButtonAccentMedium(
                  text: 'Подтвердить',
                  onPressed: () => _addNews(),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}