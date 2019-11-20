import 'package:flutter/material.dart';

import 'onboarding_screen.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp()
  ),
  );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OnboardingScreen();
  }
}
