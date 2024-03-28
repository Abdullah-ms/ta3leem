import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../constants/my_url_button.dart';
import '../../constants/variables.dart';

class ScriptNew extends StatefulWidget {
  const ScriptNew({Key? key}) : super(key: key);

  @override
  State<ScriptNew> createState() => _ScriptNewState();
}

class _ScriptNewState extends State<ScriptNew> {
  @override
  void initState() {
    getScriptAnswerTheCall();
    getScriptCommunicationSkills();
    getScriptEnding();
    getScriptRequests();
    getScriptComplaints();
    getScriptOtherCallCases();
    super.initState();
  }

//--------------
  List scriptAnswerTheCall = [];

  Future readDataScriptAnswerTheCall() async {
    var url = "http://10.4.1.208/myphpta3leem/newScript/answer.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
      setState(() {
        scriptAnswerTheCall.addAll(resbody);
      });
    }
  }

  getScriptAnswerTheCall() async {
    await readDataScriptAnswerTheCall();
  }

//--------------
  List scriptCommunicationSkills = [];

  Future readDataScriptCommunicationSkills() async {
    var url = "http://10.4.1.208/myphpta3leem/newScript/communication.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
      setState(() {
        scriptCommunicationSkills.addAll(resbody);
      });
    }
  }

  getScriptCommunicationSkills() async {
    await readDataScriptCommunicationSkills();
  }

//--------------
  List scriptEnding = [];

  Future readDataScriptEnding() async {
    var url = "http://10.4.1.208/myphpta3leem/newScript/ending.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
      setState(() {
        scriptEnding.addAll(resbody);
      });
    }
  }

  getScriptEnding() async {
    await readDataScriptEnding();
  }

//--------------
  List scriptRequests = [];

  Future readDataScriptRequests() async {
    var url = "http://10.4.1.208/myphpta3leem/newScript/requests.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
      setState(() {
        scriptRequests.addAll(resbody);
      });
    }
  }

  getScriptRequests() async {
    await readDataScriptRequests();
  }

//--------------
  List scriptComplaints = [];

  Future readDataScriptComplaints() async {
    var url = "http://10.4.1.208/myphpta3leem/newScript/complaints.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
      setState(() {
        scriptComplaints.addAll(resbody);
      });
    }
  }

  getScriptComplaints() async {
    await readDataScriptComplaints();
  }

//--------------
  List scriptOtherCallCases = [];

  Future readDataScriptOtherCallCases() async {
    var url = "http://10.4.1.208/myphpta3leem/newScript/othercall.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
      setState(() {
        scriptOtherCallCases.addAll(resbody);
      });
    }
  }

  getScriptOtherCallCases() async {
    await readDataScriptOtherCallCases();
  }

//--------------

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Communication Script'.tr,
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
                  title: "Answer The Call".tr,
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
                          itemCount: scriptAnswerTheCall.length,
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
                                        text: "${scriptAnswerTheCall[index]['title']}\n\n" +
                                            "${scriptAnswerTheCall[index]['content']}",
                                      ));
                                    },
                                    icon: Icon(Icons.copy, color: Colors.redAccent,)),
                                //key: PageStorageKey(index),
                                title: SelectableText(
                                  showCursor: true,
                                  cursorColor: Colors.redAccent,
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                      text:
                                      "${scriptAnswerTheCall[index]['title']}",
                                    ));
                                  },
                                  "${scriptAnswerTheCall[index]['title']}",
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
                                        text: "${scriptAnswerTheCall[index]['content']}",
                                      ));
                                    },
                                    "${scriptAnswerTheCall[index]['content']}",
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
                Icons.new_label_rounded,
                size: cascadeiconsize,
                color: iconcolor,
              ),
              label: Text(
                'Answer The Call'.tr,
                style: TextStyle(fontSize: textsize),
              ),
              style: textbuttonStyle,
            ),
            TextButton.icon(
              onPressed: () {
                Get.defaultDialog(
                  buttonColor: Colors.red,
                  textCancel: "Close".tr,
                  cancelTextColor: Colors.red,
                  onCancel: () {
                    Get.previousRoute;
                  },
                  title: "Communication Script".tr,
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
                          itemCount: scriptCommunicationSkills.length,
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
                                        text: "${scriptCommunicationSkills[index]['title']}\n\n" +
                                            "${scriptCommunicationSkills[index]['content']}",
                                      ));
                                    },
                                    icon: Icon(Icons.copy, color: Colors.redAccent,)),
                                //key: PageStorageKey(index),
                                title: SelectableText(
                                  showCursor: true,
                                  cursorColor: Colors.redAccent,
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                      text:
                                      "${scriptCommunicationSkills[index]['title']}",
                                    ));
                                  },
                                  "${scriptCommunicationSkills[index]['title']}",
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
                                        text: "${scriptCommunicationSkills[index]['content']}",
                                      ));
                                    },
                                    "${scriptCommunicationSkills[index]['content']}",
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
                Icons.new_label_rounded,
                size: cascadeiconsize,
                color: iconcolor,
              ),
              label: Text(
                'Communication Script'.tr,
                style: TextStyle(fontSize: textsize),
              ),
              style: textbuttonStyle,
            ),
            TextButton.icon(
              onPressed: () {
                Get.defaultDialog(
                  buttonColor: Colors.red,
                  textCancel: "Close".tr,
                  cancelTextColor: Colors.red,
                  onCancel: () {
                    Get.previousRoute;
                  },
                  title: "End The Call".tr,
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
                          itemCount: scriptEnding.length,
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
                                        text: "${scriptEnding[index]['title']}\n\n" +
                                            "${scriptEnding[index]['content']}",
                                      ));
                                    },
                                    icon: Icon(Icons.copy, color: Colors.redAccent,)),
                                //key: PageStorageKey(index),
                                title: SelectableText(
                                  showCursor: true,
                                  cursorColor: Colors.redAccent,
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                      text: "${scriptEnding[index]['title']}",
                                    ));
                                  },
                                  "${scriptEnding[index]['title']}",
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
                                        text: "${scriptEnding[index]['content']}",
                                      ));
                                    },
                                    "${scriptEnding[index]['content']}",
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
                Icons.new_label_rounded,
                size: cascadeiconsize,
                color: iconcolor,
              ),
              label: Text(
                'End The Call'.tr,
                style: TextStyle(fontSize: textsize),
              ),
              style: textbuttonStyle,
            ),
            TextButton.icon(
              onPressed: () {
                Get.defaultDialog(
                  buttonColor: Colors.red,
                  textCancel: "Close".tr,
                  cancelTextColor: Colors.red,
                  onCancel: () {
                    Get.previousRoute;
                  },
                  title: "Requests".tr,
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
                          itemCount: scriptRequests.length,
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
                                        text: "${scriptRequests[index]['title']}\n\n" +
                                            "${scriptRequests[index]['content']}",
                                      ));
                                    },
                                    icon: Icon(Icons.copy, color: Colors.redAccent,)),
                                //key: PageStorageKey(index),
                                title: SelectableText(
                                  showCursor: true,
                                  cursorColor: Colors.redAccent,
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                      text: "${scriptRequests[index]['title']}",
                                    ));
                                  },
                                  "${scriptRequests[index]['title']}",
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
                                        text: "${scriptRequests[index]['content']}",
                                      ));
                                    },
                                    "${scriptRequests[index]['content']}",
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
                Icons.new_label_rounded,
                size: cascadeiconsize,
                color: iconcolor,
              ),
              label: Text(
                'Requests'.tr,
                style: TextStyle(fontSize: textsize),
              ),
              style: textbuttonStyle,
            ),
            TextButton.icon(
              onPressed: () {
                Get.defaultDialog(
                  buttonColor: Colors.red,
                  textCancel: "Close".tr,
                  cancelTextColor: Colors.red,
                  onCancel: () {
                    Get.previousRoute;
                  },
                  title: "Complaints and abuses".tr,
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
                          itemCount: scriptComplaints.length,
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
                                        text: "${scriptComplaints[index]['title']}\n\n" +
                                            "${scriptComplaints[index]['content']}",
                                      ));
                                    },
                                    icon: Icon(Icons.copy, color: Colors.redAccent,)),
                                //key: PageStorageKey(index),
                                title: SelectableText(
                                  showCursor: true,
                                  cursorColor: Colors.redAccent,
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                      text:
                                      "${scriptComplaints[index]['title']}",
                                    ));
                                  },
                                  "${scriptComplaints[index]['title']}",
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
                                        text: "${scriptComplaints[index]['content']}",
                                      ));
                                    },
                                    "${scriptComplaints[index]['content']}",
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
                Icons.new_label_rounded,
                size: cascadeiconsize,
                color: iconcolor,
              ),
              label: Text(
                'Complaints and abuses'.tr,
                style: TextStyle(fontSize: textsize),
              ),
              style: textbuttonStyle,
            ),
            TextButton.icon(
              onPressed: () {
                Get.defaultDialog(
                  buttonColor: Colors.red,
                  textCancel: "Close".tr,
                  cancelTextColor: Colors.red,
                  onCancel: () {
                    Get.previousRoute;
                  },
                  title: "Other Call Cases".tr,
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
                          itemCount: scriptOtherCallCases.length,
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
                                        text: "${scriptOtherCallCases[index]['title']}\n\n" +
                                            "${scriptOtherCallCases[index]['content']}",
                                      ));
                                    },
                                    icon: Icon(Icons.copy, color: Colors.redAccent,)),
                                //key: PageStorageKey(index),
                                title: SelectableText(
                                  showCursor: true,
                                  cursorColor: Colors.redAccent,
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                      text:
                                      "${scriptOtherCallCases[index]['title']}",
                                    ));
                                  },
                                  "${scriptOtherCallCases[index]['title']}",
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
                                        text: "${scriptOtherCallCases[index]['content']}",
                                      ));
                                    },
                                    "${scriptOtherCallCases[index]['content']}",
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
                Icons.new_label_rounded,
                size: cascadeiconsize,
                color: iconcolor,
              ),
              label: Text(
                'Other Call Cases'.tr,
                style: TextStyle(fontSize: textsize),
              ),
              style: textbuttonStyle,
            ),
          ],
        ),
      ],
    );
  }
}
