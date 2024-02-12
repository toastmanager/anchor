import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final dateInputMask = MaskTextInputFormatter(
  mask: '####.##.##',
  filter: {'#': RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy
);

final timeInputMask = MaskTextInputFormatter(
  mask: "##:##",
  filter: {'#': RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy
);

String surnameName(String fullname) =>
  fullname
    .split(" ")
    .sublist(0, 2)
    .join(" ");

String nameSurname(String fullname) =>
  fullname
    .split(" ")
    .sublist(0, 2)
    .reversed
    .join(" ");
