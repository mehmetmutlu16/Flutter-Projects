import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late String _loadingText;
  late int _currentIndex;
  bool _isDisposed = false; // Disposed kontrolü için bir bayrak

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Rotation duration
      vsync: this,
    )..repeat(); // Repeat the animation

    _loadingText = 'Loading...';
    _currentIndex = 0;
    _animateText();
  }

  @override
  void dispose() {
    _isDisposed = true; // Widget kaldırıldığında bayrağı işaretle
    _controller.dispose(); // Animasyonu temizle
    super.dispose();
  }

  void _animateText() async {
    for (int i = 0; i <= _loadingText.length; i++) {
      await Future.delayed(const Duration(milliseconds: 50));

      // Disposed olup olmadığını kontrol et
      if (_isDisposed) return;

      setState(() {
        _currentIndex = i;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _controller.value * 2 * 3.141592653589793, // Full circle rotation
                    child: child,
                  );
                },
                child: Image.asset('assets/logo.png'), // Your logo widget
              ),
            ],
          ),
        ),
        const SizedBox(height: 10), // Space between the logo and the text
        Text(
          _loadingText.substring(0, _currentIndex), // Display a substring of the text
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Customize the text color
          ),
        ),
      ],
    );
  }
}
