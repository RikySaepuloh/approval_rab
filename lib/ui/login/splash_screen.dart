import 'package:approval_rab/app_routes.dart';
import 'package:approval_rab/constants.dart';
import 'package:approval_rab/shared_preferences_utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    // Check if a login token exists
    String? token = await SharedPreferencesUtils.getLoginToken();

    // Wait for a short duration to simulate checking login status.
    await Future.delayed(Duration(seconds: 2));

    // Navigate to the appropriate screen based on the presence of the login token.
    if (token != null && token.isNotEmpty) {
      // If the token exists, navigate to the home screen
      Navigator.pushReplacementNamed(context, AppRoutes.main);
    } else {
      // If the token doesn't exist, show the login screen
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: AppColors.primaryColor,),
      ),
    );
  }
}
