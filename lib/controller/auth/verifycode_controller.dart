import 'package:get/get.dart';

import '../../core/constants/route_names.dart';


abstract class VerifyController extends GetxController {
  checkCode();
  goToResetPassword();
}

class VerifyControllerControllerImp extends VerifyController {

  late String verifycode ;

  @override
  checkCode() {

  }

  @override
  goToResetPassword() {
    Get.offNamed(AppRoute.resetPassword);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

}