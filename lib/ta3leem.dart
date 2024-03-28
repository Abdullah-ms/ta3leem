import 'dart:async';

import 'package:url_launcher/url_launcher.dart';
import 'package:animate_icons/animate_icons.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icon_badge/icon_badge.dart';
import '../constants/variables.dart';
import '../localization/lang_controller.dart';
import '../searching/search_API.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'core/constants/color.dart';
import 'feedback/botFB.dart';
import 'newWebPages/Notifications.dart';
import 'newWebPages/about.dart';
import 'newWebPages/facebook.dart';
import 'newWebPages/inkWellAbout.dart';
import 'newWebPages/instgram.dart';
import 'newWebPages/linkedin.dart';
import 'newWebPages/mytools.dart';
import 'newWebPages/newFAQ.dart';
import 'newWebPages/newScript.dart';
import 'newWebPages/shops.dart';
import 'newWebPages/ta3leem_appstore.dart';
import 'newWebPages/ta3leem_googlePlay.dart';
import 'newWebPages/telegram.dart';
import 'newWebPages/twitter.dart';
import 'newWebPages/website.dart';
import 'newWebPages/youtube.dart';

class CheckList extends StatefulWidget {
  CheckList({Key? key}) : super(key: key);

  @override
  State<CheckList> createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  final GlobalKey<FabCircularMenuState> fabKey2 = GlobalKey();
  final GlobalKey<FabCircularMenuState> fabKey3 = GlobalKey();

  var notificationcounter = 0;

  @override
  void initState() {
    getData();
    getDatamyupdates();
/*    getDatasocailmedia();
    getDataEmployeeTools2();*/
    timer = Timer.periodic(Duration(seconds: 4), (Timer t) {
      changeBackgroundImage();
    });

    timer2 = Timer.periodic(Duration(seconds: 6), (Timer t) {
      changeText();
    });

    timer3 = Timer.periodic(Duration(seconds: 6), (Timer t) {
      changeBackgroundRuia();
    });
  }

  bool darkMode() {
    setState(() {
      lightappbar = darkappbar;
      lightbackground = darkbackground;
      lightappbartitle = darkappbartitle;
      lighttextandtitle = darktextandtitle;
      iconcolor = darkcolor;
      lightbodycolor = darkbodycolor;
      lightdialogbackground = darkdialogbackground;
      lightsubiconcolor = darksubiconcolor;
      lightFAB = darkFAB;
      lightring = darkring;
      lightdroptextcolor = darkdroptextcolor;
      lightdropdownColor = darkdropdownColor;
      mylight = mydark;
    });
    return true;
  }

  bool lightMode() {
    setState(() {
      lightappbar = Color.fromRGBO(32, 0, 88, 1);
      lightbackground = Color.fromRGBO(255, 255, 255, 1);
      lightappbartitle = Color.fromRGBO(255, 255, 255, 1);
      lighttextandtitle = Color.fromRGBO(32, 0, 88, 1);
      iconcolor = Color.fromRGBO(255, 121, 22, 1);
      lightbodycolor = Colors.black;
      lightdialogbackground = Colors.white;
      lightcolorOFFABbackground = Color.fromRGBO(255, 255, 255, 1);
      lightsubiconcolor = Color.fromRGBO(255, 121, 22, 1);
      lightFAB = Color.fromRGBO(32, 0, 88, 0.7);
      lightring = Color.fromRGBO(0, 159, 255, 0.07);
      lightdropdownColor =
          Colors.white; // const Color.fromRGBO(158, 165, 188 ,1);
      mydropFocusColor = Color.fromRGBO(214, 63, 121, 1);
      lightdroptextcolor = lightappbar; //const Color.fromRGBO(0, 159, 255, 1);
      lightactionicons = Color.fromRGBO(255, 255, 255, 1);
      mylight = Color.fromRGBO(32, 0, 88, 0.2);
    });
    return true;
  }

  //------------------------------------

  //  List url_importantTools =[];

  Future ReadData() async {
    var url = "http://10.4.1.208/myphpta3leem/mylinks/urlfab.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
/*      setState((){
        url_importantTools.addAll(resbody);
      });*/
      return resbody;
    }
  }

  getData() async {
    await ReadData();
  }

  //------------------------------------

  List myupdates = [];

  Future ReadDatamyupdates() async {
    var url = "http://10.4.1.208/myphpta3leem/mylinks/myupdates.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
      setState(() {
        myupdates.addAll(resbody);
      });
    }
  }

  getDatamyupdates() async {
    await ReadDatamyupdates();
  }

  void launchTelegram() async {
    String url = "https://telegram.me/<@qcsupportBot>";
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  //timer to change background --------------------------

  List<String> backgroundImages = [
    'assets/images/partners1.png',
    'assets/images/partners2.png',
    'assets/images/partners3.png',
    'assets/images/partners4.png',
    'assets/images/partners5.png',
    'assets/images/partners6.png',
    'assets/images/partners7.png',
    'assets/images/partners8.png',
    'assets/images/partners9.png',
    'assets/images/partners10.png',
    'assets/images/partners11.png',
    'assets/images/partners12.png',
  ];

  String currentImage = 'assets/images/partners1.png'; // Initial image

  late Timer timer;

  // Index of the current background image
  int currentImageIndex = 0; // Initial index

  // Method to change the background image randomly
  void changeBackgroundImage() {
    setState(() {
      // Randomly select an image path from the list
      currentImageIndex = (currentImageIndex + 1) % backgroundImages.length;
    });
  }

  //-----------------------------------------------------
  //timer to change ruia --------------------------

  List<String> backgroundRuia = [
    'assets/images/ruia1.png',
    'assets/images/ruia2.png',
    'assets/images/ruia3.png',
    'assets/images/ruia4.png',
    'assets/images/ruia5.png',
    'assets/images/ruia6.png',
  ];

  String currentRuiaImage = 'assets/images/ruia1.png'; // Initial image

  late Timer timer3;

  // Index of the current background image
  int currentRuiaIndex = 0; // Initial index

  // Method to change the background image randomly
  void changeBackgroundRuia() {
    setState(() {
      // Randomly select an image path from the list
      currentRuiaIndex = (currentRuiaIndex + 1) % backgroundRuia.length;
    });
  }

  //-----------------------------------------------------
  //timer to change ruia text  --------------------------

  List<String> ruiaTexts = [
    'تقديم منصات تعليمية مرنة تتناسب مع التوجهات المتنوعة للطلبة والمتعلمين',
    'دعم مستمر للمتعلمين عبر فريق عمل ودعم فني متخصص',
    'دمج التعليم والتدريب مع التكنولوجيا لتقديم تجربة تعليمية رقمية مبتكرة',
    'اثراء التعليم والتدريب باستخدام تطبيقات الواقع الافتراضي والمعزز واداوات التقييم الذكية',
    'تقديم محتوى تعليمي متميز ذو جودة عالية يغطي مختلف المجالات',
    'تقديم تجربة تعليمية ملهمة وممتعة تهدف لتحفيز الطلبة للاستمرار فـي عملية التعلم',
  ];

  String currentText =
      'تقديم منصات تعليمية مرنة تتناسب مع التوجهات المتنوعة للطلبة والمتعلمين'; // Initial image

  late Timer timer2;

  // Index of the current background image
  int currentTextIndex = 0; // Initial index

  // Method to change the background image randomly
  void changeText() {
    setState(() {
      // Randomly select an image path from the list
      currentTextIndex = (currentTextIndex + 1) % ruiaTexts.length;
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed to avoid memory leaks
    timer.cancel();
    timer2.cancel();
    super.dispose();
  }

  //-----------------------------------------------------

  @override
  Widget build(BuildContext context) {
    LangController langController = Get.find();

    return Scaffold(
      backgroundColor: lightdialogbackground,
      appBar: AppBar(
        // backgroundColor: lightappbar,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(0), // Border radius
                      child: ClipOval(
                        child: Image.asset("assets/images/education.gif"),
                      ),
                    )),
                SizedBox(
                  width: 10,
                ),
                DefaultTextStyle(
                  style: TextStyle(fontSize: 20.0, color: lightappbartitle),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText(
                        'Ta3leem Knowledge base'.tr,
                        textStyle: const TextStyle(
                          fontSize: 18,
                        ),
                        colors: [
                          Colors.white,
                          Colors.deepPurple,
                          Colors.orange,
                          Colors.white,
                        ],
                      ),
                    ],
                    totalRepeatCount: 8000,
                    pause: const Duration(milliseconds: 10),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),
                ),
              ],
            ),
          ],
        ),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const Dialog(
                      elevation: 0,
                      insetAnimationCurve: Curves.easeInCubic,
                      child: SearchAPI(),
                    );
                  },
                );
              },
              icon: const Icon(Icons.search),
              color: Colors.white),
          //   TextButton.icon(onPressed: (){}, icon: const Icon(Icons.notifications_none,color: Colors.white,), label: const Text("notifications")),
          IconBadge(
              icon: const Icon(Icons.notifications_none,color: Colors.white),
              itemCount: notificationcounter + 1,
              badgeColor: Colors.red,
              itemColor: Colors.white,
              hideZero: true,
              onTap: () {
                setState(
                  () {
                    Get.defaultDialog(
                      title: '''
Updates : 
            ''',
                      content: Container(
                        height: 400,
                        width: 800,
                        margin: const EdgeInsets.all(3),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.green, width: borderwidth),
                        ),
                        child: SingleChildScrollView(
                          child: SelectableText(
                            showCursor: true,
                            cursorColor: Colors.redAccent,
                            onTap: () {
                              Clipboard.setData(ClipboardData(
                                text: "${myupdates[0]["body"]}",
                              ));
                            },
                            "${myupdates[0]["body"]}",
                            textDirection: TextDirection.ltr,
                            style: TextStyle(color: lightbodycolor),
                          ),
                        ),
                      ),
                      backgroundColor: lightdialogbackground,
                      titleStyle: TextStyle(color: lightbodycolor),
                    );
                    notificationcounter = -1;
                  },
                );
              }),
/*
          IconButton(onPressed: (){
            InAppNotification.show(
              child: NotificationBody(
                minHeight: _minHeight,
              ),
              context: context,
              onTap: () => print('Notification tapped!'),
              duration: Duration(milliseconds: _duration),
            );
          }, icon: const Icon(Icons.new_releases_outlined)),
*/
          /*  AnimateIcons(
            startIcon: Icons.language,
            endIcon: Icons.language,
            size: 20.0,
            controller: AnimateIconController(),
            // add this tooltip for the start icon
            startTooltip: 'Arabic',
            // add this tooltip for the end icon
            endTooltip: 'English',
            onStartIconPress: () {
              langController.changelanguage("ar");
              isarabic = false;
              return true;
            },
            onEndIconPress: () {
              langController.changelanguage("en");
              isarabic = true;
              return true;
            },
            duration: const Duration(milliseconds: 500),
            startIconColor: Colors.white,
            endIconColor: Colors.white,
            clockwise: true,
          ),*/
          AnimateIcons(
            startIcon: Icons.lightbulb_outline,
            endIcon: Icons.lightbulb_outline,
            size: 20.0,
            controller: AnimateIconController(),
            // add this tooltip for the start icon
            startTooltip: 'Enable dark mode',
            // add this tooltip for the end icon
            endTooltip: 'Enable light mode',
            onStartIconPress: () => darkMode(),
            onEndIconPress: () => lightMode(),
            duration: const Duration(milliseconds: 500),
            startIconColor: Colors.yellowAccent,
            endIconColor: AppColor.grey,
            clockwise: true,
          ),
        ],
        /* shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
        ),*/
        toolbarHeight: 50,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color.fromRGBO(32, 0, 88, 1),
                Color.fromRGBO(60, 3, 161, 1),
                Color.fromRGBO(109, 28, 252, 1),
                Color.fromRGBO(73, 9, 186, 1),
                Color.fromRGBO(73, 9, 186, 1),
                Color.fromRGBO(60, 3, 161, 1),
                Color.fromRGBO(73, 9, 186, 1),
                Color.fromRGBO(32, 0, 88, 1),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          // This is our back-to-top button
          Align(
            alignment: Alignment.bottomRight,
            child: Wrap(
              children: <Widget>[
                Column(
                  children: [
                    FloatingActionButton.small(
                      elevation: 10,
                      hoverColor: Colors.green,
                      hoverElevation: 20,
                      heroTag: "f10",
                      backgroundColor: earthblue,
                      // const Color.fromRGBO(42, 171, 238, 1),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              elevation: 0,
                              insetAnimationCurve: Curves.easeInCubic,
                              child: BotFB(),
                            );
                          },
                        );
                        // Get.to(() =>  MyHomePage());
                      },
                      // Feedback,
                      child: Icon(
                        Icons.telegram,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    SizedBox(
                      height: 28.0,
                      width: 50.0,
                      child: FittedBox(
                        child: DefaultTextStyle(
                          style: const TextStyle(
                              fontSize: 10.0,
                              color: Color.fromRGBO(17, 147, 209, 1)),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText(
                                'Technical',
                                textStyle: GoogleFonts.pacifico(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 10,
                                  color: lighttextandtitle,
                                ),
                              ),
                              TyperAnimatedText(
                                'Support',
                                textStyle: GoogleFonts.pacifico(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 10,
                                  color: lighttextandtitle,
                                ),
                              ),
                              TyperAnimatedText(
                                'Quality',
                                textStyle: GoogleFonts.pacifico(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 10,
                                  color: lighttextandtitle,
                                ),
                              ),
                            ],
                            repeatForever: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //button first
                // Add more buttons here
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ta3leem.png'),
                fit: BoxFit.fill,
                opacity: 0.08,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: Column(children: [
                Container(
                  margin: EdgeInsets.all(2.0),
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color.fromRGBO(32, 0, 88, 1),
                          Color.fromRGBO(60, 3, 161, 1),
                          Color.fromRGBO(109, 28, 252, 1),
                          Color.fromRGBO(73, 9, 186, 1),
                          Color.fromRGBO(73, 9, 186, 1),
                          Color.fromRGBO(60, 3, 161, 1),
                          Color.fromRGBO(73, 9, 186, 1),
                          Color.fromRGBO(32, 0, 88, 1),
                        ],
                      ),
                      // color: mylight,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: lighttextandtitle, width: 1)),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Tools()),
                      Expanded(flex: 1, child: Ta3leemGoogle()),
                      Expanded(flex: 1, child: Ta3leemAppStore()),
                      Expanded(flex: 1, child: Website()),
                      Expanded(flex: 1, child: Facebook()),
                      Expanded(flex: 1, child: Youtube()),
                      Expanded(flex: 1, child: Telegram()),
                      Expanded(flex: 1, child: Instagram()),
                      Expanded(flex: 1, child: Linkedin()),
                      Expanded(flex: 1, child: Twitter()),
                      Expanded(flex: 1, child: AboutUs()),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: ScriptNew()),
                    Expanded(child: FAQsNew()),
                    Expanded(child: Shops()),
                    Expanded(child: Notifications()),
                  ],
                ),
                const SizedBox(
                  height: 700,
                ),
                Container(
                  height: 250,
                  // color: lightFAB,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color.fromRGBO(32, 0, 88, 1),
                          Color.fromRGBO(60, 3, 161, 1),
                          Color.fromRGBO(109, 28, 252, 1),
                          Color.fromRGBO(73, 9, 186, 1),
                          Color.fromRGBO(73, 9, 186, 1),
                          Color.fromRGBO(60, 3, 161, 1),
                          Color.fromRGBO(73, 9, 186, 1),
                          Color.fromRGBO(32, 0, 88, 1),
                        ],
                      ),
                      // color: lightFAB,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: earthblue, width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Copyright©2023 Technical_Support_Quality",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
