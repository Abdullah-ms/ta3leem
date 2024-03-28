
import 'dart:core';
import 'package:flutter/material.dart';



Color helpertitleTextColor = const Color.fromRGBO(0, 159, 255, 1);

late var myusername, myemail, mypassword;




bool isarabic = true;

TextStyle textOfFAB =  TextStyle(color: lighttextandtitle , fontSize: 20  );
TextStyle textOfdroplists =  const TextStyle(color:  Color.fromRGBO(154, 35, 89, 1) ,  fontSize: 14 , fontWeight: FontWeight.bold );
ButtonStyle  textbuttonStyle =  ButtonStyle(
  foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return Colors.pink;
        }
        return lighttextandtitle ; // null throus error in flutter 2.2+.
      }
  ),
  backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return Colors.yellow;
        }
        return Colors.transparent ; // null throus error in flutter 2.2+.
      }
  ),
);
ButtonStyle  droptextbuttonStyle =  ButtonStyle(
  foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return Colors.blue;
        }
        return  const Color.fromRGBO(154, 35, 89, 1); // null throus error in flutter 2.2+.
      }
  ),
  backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return Colors.yellow;
        }
        return Colors.transparent ; // null throus error in flutter 2.2+.
      }
  ),
);


// Color laith =  const Color.fromRGBO(255, 78, 0, 1);
Color earthblue =  Color.fromRGBO(32, 0, 88, 1); //  const Color.fromRGBO(17, 147, 209, 1);
Color earthred =   Color.fromRGBO(244, 26, 32, 1);
Color barColor =  Color.fromRGBO(32, 0, 88, 1);


Color borderofTextFieldForLoginAndSignup = earthblue ;
Color enabledborder = Colors.deepPurpleAccent;
//light mode
Color lightappbar =   Color.fromRGBO(32, 0, 88, 1);
Color lightbackground =    Color.fromRGBO(255, 255, 255, 1);
Color lightappbartitle =   Color.fromRGBO(255, 255, 255, 1);
Color lighttextandtitle =   Color.fromRGBO(32, 0, 88, 1);
Color iconcolor =  Color.fromRGBO(255, 121, 22, 1);
Color lightbodycolor = Colors.black;
Color lightdialogbackground = Colors.white;
Color lightcolorOFFABbackground =  Color.fromRGBO(255, 255, 255, 1);
Color lightsubiconcolor =  Color.fromRGBO(255, 121, 22, 1);
Color lightFAB =  Color.fromRGBO(32, 0, 88, 0.7);
Color lightring =  Color.fromRGBO(0, 159, 255, 0.07);
Color lightdropdownColor =Colors.white;// const Color.fromRGBO(158, 165, 188 ,1);
Color mydropFocusColor =   Color.fromRGBO(214, 63, 121 ,1);
Color lightdroptextcolor =  lightappbar;//const Color.fromRGBO(0, 159, 255, 1);
Color lightactionicons =  Color.fromRGBO(255, 255, 255 ,1);
Color mylight =  Color.fromRGBO(32, 0, 88, 0.2);




// dark mmode
Color darkappbar =   Color.fromRGBO(154, 35, 89, 1);
Color darkbackground =  Color.fromRGBO(35, 43, 54, 1) ;
Color darkappbartitle =   Color.fromRGBO(255, 255, 255, 1);
Color darktextandtitle =  Color.fromRGBO(255, 255, 255, 1);
Color darkcolor =  Color.fromRGBO(244, 26, 32, 1);
Color darkbodycolor = Colors.white;
Color darkdialogbackground =  Color.fromRGBO(35, 43, 54, 1);
Color darkcolorOFFABbackground =  Color.fromRGBO(35, 43, 54, 1) ;
Color darksubiconcolor=  Color.fromRGBO(244, 26, 32, 1);
Color darkFAB =  Color.fromRGBO(154, 35, 89, 1);
Color darkring =  Color.fromRGBO(154, 35, 89, 0.2);
Color darkdroptextcolor = darkappbar; // const Color.fromRGBO(154, 35, 89, 1);
Color darkdropdownColor =  Colors.white;
Color mydark =  Color.fromRGBO(154, 35, 89, 0.2);



//fuchsia mode
Color fuchsiaappbar =  const Color.fromRGBO(219, 61, 132, 1);
Color fuchsiabackground =  const Color.fromRGBO(255, 255, 255, 1);
Color fuchsiaappbartitle =  const Color.fromRGBO(255, 255, 255, 1);
Color fuchsiatextandtitle = const Color.fromRGBO(255, 255, 255, 1);
Color fuchsiacolor = const Color.fromRGBO(219, 61, 132, 1);
Color fuchsiabodycolor = Colors.white;
Color fuchsiadialogbackground = const Color.fromRGBO(219, 61, 132, 1);

//violet mode
Color violetappbar =  const Color.fromRGBO(127, 0, 255, 1);
Color violetbackground =  const Color.fromRGBO(255, 255, 255, 1);
Color violetappbartitle =  const Color.fromRGBO(255, 255, 255, 1);
Color violettextandtitle =  Colors.white;
Color violetcolor = const Color.fromRGBO(127, 0, 255, 1);
Color violetbodycolor = Colors.white;
Color violetdialogbackground =  const Color.fromRGBO(127, 0, 255, 1);


Color backgroundOfLoginStart =  const Color.fromRGBO(255, 134, 116, 0.7);
Color backgroundOfLoginEnd =  const Color.fromRGBO(249, 139, 136, 1);

Color expandlistcolor1 =  Color.fromRGBO(118, 72, 245, 0.08);
Color expandlistcolor2 =   Color.fromRGBO(118, 72, 245, 0.15) ;


double cascadeiconsize = 20;

// double titlefontsize = 4.sp;
// double textsize = 2.75.sp;
// double dialoghieght = 450;
// double dialogwidth = 500;
// double listviewcontainer = 25.w;
// double iconsize = 3.sp;
// double borderpadding = 6.0 ;
// double borderwidth= 1 ;

double dialoghieght = 460; // Get.height/1.4; // old = 400
double dialogwidth = 910;   // Get.width/1.2;  // old = 500
double titlefontsize = 20;
double textsize = 20;
double tabsfontSize = 14;
//double listviewcontainer = 25.w;
double iconsize = 15;
double borderpadding = 6.0 ;
double borderwidth= 1 ;


double nornalSupportTextSize = 40 ;
double onFlipSupportTextSize = 70 ;

double nornalMoreTextSize = 40 ;
double onFlipMoreTextSize = 70 ;

double nornalVipTextSize = 40 ;
double onFlipVipTextSize = 70 ;


double HightOfHelperTabs = 35;

