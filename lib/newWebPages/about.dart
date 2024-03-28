import 'dart:async';
import 'package:flutter/material.dart';
import '../constants/variables.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {

  @override
  void initState() {

/*    getDatasocailmedia();
    getDataEmployeeTools2();*/
    timer = Timer.periodic(Duration(seconds: 4), (Timer t) {
      changeBackgroundImage();
    });

    timer2 = Timer.periodic(Duration(seconds: 4), (Timer t) {
      changeText();
    });

    timer3 = Timer.periodic(Duration(seconds: 4), (Timer t) {
      changeBackgroundRuia();
    });
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

  @override
  void setState(fn) {
    if(mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightbackground,
      appBar: AppBar(title: Text("About Ta3leem"),),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text.rich(
              textDirection: TextDirection.rtl,
              TextSpan(
                children: [
                  TextSpan(
                    text:
                    "شركة تعليم\n",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                    'لتدريب وتأهيل الكوادر البشرية وخدمات الموارد البشرية وخدمات  ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: lightbodycolor, fontSize: 16),
                  ),
                  TextSpan(
                    text: 'التعليم والتطوير\n',
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextSpan(
                    text:
                    'تعاون تعليم مع وزارات التربية والتعليم العالي والبحث العلمي العراقية والمؤسسات الحكومية اضافة الى شراكاتها الاستراتيجية مع القطاع الخاص تجعلها مؤهلة لان تكون جزء حيوي ومهم من المنظومة التعليمية وقادرة على ان تقود عجلتها نحو التقدم والحداثة.',
                    style: TextStyle(
                        color: lightbodycolor),
                  ),
                ],
              ),
            ),
            Divider(thickness: 2),
            Text(
              "منصة تعليم",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontSize: 16,
                  color: lightbodycolor,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "هي منصة تعليميـــة مبتكــرة ومتميزة، مخصصة لتلبية احتياجـات التعليم المدرسي لجميع الفئات العمرية والمراحل الدراسية. نحــن نؤمــن بأن التعليـم يجب أن يكـــون متاحــاً للجميــع، ونسعى جاهـــدين لتقديم فرصة التعلم الممتــع والفعّال عبر منصة سهلة الاستخدام ومبتكرة.",
              style: TextStyle(
                color: lightbodycolor,),
              textDirection: TextDirection.rtl,
            ),
            Divider(thickness: 2),
            Text(
              "شركائنا في النجاح",
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              color: Colors.white,
              child: Image.asset(
                backgroundImages[currentImageIndex],
                height: 150,
                width: 150,
              ),
            ),
            Divider(thickness: 2),
            Text(
              "رؤيتنا",
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              color: Colors.white,
              child: Image.asset(
                backgroundRuia[currentRuiaIndex],
                height: 80,
                width: 80,
              ),
            ),
            Center(
              child: Text(
                ruiaTexts[currentTextIndex],
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    color: lightbodycolor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

