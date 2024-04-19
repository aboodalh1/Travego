import 'package:get/get.dart';
import 'package:travego/shared/constant.dart';
import 'package:travego/shared/locale/localController.dart';


class LanguageRadioController extends GetxController {
  LocalController controllerLang = Get.find();
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
