import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/icons.dart';
import '../../widgets/bottons.dart';
import '../../widgets/text_from_field.dart';
import '../../widgets/text_widgets.dart';
import '../SignUpScreen/sign_up_screen.dart';
import '../mainPage/main_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String routeName = '/LoginScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0x0fffffff),
            Color(0xffF5F5F5),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 60.h),
                LoginScreenShadowBox(),
                SizedBox(height: 33.h),
                const LoginScreenRestBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginScreenRestBody extends StatelessWidget {
  const LoginScreenRestBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: TextRegular(
            text: "-OR-",
            textColor: Colors.black,
            fontSize: 18.sp,
          ),
        ),
        SizedBox(height: 43.h),
        SignInWith(
          buttonText: "Sign In with Facebook",
          iconPath: fbIcon,
          onPressed: () {},
        ),
        SizedBox(height: 20.h),
        SignInWith(
          buttonText: "Sign In with Google",
          iconPath: googleIcon,
          onPressed: () {},
        ),
      ],
    );
  }
}

class LoginScreenShadowBox extends StatelessWidget {
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController _emilController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreenShadowBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440.h,
      width: 344.w,
      // padding: const EdgeInsets.only(top: 10, left: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
                blurRadius: 25,
                color: const Color(0xff242424).withOpacity(0.15),
                offset: const Offset(0, 5))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsetsDirectional.only(end: 10, start: 6.5, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextRegular(
                  text: "Welcome,",
                  fontSize: 30.sp,
                  textColor: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                TextButton(
                  onPressed: () => Get.toNamed(
                    SignUpScreen.routeName,
                  ),
                  child: TextRegular(
                    text: "Sign Up  ",
                    textColor: premiumColor,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextRegular(
              text: "Sign in to Continue",
              fontSize: 14.sp,
              textColor: const Color(0xff929292),
            ),
          ),
          SizedBox(height: 20.h),
          Form(
            key: _key,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  CustomTextFromFelid(
                    isEmail: true,
                    isLastFelid: false,
                    labelText: "Email",
                    controller: _emilController,
                    validator: (value) {
                      if (value != null && !GetUtils.isEmail(value)) {
                        return " not Valid Email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFromFelid(
                    isLastFelid: true,
                    isPassword: true,
                    labelText: "Password",
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return " not Valid password";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 10),
                child: TextButton(
                  onPressed: () {},
                  child: TextRegular(
                    text: "Forgot Password?",
                    textColor: Colors.black,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Center(
            child: MainButton(
              buttonText: "SIGN IN",
              onPressed: () {
                if (_key.currentState!.validate()) {
                  // doing this
                  Get.offNamed(HomeScreen.routeName);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
