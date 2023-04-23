import 'package:chatgpt_course/constants/constants.dart';
import 'package:chatgpt_course/models/models_model.dart';
import 'package:chatgpt_course/services/api_service.dart';
import 'package:chatgpt_course/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ModelsDropDownWidget extends StatefulWidget {
  const ModelsDropDownWidget({super.key});

  @override
  State<ModelsDropDownWidget> createState() => _ModelsDropDownWidgetState();
}

class _ModelsDropDownWidgetState extends State<ModelsDropDownWidget> {
  String currentsModel = "gpt-3.5-turbo-0301";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ModelsModel>>(
      future: ApiService.getModels(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
              child: TextWidget(
            label: snapshot.error.toString(),
            fontSize: 16,
          ));
        }
        return snapshot.data == null || snapshot.data!.isEmpty
            ? const SizedBox.shrink()
            : FittedBox(
                child: DropdownButton(
                  dropdownColor: scaffoldBackgroundColor,
                  iconEnabledColor: Colors.white,
                  items: List<DropdownMenuItem<String>>.generate(
                      snapshot.data!.length,
                      (index) => DropdownMenuItem(
                            value: snapshot.data![index].id,
                            child: TextWidget(
                              label: snapshot.data![index].id,
                              fontSize: 15,
                            ),
                          )),
                  value: currentsModel,
                  onChanged: (value) {
                    setState(() {
                      currentsModel = value.toString();
                    });
                  },
                ),
              );
      },
    );
  }
}
