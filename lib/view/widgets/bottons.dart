import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/colors.dart';
import 'text_widgets.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);
  final String buttonText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 311.w,
      child: ElevatedButton(
        onPressed: onPressed,
        child: TextRegular(
          text: buttonText,
          fontSize: 14,
          textColor: Colors.white,
        ),
        style: ElevatedButton.styleFrom(
          primary: premiumColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ),
    );
  }
}

class SignInWith extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final String iconPath;

  const SignInWith(
      {Key? key,
      required this.onPressed,
      required this.buttonText,
      required this.iconPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 311.w,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            children: [
              SvgPicture.asset(
                iconPath,
                fit: BoxFit.fill,
                height: 20.h,
                width: 20.h,
              ),
              SizedBox(width: 53.w),
              Text(
                buttonText,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
              side: const BorderSide(
                color: Color(0xffDDDDDD),
                width: 0.5,
              )),
        ),
      ),
    );
  }
}
