import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class Segmentedbuttons extends StatefulWidget {
  const Segmentedbuttons({super.key, required this.title});
  final String title;
  @override
  State<Segmentedbuttons> createState() => _SegmentedbuttonsState();
}

class _SegmentedbuttonsState extends State<Segmentedbuttons> {
  int _currentSelection = 0;

  List<Color> bgColor = [
    const Color.fromARGB(87, 255, 0, 255),
    const Color.fromARGB(103, 0, 255, 255),
    const Color.fromARGB(109, 204, 255, 0),
  ];
  double segmentedSize = 24;

  Map<int, Widget> _children = {
    0: Text('Neon Academy 2023'),
    1: Text('Neon'),
    2: Text('Apps'),
  };

  void chooseSegmentedButton() {
    _children = {
      0: Text(
        'Neon Academy 2023',
        style: TextStyle(fontSize: segmentedSize, color: Colors.white),
      ),
      1: Text(
        'Neon',
        style: TextStyle(fontSize: segmentedSize, color: Colors.white),
      ),
      2: Text(
        'Apps',
        style: TextStyle(fontSize: segmentedSize, color: Colors.white),
      ),
    };
  }

  void _onSegmentTapped(int index) {
    setState(() {
      _currentSelection = index;

      if (index == 0) {
        segmentedSize = 25;
      } else if (index == 1) {
        segmentedSize = 20;
      } else if (index == 2) {
        segmentedSize = 10;
      }

      chooseSegmentedButton();
    });
  }

  @override
  void initState() {
    super.initState();
    chooseSegmentedButton();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.bounceInOut,
      color: bgColor[_currentSelection],
      child: Scaffold(
        backgroundColor: bgColor[_currentSelection],
        appBar: AppBar(
          backgroundColor: Colors.transparent,

          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Segmented Control",
                style: TextStyle(
                  fontFamily: "PairPlay",
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: AlignmentGeometry.topCenter,
            child: MaterialSegmentedControl(
              children: _children,
              selectionIndex: _currentSelection,
              borderColor: Colors.transparent,
              selectedColor: Colors.blueGrey,
              unselectedColor: Colors.black,
              onSegmentTapped: _onSegmentTapped,
            ),
          ),
        ),
      ),
    );
  }
}
