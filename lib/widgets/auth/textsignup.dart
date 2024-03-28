import 'package:flutter/material.dart';


import '../../../constants/variables.dart';
import '../../../core/constants/color.dart';


class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String text1;

  final String text2;

  final void Function()? onTap;

  const CustomTextSignUpOrSignIn(
      {Key? key, required this.text1, required this.text2, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(flex : 3 , child: Text(text1)),
        Expanded(
          child: InkWell(
            onTap: onTap,
            child: Text(
              text2,
              style: TextStyle(
                  color: earthblue, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
