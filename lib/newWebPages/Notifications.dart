import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../constants/my_url_button.dart';
import '../constants/variables.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Notifications extends StatefulWidget {
   Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {




  Future ReadData() async {
    var url = "http://10.4.1.208/myphpta3leem/mydata/notification.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
/*      setState((){
        accounting.addAll(resbody);
      });*/
      return resbody;
    }
  }

  getData() async {
    await ReadData();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notifications'.tr,
          style: TextStyle(color: lighttextandtitle, fontSize: titlefontsize),
        ),
        Divider(
          color: lighttextandtitle,
          thickness: 3,
        ),
        FutureBuilder(
            future: ReadData(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            Get.defaultDialog(
                              buttonColor: Colors.red,
                              textCancel: "2".tr,
                              cancelTextColor: Colors.red,
                              onCancel: () {
                                Get.previousRoute;
                              },
                              title: "${snapshot.data[index]["title"]}".tr,
                              content: Expanded(
                                child: Container(
                                  height: screenHeight,
                                  width: screenWidth,
                                  margin: const EdgeInsets.all(3),
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: lighttextandtitle,
                                        width: borderwidth),
                                  ),
                                  child: SingleChildScrollView(
                                    child: SelectableText(
                                      showCursor: true,
                                      cursorColor: Colors.redAccent,
                                      onTap: () {
                                        Clipboard.setData(ClipboardData(
                                          text:
                                          '${snapshot.data[index]["body"]}'.tr,
                                        ));
                                      },
                                      '${snapshot.data[index]["body"]}'.tr,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(color: lightbodycolor ),
                                    ),
                                  ),
                                ),
                              ),
                              backgroundColor: lightdialogbackground,
                              titleStyle: TextStyle(color: lightbodycolor),
                            );
                          },
                          icon: Icon(
                            Icons.circle_notifications_sharp,
                            size: cascadeiconsize,
                            color: iconcolor,
                          ),
                          label: Text(
                            '${snapshot.data[index]["title"]}'.tr,
                            style: TextStyle(
                                color: lighttextandtitle, fontSize: textsize),
                          ),
                          style: textbuttonStyle,
                        ),
                      ],
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.transparent),
                );
              }
            }),
      ],
    );
  }
}
