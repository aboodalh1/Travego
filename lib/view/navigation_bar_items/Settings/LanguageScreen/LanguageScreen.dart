import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travego/core/cubits/general_cubit/gen_cubit.dart';
import 'package:travego/core/cubits/general_cubit/gen_states.dart';
import 'package:travego/view/navigation_bar_items/Settings/LanguageScreen/LangRadioController/LanguageRadioButtonController.dart';

class LanguageScreen extends StatelessWidget {
  final LanguageRadioController radioController =
      Get.put(LanguageRadioController());

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeneralCubit, GeneralState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Choose a language".tr,
            ),
          ),
          body: Column(
            children: <Widget>[
              Obx(() => RadioListTile<String>(
                    title: Text(
                      'English',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    value: 'On',
                    groupValue: radioController.selectedValue.value,
                    onChanged: (value) {
                      radioController.selectOn();
                    },
                  )),
              Obx(() => RadioListTile<String>(
                    title: Text(
                      'العربية',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    value: 'Off',
                    groupValue: radioController.selectedValue.value,
                    onChanged: (value) {
                      radioController.selectOff();
                    },
                  )),
            ],
          ),
        );
      },
    );
  }
}
