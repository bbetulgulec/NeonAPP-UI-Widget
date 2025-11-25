import 'package:flutter/material.dart';

class SliderUI extends StatefulWidget {
  const SliderUI({super.key, required this.title});

  final String title;

  @override
  State<SliderUI> createState() => _SliderUIState();
}

class _SliderUIState extends State<SliderUI> {
  double currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Resimler
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Opacity(
                  opacity: _getOpacity(currentSliderValue, 0),
                  child: Image.asset(
                    "assets/images/greenDragon.jpg",
                    width: 80,
                    height: 80,
                  ),
                ),
                Opacity(
                  opacity: _getOpacity(currentSliderValue, 1),
                  child: Image.asset(
                    "assets/images/yellowDragon.jpg",
                    width: 80,
                    height: 80,
                  ),
                ),
                Opacity(
                  opacity: _getOpacity(currentSliderValue, 2),
                  child: Image.asset(
                    "assets/images/redDragon.jpg",
                    width: 80,
                    height: 80,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

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
                      stops: [0.0, 0.5, 1.0],
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

  double _getOpacity(double sliderValue, int index) {
    if (index == 0) return sliderValue <= 20 ? 1.0 : 0.3;
    if (index == 1) return sliderValue > 20 && sliderValue <= 40 ? 1.0 : 0.3;
    return sliderValue > 40 ? 1.0 : 0.3;
  }
}
