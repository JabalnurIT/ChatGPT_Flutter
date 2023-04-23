import 'package:chatgpt_course/constants/constants.dart';
import 'package:flutter/material.dart';

class ModelsDropDownWidget extends StatefulWidget {
  const ModelsDropDownWidget({super.key});

  @override
  State<ModelsDropDownWidget> createState() => _ModelsDropDownWidgetState();
}

class _ModelsDropDownWidgetState extends State<ModelsDropDownWidget> {
  String currentsModel = "Model1";

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: scaffoldBackgroundColor,
      iconEnabledColor: Colors.white,
      items: getModelsItems(),
      value: currentsModel,
      onChanged: (value) {
        setState(() {
          currentsModel = value.toString();
        });
      },
    );
  }
}
