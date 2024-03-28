import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'localization/arabish.dart';
import 'localization/lang_controller.dart';
import 'ta3leem.dart';



void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Get.put(LangController());
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.spectralTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      title: 'Ta3leem Knowledge base',
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      translations: Mylanguages(),
      home:  CheckList() ,
     // getPages: routes,
    );
  }
}
