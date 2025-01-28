# Anchor

**Anchor** — платформа для студентов. Разработано для хакатона PeakIT 2023. Состояние на конец хакатона находится в ветке `status_of_the_project_from_hackathon_final`.

Функционал:
1. Новости ВУЗа
2. Запись на мероприятия
3. Рейтинг участия в мероприятиях
4. Расписание занятий

https://github.com/user-attachments/assets/36028b39-f599-4148-bf92-3209646dd899

## Содержание

- [Технологии](#технологии)
- [Разработка](#разработка)
- [Сборка](#сборка)
- [Команда](#команда)

## Технологии

### Языки

- [Dart](https://dart.dev/)

### Фреймворки

- [Flutter](https://flutter.dev/)

### Пакеты

- [equatable](https://pub.dev/packages/equatable)
- [flutter_svg](https://pub.dev/packages/flutter_svg)
- [cached_network_image](https://pub.dev/packages/cached_network_image)
- [mask_text_input_formatter](https://pub.dev/packages/mask_text_input_formatter)
- [intl](https://pub.dev/packages/intl)
- [image_picker](https://pub.dev/packages/image_picker)

### Остальное

- [Firebase](https://firebase.google.com/)

## Разработка

### Требования

- [Dart](https://dart.dev/)
- [Flutter](https://flutter.dev/)
- [Firebase](https://firebase.google.com/)

### Копирование репозитория

```
# Скопируйте репозиторий в нужную директорию
git clone https://github.com/toastmanager/anchor.git

# Перейдите в созданную директорию
cd anchor
```

### Установка зависимостей

```
flutter pub get
```

### Запуск приложения в режиме разработки

1. Найдите идентификатор целевого устройства

```
flutter devices
```

2. Запустите приложение на целевом устройстве. Уберите `-d <id>`, чтобы flutter выбрал устройство за вас.

```
flutter run -d <id>
```

## Сборка

### Android

```
flutter build apk --split-per-abi
```

Удаление флага --split-per-abi приводит к созданию большого APK файла, содержащего ваш код, скомпилированный для **всех** целевых ABI.

### iOS

```
flutter build ios
```

Добавьте `--no-codesign`, если хотите собрать приложение без подписи

## Команда

| Фамилия Имя          | Роль        |
| -------------------- | ----------- |
| Габышев Николай      | Разработчик |
| Корякин Владимир     | Дизайнер    |
| Гаврильева Камилла   | Менеджер    |
