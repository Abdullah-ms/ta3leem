import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../controller/auth/successresetpassword_andSuccessSignup_controller.dart';
import '../../../core/constants/color.dart';
import '../../widgets/auth/custombuttonauth.dart';


class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SuccessResetPasswordAndSuccessSignUpControllerImp successResetPasswordController = Get.put(SuccessResetPasswordAndSuccessSignUpControllerImp());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('Success',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Center(child: Icon(Icons.check_circle_outline , size: 200, color: AppColor.green,)),
            Text('any title'),
            Text('any body'),
            Spacer(),
            Container(
              width: double.infinity,
              child: CustomButtonAuth(text: 'Go to login', onPressed: () {
                successResetPasswordController.goTologin();
              }),
            ),
            SizedBox(height: 30,)

          ],
        ),
      ),
    );
  }
}
