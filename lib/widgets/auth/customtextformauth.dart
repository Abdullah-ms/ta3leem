import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final String labletext;
  final IconData iconData;
  final String? Function(String?) myvalidator;
  final TextEditingController? mycontroller;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapicon;

  const CustomTextFormAuth(
      {Key? key,
      required this.hintText,
      required this.labletext,
      required this.iconData,
      required this.mycontroller,
      required this.myvalidator,
      required this.isNumber,
      this.obscureText,
      this.onTapicon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: myvalidator,
        controller: mycontroller,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(labletext)),
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 14,
            ),
            suffixIcon: InkWell(
              onTap: onTapicon,
              child: Icon(iconData),
            ),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)))),
      ),
    );
  }
}
