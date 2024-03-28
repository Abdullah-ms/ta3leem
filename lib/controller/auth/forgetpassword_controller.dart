import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/route_names.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();

  goToverifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {

  late TextEditingController email;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  checkemail() {
    var formData = formstate.currentState;
    if (formData!.validate()) {
      // print('valid');
      Get.offNamed(AppRoute.verifyCode);
    }else{
     // print('Not valid');
    }
  }

  @override
  goToverifyCode() {
    Get.offNamed(AppRoute.verifyCode);
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
