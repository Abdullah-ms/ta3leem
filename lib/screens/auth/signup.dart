import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/signup_controller.dart';
import '../../../core/constants/color.dart';
import '../../../core/functions/validinput.dart';
import '../../widgets/auth/custombuttonauth.dart';
import '../../widgets/auth/customtextformauth.dart';
import '../../widgets/auth/customtexttitleauth.dart';
import '../../widgets/auth/textsignup.dart';


class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var myheight = MediaQuery.of(context).size.height;
    var mywidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 246, 248, 1),
      body: GetBuilder<SignUpControllerImp>( builder: (signUpControllerImp)=>
         Container(
            padding:  EdgeInsets.symmetric(horizontal: mywidth/3.5 , vertical: 15),
            child: Form(
              key: signUpControllerImp.formstate,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.white,
                    border: Border.all(color: AppColor.secondColor),
                    borderRadius: BorderRadius.circular(20)),
                child: ListView(
                  padding: const EdgeInsets.all(30),
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomTextTitleAuth(
                      text: 'Sign Up ',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormAuth(
                      isNumber: false,
                      iconData: Icons.person_outline,
                      labletext: 'HR Username',
                      hintText: '',
                      mycontroller: signUpControllerImp.username,
                      myvalidator: (val ) {
                      return validInput( val! , 3, 20, 'username');
                    },
                    ),
                    CustomTextFormAuth(
                      isNumber: false,
                      iconData: Icons.email_outlined,
                      labletext: 'Company Email',
                      hintText: '',
                      mycontroller: signUpControllerImp.email,
                      myvalidator: (val ) {
                        return validInput(val!, 10 , 50, 'email');
                      },
                    ),
                    CustomTextFormAuth(
                      isNumber: true,
                      iconData: Icons.phone_android_outlined,
                      // mycontroller: null,
                      labletext: 'Phone',
                      hintText: '',
                      mycontroller: signUpControllerImp.phone,
                      myvalidator: (val ) {
                        return validInput(val!, 10 , 20, 'phone');
                      },
                    ),
                    CustomTextFormAuth(
                      isNumber: false,
                      iconData: Icons.lock_outline,
                      // mycontroller: null,
                      labletext: 'Password',
                      hintText: '******',
                      mycontroller: signUpControllerImp.password,
                      myvalidator: (val ) {
                        validInput( val! , 6, 50, 'password');
                      },
                    ),
                    CustomButtonAuth(text: 'Register', onPressed: () {
                      signUpControllerImp.signUp();
                    }),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextSignUpOrSignIn(onTap: () {
                      signUpControllerImp.goToSignIn();
                    }, text2: '  Login', text1: 'I have an account',),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
