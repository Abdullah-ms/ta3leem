import 'package:flutter/material.dart';

import '../../../constants/variables.dart';
import '../../../core/constants/imageassets.dart';


class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 80,
        backgroundColor: lightappbar,
        child: Padding(
          padding: const EdgeInsets.all(0), // Border radius
          child: ClipOval(
            child: Image.asset(
              AppImageAsset.loginLogo,
            ),
          ),
        ));
  }
}
