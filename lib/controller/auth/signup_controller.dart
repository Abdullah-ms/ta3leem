import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constants/route_names.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/auth/signup.dart';

abstract class SignUpController extends GetxController {
  signUp();

  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController username;

  late TextEditingController email;

  late TextEditingController phone;

  late TextEditingController password;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  SignUpData signupData = SignUpData(Get.find());
  List data = [];
  late StatusRequest statusRequest;

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postSignUpData(
          username.text, email.text, phone.text, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
           // data.addAll(response['data']);
          Get.offNamed( AppRoute.login,
              arguments: {"email": email.text});
        } else {

          Get.dialog(
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2.0))),
                icon: const Icon(Icons.warning_outlined , color: Colors.amber, size: 30),
                content: const Text('This email or phone number is taken. Please use another one.'),
                actions: [
                  Container(
                    alignment: Alignment.center,
                    child: TextButton(
                      child: const Text("Close" , textAlign: TextAlign.center , style: TextStyle(color: Colors.red , fontSize: 20 , fontWeight: FontWeight.bold), ),
                      onPressed: () => Get.back(),
                    ),
                  ),
                ],
              ),
            ),
          );

 /*         Get.defaultDialog(
              title: "Warning",
              middleText: "Phone Number Or Email Already Exists");*/
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
