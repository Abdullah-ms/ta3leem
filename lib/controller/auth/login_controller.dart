
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constants/route_names.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/login.dart';

abstract class LoginController extends GetxController {
  showPassword();

  login();

  goToSignUp();

  goToForgetPassword();

  goToHomeScreen();
}

class LoginControllerImp extends LoginController {


  late TextEditingController email;

  late TextEditingController password;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  bool isShowPassword = true;

  MyServices myServices = Get.find();
  LoginData loginData = LoginData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }


  @override
  login() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text);
      //print("=============================Controller$response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //data.addAll(response['data']);
          myServices.sharedPreferences
              .setString("id", response['data']['users_id']);
          myServices.sharedPreferences
              .setString("username", response['data']['users_name']);
          myServices.sharedPreferences
              .setString("email", response['data']['users_email']);
          myServices.sharedPreferences
              .setString("phone", response['data']['users_phone']);

      myServices.sharedPreferences.getString("username");

            Get.offAllNamed(AppRoute.homescreen);


        } else {
          Get.dialog(
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2.0))),
                icon: const Icon(Icons.warning_outlined , color: Colors.amber, size: 30),
                content: const Text('If this is the first time you log in, please check the approval request with the  \n administrator, or the email and password used are incorrect.'),
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
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {

    }
  }





  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signup);
  }


  //----------------------------
  //هذه فقط للدخول المؤقت بدون انشاء حساب

  @override
  goToHome() {
    Get.offNamed(AppRoute.homescreen);
  }

  //---------------------------

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  goToHomeScreen() {
    Get.toNamed(AppRoute.homescreen);
  }
}
