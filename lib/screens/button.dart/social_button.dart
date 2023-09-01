// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mechanci/platte.dart';

class SocialButton extends StatelessWidget {
  final String path;
  final String lable;
  final double horizontalPadding;

  const SocialButton(
      {super.key,
      required this.path,
      required this.lable,
      this.horizontalPadding = 100});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: SvgPicture.asset(
        path,
        // ignore: deprecated_member_use
        color: Platte.whiteColor,
        width: 25,
      ),
      label: Text(
        lable,
        style: const TextStyle(
          color: Platte.whiteColor,
        ),
      ),
      style: TextButton.styleFrom(
          padding:
              EdgeInsets.symmetric(vertical: 30, horizontal: horizontalPadding),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              side: BorderSide(
                color: Platte.borderColor,
              ))),
    );
  }
}
