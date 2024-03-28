import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/variables.dart';
import 'chatbot.dart';

class BotFB extends StatefulWidget {
  const BotFB({Key? key}) : super(key: key);

  @override
  State<BotFB> createState() => _BotFBState();
}

class _BotFBState extends State<BotFB> {
  final _formKey = GlobalKey<FormState>();
  final messageController = TextEditingController();

  //******************** chatbot

  final TelegramClient telegramClient = TelegramClient(
    chatId: "@qcsupport",
    botToken: "5857300801:AAFjiBN6KOELO9958Dss-_zj640YNXiZyhc",
  );

  Future<void> _mybot() async {
    setState(() {
      telegramClient;
    });
    final response =
        await telegramClient.sendMessage(messageController.value.text);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100], //const Color(0xfff5f5fd),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color.fromRGBO(32, 0, 88, 1),
                Color.fromRGBO(60, 3, 161, 1),
                Color.fromRGBO(109, 28, 252, 1),
                Color.fromRGBO(73, 9, 186,1),
                Color.fromRGBO(73, 9, 186,1),
                Color.fromRGBO(60, 3, 161, 1),
                Color.fromRGBO(73, 9, 186,1),
                Color.fromRGBO(32, 0, 88, 1),
              ],
            ),
          ),
        ),
        // backgroundColor: lightappbar,
      ),
      body: Center(
        child: Container(
          height: 450,
          width: 400,
          margin: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 20,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 20,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 10,
                    spreadRadius: 1,
                    color: Colors.grey[300]!)
              ]),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Feedback Us'.tr,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                TextFormField(
                  controller: messageController,
                  decoration: InputDecoration(hintText: 'type here ...'.tr),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 45,
                  width: 110,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: const Color(0xff151534),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    onPressed: () async {
                      _mybot();
                      messageController.clear();
                      AwesomeDialog(
                        width: 400,
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.rightSlide,
                        title: 'Your message sent successfully',
                        desc:
                        'Thank you for writing to us, your opinion is important',
                        btnOkOnPress: () {
                        },
                      ).show();
                    },
                    child: Text('Send'.tr, style: const TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






