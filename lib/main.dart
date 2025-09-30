import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FadingTextAnimation());
  }
}

class FadingTextAnimation extends StatefulWidget {
  @override
  _FadingTextAnimationState createState() => _FadingTextAnimationState();
}

class _FadingTextAnimationState extends State<FadingTextAnimation> {
  bool _isVisible = true;

  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fading Text Animation')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: toggleVisibility,
              child: AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: Duration(seconds: 1),
                curve: Curves.bounceIn,
                child: const Text(
                  'Flutter like a Butterfly!',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            const SizedBox(height: 16),
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: const Duration(seconds: 3),
              curve: Curves.bounceIn,
              child: const Image(
                image: AssetImage('assets/butterfly.png'),
                width: 150,
                height: 150,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleVisibility,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
