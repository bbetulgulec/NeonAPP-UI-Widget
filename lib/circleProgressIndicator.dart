import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CircleProgressState extends StatefulWidget {
  const CircleProgressState({super.key, required this.title});

  final String title;

  @override
  State<CircleProgressState> createState() => _CircleProgressStateState();
}

class _CircleProgressStateState extends State<CircleProgressState>
    with SingleTickerProviderStateMixin {
  int maxValue = 100;
  double startValue = 0;

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

   Color progressColor() {
    int percent = (startValue * 100).toInt();

    int rounded = ((percent - 1) ~/ 10 + 1) * 10;

    if (rounded == 0) return Colors.yellow;

    return Colors.primaries[(rounded ~/ 10) % Colors.primaries.length];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 15, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            "Programcı Arılar",
            style: TextStyle(fontFamily: "PairPlay", color: Colors.white),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 200,
              width: 200,
              child: Stack(
                children: [
                  Positioned(
                    height: 200,
                    width: 200,
                    child: CircularProgressIndicator(
                      value: startValue,
                      color: progressColor(),
                      backgroundColor: Colors.grey.shade800,
                      strokeWidth: 8,
                    ),
                  ),

                  Center(
                    child: Text(
                      "% ${(startValue * 100).toInt()}",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              _controller.forward(from: 0);
              setState(() {
                startValue += 1 / maxValue;
                if (startValue >= 1) startValue = 0;
              });
            },
            child: Lottie.asset(
              "assets/lottie/bee.json",
              controller: _controller,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
              repeat: false,
            ),
          ),
        ],
      ),
    );
  }
}
