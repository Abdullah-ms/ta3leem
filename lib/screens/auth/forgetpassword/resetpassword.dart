import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/resetpassword_controller.dart';
import '../../../../core/constants/color.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widgets/auth/custombuttonauth.dart';
import '../../../widgets/auth/customtextbodyauth.dart';
import '../../../widgets/auth/customtextformauth.dart';
import '../../../widgets/auth/customtexttitleauth.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ResetPasswordControllerImp resetPasswordControllerImp = Get.put(ResetPasswordControllerImp());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('Reset Your Password',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          child: Form(
            key: resetPasswordControllerImp.formstate,
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                CustomTextTitleAuth(
                  text: 'New Password',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextBodyAuth(
                  text:
                  'Please enter new password',
                ),
                SizedBox(
                  height: 15,
                ),
            CustomTextFormAuth(
              isNumber: false,
              iconData: Icons.lock_outline,
              // mycontroller: null,
              labletext: 'Password',
              hintText: 'Enter new password',
              mycontroller: resetPasswordControllerImp.password,
              myvalidator: (val ) {
                return validInput(val!, 6, 50, 'password');
              },
            ),
                SizedBox(
                  height: 15,
                ),
                CustomTextFormAuth(
                  isNumber: false,
                  iconData: Icons.lock_outline,
                  // mycontroller: null,
                  labletext: 'Password',
                  hintText: 'repeate new password',
                  mycontroller: resetPasswordControllerImp.password,
                  myvalidator: (val ) {
                    return validInput(val!, 6, 50, 'password');
                  },
                ),
                CustomButtonAuth(text: 'send', onPressed: () {
                  resetPasswordControllerImp.resetpassword();
                }),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          )),
    );
  }
}
