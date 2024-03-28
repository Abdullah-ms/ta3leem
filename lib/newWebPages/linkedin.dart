import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Linkedin extends StatefulWidget {
  const Linkedin({Key? key}) : super(key: key);

  @override
  State<Linkedin> createState() => _LinkedinState();
}

class _LinkedinState extends State<Linkedin> {

  List socialMedia = [];

  Future readDataSocialMedia() async {
    var url = "http://10.4.1.208/myphpta3leem/mylinks/socialmedia.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
      setState(() {
        socialMedia.addAll(resbody);
      });
    }
  }

  getDatasocialMedia() async {
    await readDataSocialMedia();
  }

  @override
  void initState() {
    getDatasocialMedia();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "LinkedIn",
      child: InkWell(
        onTap: () {
          launchURL() async {
            Uri url =
            Uri.parse('${socialMedia[6]['myurl']}');
            if (!await launchUrl(url)) {
              await launchUrl(url);
            } else {
              throw 'Could not launch $url';
            }
          }

          launchURL();
        },
        child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(0), // Border radius
              child: ClipOval(
                child: Image.asset(
                    "assets/images/ourLinkedin.gif"
                ),
              ),
            )),
      ),
    );
  }
}
