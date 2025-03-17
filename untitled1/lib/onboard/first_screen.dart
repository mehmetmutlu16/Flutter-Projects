import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Adjusting the image size
        Image.asset(
          'assets/onBoarding/onboarding1.png',
          width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
          height: MediaQuery.of(context).size.height * 0.4, // 40% of screen height
          fit: BoxFit.cover, // Ensures the image scales properly
        ),
        SizedBox(height: 20), // Adding space between image and text
        Text(
          "No ads while \nlistening music",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 255, 199, 59),
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Text(
            "Listening to music is very comfortable without any annoying ads",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 19, 54, 33),
            ),
          ),
        )
      ],
    );
  }
}
