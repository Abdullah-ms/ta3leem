import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../constants/my_url_button.dart';
import '../../constants/variables.dart';


class Shops extends StatefulWidget {
  const Shops({super.key});

  @override
  State<Shops> createState() => _ShopsState();
}

class _ShopsState extends State<Shops> {

  @override
  void initState() {
    getPointOfSalesResafa();
    getPointOfSalesKarkh();
    getPointOfSalesState();
    super.initState();
  }


  List PointOfSalesResafa = [];

  Future readDataPointOfSalesResafa() async {
    var url = "http://10.4.1.208/myphpta3leem/newFAQ/pointOfSalesResafa.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
      setState(() {
        PointOfSalesResafa.addAll(resbody);
      });
    }
  }

  getPointOfSalesResafa() async {
    await readDataPointOfSalesResafa();
  }

  //--------------

  List PointOfSalesKarkh = [];

  Future readDataPointOfSalesKarkh() async {
    var url = "http://10.4.1.208/myphpta3leem/newFAQ/pointOfSalesKarkh.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
      setState(() {
        PointOfSalesKarkh.addAll(resbody);
      });
    }
  }

  getPointOfSalesKarkh() async {
    await readDataPointOfSalesKarkh();
  }

  //--------------

  List PointOfSalesState = [];

  Future readDataPointOfSalesState() async {
    var url = "http://10.4.1.208/myphpta3leem/newFAQ/pointOfSalesState.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
      setState(() {
        PointOfSalesState.addAll(resbody);
      });
    }
  }

  getPointOfSalesState() async {
    await readDataPointOfSalesState();
  }

  //--------------

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Point Of Sales'.tr,
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
                  buttonColor: Colors.blue,
                  textCancel: "Back".tr,
                  cancelTextColor: Colors.blue,
                  onCancel: () {
                    Get.previousRoute;
                  },
                  title: "بغداد / الرصافة",
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
                        child: ListView.builder(
                            itemCount: PointOfSalesResafa.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Table(
                                  border: TableBorder.all(
                                      color: Colors.grey,
                                      width: 1),
                                  columnWidths: const {
                                    0: FlexColumnWidth(0.25),
                                    1: FlexColumnWidth(1.5),
                                    2: FlexColumnWidth(4),
                                  },
                                  children: [
                                    TableRow(children: [
                                      IconButton(
                                          onPressed: () {
                                            Clipboard.setData(ClipboardData(
                                              text: "${PointOfSalesResafa[index]['number']}\n" +
                                                  "${PointOfSalesResafa[index]['name']}",
                                            ));
                                          },
                                          icon: Icon(Icons.copy, color: Colors.redAccent,)),
                                      Center(
                                          child: Text(
                                            "${PointOfSalesResafa[index]['number']}",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.green),
                                          )),
                                      Center(
                                          child: Text(
                                            "${PointOfSalesResafa[index]['name']}",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color:
                                                lighttextandtitle),
                                          )),
                                    ]),
                                  ]);
                            })),
                  ),
                  backgroundColor: lightdialogbackground,
                  titleStyle: TextStyle(color: lightbodycolor),
                );
              },
              icon: Icon(
                Icons.point_of_sale_outlined,
                size: cascadeiconsize,
                color: lightsubiconcolor,
              ),
              label: Text(
                'بغداد / الرصافة',
                style: TextStyle(fontSize: textsize),
              ),
              style: textbuttonStyle,
            ),
            TextButton.icon(
              onPressed: () {
                Get.defaultDialog(
                  buttonColor: Colors.blue,
                  textCancel: "Back".tr,
                  cancelTextColor: Colors.blue,
                  onCancel: () {
                    Get.previousRoute;
                  },
                  title: "بغداد / الكرخ",
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
                        child: ListView.builder(
                            itemCount: PointOfSalesKarkh.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Table(
                                  border: TableBorder.all(
                                      color: Colors.grey,
                                      width: 1),
                                  columnWidths: const {
                                    0: FlexColumnWidth(0.25),
                                    1: FlexColumnWidth(1.5),
                                    2: FlexColumnWidth(4),
                                  },
                                  children: [
                                    TableRow(children: [
                                      IconButton(
                                          onPressed: () {
                                            Clipboard.setData(ClipboardData(
                                              text: "${PointOfSalesKarkh[index]['number']}\n" +
                                                  "${PointOfSalesKarkh[index]['name']}",
                                            ));
                                          },
                                          icon: Icon(Icons.copy, color: Colors.redAccent,)),
                                      Center(
                                          child: Text(
                                            "${PointOfSalesKarkh[index]['number']}",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.green),
                                          )),
                                      Center(
                                          child: Text(
                                            "${PointOfSalesKarkh[index]['name']}",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color:
                                                lighttextandtitle),
                                          )),
                                    ]),
                                  ]);
                            })),
                  ),
                  backgroundColor: lightdialogbackground,
                  titleStyle: TextStyle(color: lightbodycolor),
                );
              },
              icon: Icon(
                Icons.point_of_sale_outlined,
                size: cascadeiconsize,
                color: lightsubiconcolor,
              ),
              label: Text(
                'بغداد / الكرخ',
                style: TextStyle(fontSize: textsize),
              ),
              style: textbuttonStyle,
            ),
            TextButton.icon(
              onPressed: () {
                Get.defaultDialog(
                  buttonColor: Colors.blue,
                  textCancel: "Back".tr,
                  cancelTextColor: Colors.blue,
                  onCancel: () {
                    Get.previousRoute;
                  },
                  title: "المحافظات",
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
                        child: ListView.builder(
                            itemCount: PointOfSalesState.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Table(
                                  border: TableBorder.all(
                                      color: Colors.grey,
                                      width: 1),
                                  columnWidths: const {
                                    0: FlexColumnWidth(0.25),
                                    1: FlexColumnWidth(1.5),
                                    2: FlexColumnWidth(4),
                                  },
                                  children: [
                                    TableRow(children: [
                                      IconButton(
                                          onPressed: () {
                                            Clipboard.setData(ClipboardData(
                                              text: "${PointOfSalesState[index]['number']}\n" +
                                                  "${PointOfSalesState[index]['name']}",
                                            ));
                                          },
                                          icon: Icon(Icons.copy, color: Colors.redAccent,)),
                                      Center(
                                          child: Text(
                                            "${PointOfSalesState[index]['number']}",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.green),
                                          )),
                                      Center(
                                          child: Text(
                                            "${PointOfSalesState[index]['name']}",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color:
                                                lighttextandtitle),
                                          )),
                                    ]),
                                  ]);
                            })),
                  ),
                  backgroundColor: lightdialogbackground,
                  titleStyle: TextStyle(color: lightbodycolor),
                );
              },
              icon: Icon(
                Icons.point_of_sale_outlined,
                size: cascadeiconsize,
                color: lightsubiconcolor,
              ),
              label: Text(
                'المحافظات',
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
