import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LangController extends GetxController {
  void changelanguage (String langcode ){
    Locale currentlang = Locale ( langcode );
    Get.updateLocale(currentlang);
  }
}