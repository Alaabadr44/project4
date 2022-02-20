import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/bottons.dart';
import '../../widgets/text_from_field.dart';
import '../../widgets/text_widgets.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  static String routeName = '/SignUpScreen';
  final GlobalKey<FormState> _key = GlobalKey();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emilController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0x0fffffff),
              Color(0xffF5F5F5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 62.h),
              Center(
                child: Container(
                  height: 563.h,
                  width: 344.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 25,
                        color: const Color(0xff242424).withOpacity(0.15),
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 16, top: 11),
                        child: TextRegular(
                          text: "Sign Up",
                          textColor: Colors.black,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Form(
                          key: _key,
                          child: Column(
                            children: [
                              SizedBox(height: 47.h),
                              CustomTextFromFelid(
                                labelText: "Name",
                                controller: _nameController,
                                isLastFelid: false,
                                validator: (value) {
                                  if (value != null &&
                                      !GetUtils.isUsername(value)) {
                                    return " invalid user name";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 38.h),
                              CustomTextFromFelid(
                                labelText: "Email",
                                isEmail: true,
                                controller: _emilController,
                                isLastFelid: false,
                                validator: (value) {
                                  if (value != null &&
                                      !GetUtils.isEmail(value)) {
                                    return " not Valid Email";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 38.h),
                              CustomTextFromFelid(
                                labelText: "password",
                                isPassword: true,
                                controller: _passwordController,
                                isLastFelid: true,
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
                      SizedBox(height: 50.h),
                      Center(
                        child: MainButton(
                          buttonText: "SIGN UP",
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              // do this
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
