import 'package:get/get.dart';

import '../../../../../core/utils/shared/constant.dart';

class LanguageRadioController extends GetxController {
  var controllerLang = Get.find();
  var selectedValue = 'On'.obs;

  void selectOn() {
    selectedValue.value = 'On';
    controllerLang.changeLang("en");
    isLTR = false;
  }

  void selectOff() {
    selectedValue.value = 'Off';
    controllerLang.changeLang("ar");
    isLTR = true;
  }
}
