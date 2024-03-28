import 'package:get/get.dart';

import '../../core/constants/route_names.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goTosuccessSignUp();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {

  late String verifycode ;

  @override
  checkCode() {

  }

  @override
  goTosuccessSignUp() {
    Get.offNamed(AppRoute.successSignUp);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

}