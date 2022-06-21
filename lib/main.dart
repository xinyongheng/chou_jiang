import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'answer.dart';
import 'config/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          supportedLocales: const [
            Locale('zh', 'CH'),
            Locale('en', 'US'),
          ],
          locale: const Locale('zh', 'CH'),
          title: '知识竞赛',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      designSize: const Size(888, 666),
      minTextAdapt: true,
      splitScreenMode: true,
      child: const MyHomePage(title: '知识竞赛'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: Colors.red,
          ),
          Positioned(
            top: 100.h,
            child: InkWell(
              onTap: () {
                Config.startPage(context, const AnswerWidget());
              },
              child: Text(
                '推进作风建设知识竞赛',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
