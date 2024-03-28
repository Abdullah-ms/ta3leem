import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ta3leem/constants/variables.dart';
import 'package:url_launcher/url_launcher.dart';


TextButton buildUrlLaunchButton(String buttonText, String mylink) {
  return TextButton.icon(
    onPressed: () {
      _launchURL() async {
        Uri url = Uri.parse(mylink);
        if (!await launchUrl(url)) {
          await launchUrl(url);
        } else {
          throw 'Could not launch $url';
        }
      }

      _launchURL();
    },
    icon: Icon(
      Icons.label_important,
      size: cascadeiconsize,
      color: lightsubiconcolor,
    ),
    label: Text(buttonText, style: textOfFAB),
  );
}


//-------------------------


Size screenSize = WidgetsBinding.instance.window.physicalSize;
double screenWidth = screenSize.width;
double screenHeight = screenSize.height;

TextButton DialogButton (String buttonTitle, String buttonBody) {

  return TextButton.icon(
    onPressed: () {
      Get.defaultDialog(
        buttonColor: Colors.red,
        textCancel: "Close".tr,
        cancelTextColor: Colors.red,
        onCancel: () {
          Get.previousRoute;
        },
        title: buttonTitle.tr,
        content: Expanded(
          child: Container(
            height: screenHeight,
            width: screenWidth,
            margin: const EdgeInsets.all(3),
            padding: EdgeInsets.all(borderpadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: lighttextandtitle, width: borderwidth),
            ),
            child: SingleChildScrollView(
              child: SelectableText(
                showCursor: true,
                cursorColor: Colors.redAccent,
                onTap: () {
                  Clipboard.setData(ClipboardData(
                    text: buttonBody,
                  ));
                },
                buttonBody,
                textDirection: TextDirection.rtl,
                style: TextStyle(color: lightbodycolor),
              ),
            ),
          ),
        ),
        backgroundColor: lightdialogbackground,
        titleStyle: TextStyle(color: lightbodycolor),
      );
    },
    icon: Icon(
      Icons.label_important,
      size: iconsize,
      color: iconcolor,
    ),
    label: Text(
      buttonTitle.tr,
      style: TextStyle(
        color: lighttextandtitle ,
          fontSize: textsize),
    ),
    style: textbuttonStyle,
  );
}

