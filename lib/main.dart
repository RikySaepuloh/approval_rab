import 'package:al_downloader/al_downloader.dart';
import 'package:approval_rab/constants.dart';
import 'package:approval_rab/ui/login/splash_screen.dart';
import 'package:approval_rab/ui/main/main_screen.dart';
import 'package:approval_rab/ui/login/login_screen.dart';
import 'package:approval_rab/viewmodel/LoginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
// await Firebase.initializeApp();


  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.primaryColor, // Replace with your desired color
    statusBarBrightness: Brightness
        .dark, // Optional: If you want to set the status bar icons' color (dark or light)
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    super.initState();

    // const AndroidInitializationSettings initializationSettingsAndroid =
    // AndroidInitializationSettings('app_icon'); // Replace with your app's icon name

  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: OverlaySupport(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => SplashScreen(),
            '/login': (context) => LoginScreen(),
            '/main': (context) => MainScreen(),
          },
        ),
      ),
    );
  }
}