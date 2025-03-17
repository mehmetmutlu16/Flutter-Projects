  import 'package:flutter/material.dart';

  import 'flappyBird/service_locator.dart';
  import 'onboard/onboard_screen.dart';

  void main() async {
    await setupServiceLocator();
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MaterialApp(home: OnboardScreen(),));
  }
