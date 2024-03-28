import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../constants/my_url_button.dart';
import '../../constants/variables.dart';

class FAQsNew extends StatefulWidget {
  const FAQsNew({Key? key}) : super(key: key);

  @override
  State<FAQsNew> createState() => _FAQsNewState();
}

class _FAQsNewState extends State<FAQsNew> {
  @override
  void initState() {
    getFaqCommon();
    getFaqTa3leemApp();
    super.initState();
  }

//--------------

  List faqCommon = [];

  Future readDataFaqCommon() async {
    var url = "http://10.4.1.208/myphpta3leem/newFAQ/commonQuestion.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
      setState(() {
        faqCommon.addAll(resbody);
      });
    }
  }

  getFaqCommon() async {
    await readDataFaqCommon();
  }

//------------------

  List faqTa3leemApp = [];

  Future readDataTa3leemApp() async {
    var url = "http://10.4.1.208/myphpta3leem/newFAQ/ta3leemApp.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
      setState(() {
        faqTa3leemApp.addAll(resbody);
      });
    }
  }

  getFaqTa3leemApp() async {
    await readDataTa3leemApp();
  }

  //---------


  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('FAQs'.tr,
            style:
                TextStyle(color: lighttextandtitle, fontSize: titlefontsize)),
        Divider(
          color: lighttextandtitle,
          thickness: 3,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () {
                Get.defaultDialog(
                  buttonColor: Colors.red,
                  textCancel: "Close".tr,
                  cancelTextColor: Colors.red,
                  onCancel: () {
                    Get.previousRoute;
                  },
                  title: "Common Questions".tr,
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
                      child: ListView.builder(
                          itemCount: faqCommon.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              color: index % 2 == 0
                                  ? expandlistcolor1
                                  : expandlistcolor2,
                              child: ExpansionTile(
                                leading: IconButton(
                                    onPressed: () {
                                      Clipboard.setData(ClipboardData(
                                        text: "${faqCommon[index]['title']}\n\n" +
                                            "${faqCommon[index]['content']}",
                                      ));
                                    },
                                    icon: Icon(Icons.copy, color: Colors.redAccent,)),
                                //key: PageStorageKey(index),
                                title: SelectableText(
                                  showCursor: true,
                                  cursorColor: Colors.redAccent,
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                      text: "${faqCommon[index]['title']}",
                                    ));
                                  },
                                  "${faqCommon[index]['title']}",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(color: lightbodycolor),
                                ),
                                initiallyExpanded: isExpanded,
                                onExpansionChanged: (bool expanding) {
                                  setState(() {});
                                },
                                children: <Widget>[
                                  SelectableText(
                                    showCursor: true,
                                    cursorColor: Colors.redAccent,
                                    onTap: () {
                                      Clipboard.setData(ClipboardData(
                                        text: "${faqCommon[index]['content']}",
                                      ));
                                    },
                                    "${faqCommon[index]['content']}",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(color: lightbodycolor),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                  backgroundColor: lightdialogbackground,
                  titleStyle: TextStyle(color: lightbodycolor),
                );
              },
              icon: Icon(
                Icons.question_answer_sharp,
                size: cascadeiconsize,
                color: iconcolor,
              ),
              label: Text(
                'Common Questions'.tr,
                style: TextStyle(fontSize: textsize),
              ),
              style: textbuttonStyle,
            ),
            /*TextButton.icon(
              onPressed: () {
                Get.defaultDialog(
                  buttonColor: Colors.red,
                  textCancel: "Close".tr,
                  cancelTextColor: Colors.red,
                  onCancel: () {
                    Get.previousRoute;
                  },
                  title: "Ta3leem App".tr,
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
                      child: ListView.builder(
                          itemCount: faqTa3leemApp.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              color: index % 2 == 0
                                  ? expandlistcolor1
                                  : expandlistcolor2,
                              child: ExpansionTile(
                                //key: PageStorageKey(index),
                                title: SelectableText(
                                  showCursor: true,
                                  cursorColor: Colors.redAccent,
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                      text: "${faqTa3leemApp[index]['title']}",
                                    ));
                                  },
                                  "${faqTa3leemApp[index]['title']}",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(color: lightbodycolor),
                                ),
                                initiallyExpanded: isExpanded,
                                onExpansionChanged: (bool expanding) {
                                  setState(() {});
                                },
                                children: <Widget>[
                                  Text("${faqTa3leemApp[index]['text']}",
                                      style: TextStyle(color: lightbodycolor),
                                      textDirection: TextDirection.rtl),
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                  backgroundColor: lightdialogbackground,
                  titleStyle: TextStyle(color: lightbodycolor),
                );
              },
              icon: Icon(
                Icons.app_registration_sharp,
                size: cascadeiconsize,
                color: iconcolor,
              ),
              label: Text(
                'Ta3leem App'.tr,
                style: TextStyle(fontSize: textsize),
              ),
              style: textbuttonStyle,
            ),*/
            ListView.builder(
              shrinkWrap: true,
              itemCount: faqTa3leemApp.length,
              itemBuilder: (BuildContext context, int index){
                return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildUrlLaunchButton(
                          '${faqTa3leemApp[index]['title']}', '${faqTa3leemApp[index]['myurl']}'),
                    ]);
              },
            ),
          ],


        ),
      ],
    );
  }
}
