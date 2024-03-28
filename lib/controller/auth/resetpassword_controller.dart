import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/route_names.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {

  late TextEditingController password ;
  late TextEditingController repassword ;
  GlobalKey<FormState> formstate = GlobalKey<FormState>() ;

  @override
  resetpassword() {
    var formData = formstate.currentState;
    if(formData!.validate()){
      print('valid');
      Get.offNamed(AppRoute.successResetPassword);
    }else{
      print('Not valid');
    }
  }

  @override
  goToSuccessResetPassword() {
    Get.offNamed(AppRoute.successResetPassword);
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }

}