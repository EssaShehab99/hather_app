import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hather_app/src/utils/theme/color.dart';
import 'package:hather_app/src/views/auth/auth_screen.dart';
import 'package:hather_app/src/views/shared/app_screen.dart';
import 'package:hather_app/src/views/shared/button_widget.dart';
import 'package:hather_app/src/views/shared/text_field_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              'Register',
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
            labelText: 'Name',
            placeHolder: 'ex: Ahmed',
          ),
          TextFieldWidget(
            labelText: 'Email',
            placeHolder: 'ex: ahmed@test.com',
          ),
          SizedBox(height: 16.h),
          TextFieldWidget(
            labelText: 'Password',
            placeHolder: 'ex: sdfjA37',
          ),
          SizedBox(height: 16.h),
          TextFieldWidget(
            labelText: 'Confirm Password',
            placeHolder: 'ex: sdfjA37',
          ),
          SizedBox(height: 16.h),
          ButtonWidget(
            text: 'Register',
            onPressed: () {},
          ),
          SizedBox(height: 16.h),
          Align(
            alignment: Alignment.topCenter,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Have account?  ',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.3799999952316284),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: 'Login',
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
