import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clon/responsive/mobile_screen_layout.dart';
import 'package:instagram_clon/responsive/responsive_layout_screen.dart';
import 'package:instagram_clon/responsive/web_screen_layout.dart';
import 'package:instagram_clon/screens/login_screen.dart';
import 'package:instagram_clon/screens/signup_screen.dart';
import 'package:instagram_clon/utils/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDhURiOeweH4GKCRa0h3pfzbsK20eWOYag",
        appId: "1:594935232879:web:6620d99a100349c3e1d09a",
        messagingSenderId: "594935232879",
        projectId: "instagram-clone-9c030",
        storageBucket: "instagram-clone-9c030.appspot.com",
      )
    );
  }else{
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor
      ),
      //home: ResponsiveLayout(
      //  mobileScreenLayout: MobileScreenLayout(),
      //  webScreenLayout: WebScreenLayout(),
      //),
      home: LoginScreen(),
    );
  }
}