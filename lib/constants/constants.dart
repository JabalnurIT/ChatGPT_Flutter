import 'package:chatgpt_course/widgets/text_widget.dart';
import 'package:flutter/material.dart';

Color scaffoldBackgroundColor = const Color(0xFF343541);
Color cardColor = const Color(0xFF444654);

List<String> models = [
  'Model1',
  'Model2',
  'Model3',
  'Model4',
  'Model5',
  'Model6',
];

List<DropdownMenuItem<String>>? getModelsItems() {
  List<DropdownMenuItem<String>>? modelsItems =
      List<DropdownMenuItem<String>>.generate(
          models.length,
          (index) => DropdownMenuItem(
                value: models[index],
                child: TextWidget(
                  label: models[index],
                  fontSize: 15,
                ),
              ));

  return modelsItems;
}

final chatMessages = [
  {
    "msg": "Hello, who are you?",
    "chatIndex": 0,
  },
  {
    "msg": "Hello, I am a chatGPT",
    "chatIndex": 1,
  },
  {
    "msg": "What is flutter?",
    "chatIndex": 0,
  },
  {
    "msg":
        "Flutter is an open-source UI software development kit created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase.",
    "chatIndex": 1,
  },
  {
    "msg": "Okay thanks",
    "chatIndex": 0,
  },
  {
    "msg": "You are welcome",
    "chatIndex": 1,
  },
];
