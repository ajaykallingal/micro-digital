import 'dart:async';

import 'package:flutter/material.dart';

import '../../data/bloc/auth_bloc.dart';
import '../../data/shared_pref/object_factory.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

final splashDelay = 3;

class _SplashScreenState extends State<SplashScreen> {
  final authBloc = AuthBloc();

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   authBloc.getOtpSCListener.listen((event) {
  //     if(!event.authUserResponse!.newUser)
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _loadWidget();
    // Add code after super
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    if (mounted) {
      print(ObjectFactory().prefs.isLoggedIn().toString());
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) =>
      //         LoginScreen()),
      //         (Route<dynamic> route) => false);
      // Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      //
      if (!ObjectFactory().prefs.isLoggedIn()!) {
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, "/dashboard", (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/background_splash.jpg"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 142.78,
                width: 246.41,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/microcheck_logo.png"),
                  ),
                ),
              ),
            ),
            RefreshProgressIndicator(
              color: Colors.white,
              backgroundColor: Colors.transparent,
            ),
          ],
        ),
      ),
      // Align(
      //   child:
      //   alignment: Alignment.center,
      // ),
    );
  }
}
