import 'package:anchor/components/strings.dart';
import 'package:anchor/models/my_event_model.dart';
import 'package:anchor/utilities/event_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:unikit/unikit.dart';

class EventAddingPage extends StatefulWidget {
  const EventAddingPage({super.key});

  @override
  State<EventAddingPage> createState() => _EventAddingPapeState();
}

class _EventAddingPapeState extends State<EventAddingPage> {
  final double appBarHeight = kToolbarHeight + 11;  

  XFile? image;

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final organizerController = TextEditingController();
  final costController = TextEditingController();
  late final TextEditingController imagePathController;
  final ImagePicker _picker = ImagePicker();


  late final List<UniTextField> textFields;

  @override
  void initState() {
    super.initState();

    final imagePathController = TextEditingController(
      text: image == null ? '' : image!.path.toString()
    );

    textFields = [
      UniTextField(
        labelText: 'Название',
        hintText: 'Дайте название',
        controller: nameController,
      ),
      UniTextField(
        labelText: 'Описание',
        hintText: 'Введите описание',
        controller: descriptionController,
      ),
      UniTextField(
        labelText: 'Дата',
        hintText: '1960.01.01',
        inputFormatters: [dateInputMask],
        controller: dateController,
        keyboardType: TextInputType.datetime,
      ),
      UniTextField(
        labelText: 'Время',
        hintText: '09:30',
        inputFormatters: [timeInputMask],
        controller: timeController,
        keyboardType: TextInputType.number,
      ),
      UniTextField(
        labelText: 'Ответственный',
        hintText: 'Укажите ответсвенного',
        controller: organizerController,
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
      UniTextField(
        labelText: 'Укажите вознаграждение',
        hintText: 'Введите вознаграждение',
        keyboardType: TextInputType.number,
        controller: costController,
      ),
    ];
  }

  final _eventService = EventService();

  void _addEvent() {
    final event = MyEvent(
      uid: '',
      organizer: organizerController.text.trim(),
      title: nameController.text.trim(),
      beginTime: Timestamp.fromDate(
        DateFormat('yyyy.MM.dd HH:MM').parse("${dateController.text.trim()} ${timeController.text.trim()}")
      ),
      cost: int.parse(costController.text.trim()),
      image: '',
      description: descriptionController.text.trim(),
      participants: const [],
    );
    _eventService.createEvent(event, image!);
    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UniAppBar(
        centerTitle: true,
        title: 'Добавить мероприятие',
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
                  onPressed: () => _addEvent(),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}