import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Config {
  static final AppBar_Title_Size = 25.sp;
  static final First_Size = 15.sp;
  static final Second_Size = 15.sp;
  static final Default_Size = 15.sp;

  static TextStyle loadAppBarTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: AppBar_Title_Size,
    );
  }

  static TextStyle loadDefaultTextStyle(
      {Color color = Colors.black, double? fonstSize}) {
    return TextStyle(
      color: color,
      fontSize: fonstSize ?? Default_Size,
    );
  }

  static AppBar loadAppbar(String title) {
    return AppBar(
      title: Text(
        title,
        style: loadAppBarTextStyle(),
      ),
      centerTitle: true,
    );
  }

  static TextStyle loadFirstTextStyle({Color? backgroundColor}) {
    return TextStyle(
      fontSize: First_Size,
      fontWeight: FontWeight.bold,
      backgroundColor: backgroundColor,
    );
  }

  static ButtonStyle loadPerformButtonStyle() {
    return TextButton.styleFrom(
      primary: Colors.white,
      backgroundColor: Colors.blue,
      padding: EdgeInsets.only(
        left: 60.sp,
        top: 15.sp,
        right: 60.sp,
        bottom: 15.sp,
      ),
    );
  }

  static startPage(context, page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }
}
