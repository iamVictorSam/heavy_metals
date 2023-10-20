import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:heavy_metals/bottomNavigation.dart';
import 'package:heavy_metals/constant.dart';

class InitScreen extends StatefulWidget {
  static String routeName = '/initScreen';

  const InitScreen({super.key});
  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: const SizedBox(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(0.0),
              child: Text(
                'ToxMet®',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Colors.blue),
              ),
            ),
          ),
        ),
        splashIconSize: 280.0,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.white,
        duration: 2500,
        nextScreen: const MyNavigationBar());
  }
}
