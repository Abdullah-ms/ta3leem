import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/forgetpassword_controller.dart';
import '../../../../core/constants/color.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widgets/auth/custombuttonauth.dart';
import '../../../widgets/auth/customtextbodyauth.dart';
import '../../../widgets/auth/customtextformauth.dart';
import '../../../widgets/auth/customtexttitleauth.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var myheight = MediaQuery.of(context).size.height;
    var myWidth = MediaQuery.of(context).size.width;

    ForgetPasswordControllerImp forgetPasswordControllerImp = Get.put(ForgetPasswordControllerImp());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('Forget Password',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
          padding:  EdgeInsets.symmetric(horizontal: myWidth/3.5 , vertical: 15),
          child: Form(
            key: forgetPasswordControllerImp.formstate,
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CustomTextTitleAuth(
                  text: 'Check Your Email',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextBodyAuth(
                  text:
                  'Please enter your email address to recieve a verification code',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormAuth(
                  isNumber: false,
                  iconData: Icons.email_outlined,
                  // mycontroller: null,
                  labletext: 'Email',
                  hintText: 'Enter your email',
                  mycontroller: forgetPasswordControllerImp.email,
                  myvalidator: (val ) {
                    return validInput(val!, 10, 50, 'email');
                  },
                ),
                CustomButtonAuth(text: 'send', onPressed: () {
                  forgetPasswordControllerImp.checkemail();

                }),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          )),
    );
  }
}
