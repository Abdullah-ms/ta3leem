import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ta3leem/screens/auth/forgetpassword/forgetpassword.dart';
import 'package:ta3leem/screens/auth/forgetpassword/resetpassword.dart';
import 'package:ta3leem/screens/auth/forgetpassword/success_resetpassword.dart';
import 'package:ta3leem/screens/auth/login.dart';
import 'package:ta3leem/screens/auth/signup.dart';
import 'package:ta3leem/screens/auth/success_signup.dart';

import 'core/constants/route_names.dart';
import 'ta3leem.dart';


List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: ()=>  CheckList()  ,)  ,
   // GetPage(name: "/", page: () => MyHome()),
  //Auth
  GetPage(name: AppRoute.login, page: () => Login()),
  GetPage(name: AppRoute.signup, page: () => SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => ForgetPassword()),
  GetPage(name: AppRoute.resetPassword, page: () => ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword, page: () => SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => SuccessSignUp()),
  //Home
  GetPage(name: AppRoute.homescreen, page: () => CheckList()),


];

