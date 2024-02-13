import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hather_app/src/utils/theme/color.dart';
import 'package:hather_app/src/views/auth/auth_screen.dart';
import 'package:hather_app/src/views/shared/app_screen.dart';
import 'package:hather_app/src/views/shared/button_widget.dart';
import 'package:hather_app/src/views/shared/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return AuthScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50.h),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 30.sp,
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ),
          SizedBox(height: 36.h),
          TextFieldWidget(
            labelText: 'Email',
            placeHolder: 'ex: test@gmail.com',
          ),
          SizedBox(height: 16.h),
          TextFieldWidget(
            labelText: 'Password',
            placeHolder: 'ex: sdfjA37',
          ),
          SizedBox(height: 16.h),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
                padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 4.h)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.h)))),
            child: Text(
              'forget Password',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black.withOpacity(0.3799999952316284),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          ButtonWidget(
            text: 'Log in',
            onPressed: () {},
          ),
          SizedBox(height: 16.h),
          Align(
            alignment: Alignment.topCenter,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'New User?  ',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.3799999952316284),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: 'Register',
                    style: TextStyle(
                      color: Color(0xFF6173D2),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 100.h),
          Text(
            'By using the application, you agree to the terms of use and privacy policy',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF6173D2),
              fontSize: 12,
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          )
        ],
      ),
    );
  }
}
