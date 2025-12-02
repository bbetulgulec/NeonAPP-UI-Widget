import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SliderUI extends StatefulWidget {
  const SliderUI({super.key, required this.title});

  final String title;

  @override
  State<SliderUI> createState() => _SliderUIState();
}

class _SliderUIState extends State<SliderUI> {
  double currentSliderValue = 20;
  final int _duration = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SVG'lerin Dinamik Olarak Boyanması/Görünürlüğü
            SizedBox(
              width: 300,
              height: 300,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  _buildAnimatedSvg(
                    color: Colors.green,
                    assetPath: "assets/svg/a.svg",
                    isVisible: currentSliderValue <= 20,
                  ),
                  _buildAnimatedSvg(
                    color: Colors.yellow,
                    assetPath: "assets/svg/a.svg",
                    isVisible:
                        currentSliderValue > 20 && currentSliderValue <= 40,
                  ),
                  _buildAnimatedSvg(
                    color: Colors.red,
                    assetPath: "assets/svg/a.svg",
                    isVisible: currentSliderValue > 40,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Slider
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: const LinearGradient(
                      colors: [Colors.green, Colors.yellow, Colors.red],
                      stops: [0.0, 0.4, 1.0],
                    ),
                  ),
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 8,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 12,
                    ),
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 24,
                    ),
                    thumbColor: Colors.blue,
                    overlayColor: Colors.blue.withAlpha(32),
                    valueIndicatorColor: Colors.blue,
                    valueIndicatorTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    activeTrackColor: Colors.transparent,
                    inactiveTrackColor: Colors.transparent,
                  ),
                  child: Slider(
                    value: currentSliderValue,
                    min: 0,
                    max: 50,
                    divisions: 50,
                    label: currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        currentSliderValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedSvg({
    required Color color,
    required String assetPath,
    required bool isVisible,
  }) {
    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.0,
      duration: Duration(milliseconds: _duration),
      child: SvgPicture.asset(
        assetPath,
        width: 300,
        height: 300,
        color: color, // fill ve stroke aynı anda renklenecek
      ),
    );
  }
}
