
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/variables.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../core/constants/color.dart';
import '../../../core/functions/validinput.dart';
import '../../widgets/auth/custombuttonauth.dart';
import '../../widgets/auth/customtextformauth.dart';
import '../../widgets/auth/customtexttitleauth.dart';
import '../../widgets/auth/logoauth.dart';
import '../../widgets/auth/textsignup.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myheight = MediaQuery.of(context).size.height;
    var myWidth = MediaQuery.of(context).size.width;


    LoginControllerImp controllerImp = Get.put(LoginControllerImp());
    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 246, 248, 1),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: myWidth / 3, vertical: 30),
        child: Form(
          key: controllerImp.formState,
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.white,
                border: Border.all(color: earthblue),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 50 , right: 50),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  const LogoAuth(),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextTitleAuth(
                    text: 'Log in'.tr,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormAuth(
                    iconData: Icons.email_outlined,
                    labletext: 'Email'.tr,
                    hintText: ''.tr,
                    mycontroller: controllerImp.email,
                    myvalidator: (val) {
                      return validInput(val!, 10, 50, 'email');
                    },
                    isNumber: false,

                  ),
                  GetBuilder<LoginControllerImp>(
                    builder: (controllerImp) => CustomTextFormAuth(
                      onTapicon: () {
                        controllerImp.showPassword();
                      },
                      obscureText: controllerImp.isShowPassword,
                      iconData: controllerImp.isShowPassword? Icons.visibility_off_outlined : Icons.visibility ,
                      labletext: 'Password'.tr,
                      hintText: ''.tr,
                      mycontroller: controllerImp.password,
                      myvalidator: (val) {
                        return validInput(val!, 6, 50, 'password');
                      },
                      isNumber: false,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      AwesomeDialog(
                        width: 400,
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.rightSlide,
                        title: 'Sorry!',
                        desc: 'You should check with the administrator',
                        btnOkOnPress: () {},
                      ).show();
                      //controllerImp.goToForgetPassword();
                    },
                    child: Text(
                      'Forgot your password?'.tr,
                      textAlign: TextAlign.end,
                      style: const TextStyle(color: AppColor.grey),
                    ),
                  ),
                  CustomButtonAuth(
                      text: 'Sign In'.tr,
                      onPressed: () async {
                        controllerImp.login();
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextSignUpOrSignIn(
                    text2: 'Sign Up'.tr,
                    text1: "New to CheckList? Create an account".tr,
                    onTap: () {
                      controllerImp.goToSignUp();
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(onPressed: (){
                    controllerImp.goToHome();
                  }, child: Text("Try it without an account (for a limited time)" , style: TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold ),))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

