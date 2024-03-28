import 'package:get/get.dart';

import '../../core/constants/route_names.dart';


abstract class SuccessResetPasswordAndSuccessSignUp extends GetxController {
  goTologin();
}

class SuccessResetPasswordAndSuccessSignUpControllerImp extends SuccessResetPasswordAndSuccessSignUp {


  @override
  goTologin() {
    Get.offAllNamed(AppRoute.login);
  }

}