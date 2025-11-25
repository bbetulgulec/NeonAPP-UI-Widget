import 'package:flutter/material.dart';

class Linearprogressindicators extends StatefulWidget {
  const Linearprogressindicators({super.key, required this.title});

  final String title;

  @override
  State<Linearprogressindicators> createState() =>
      _LinearprogressindicatorsState();
}

class _LinearprogressindicatorsState extends State<Linearprogressindicators> {
  double maxValue = 10;
  double startValue = 0;
  List<Image> aladdinImage = [];

  void conterLinear() {
    setState(() {
      startValue += 1 / maxValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              "Aladdinin Sihirli Lambası",
              style: TextStyle(fontFamily: "PairPlay"),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: LinearProgressIndicator(
                  value: startValue,
                  color: Colors.blue,
                  backgroundColor: Colors.black,
                ),
              ),
            ),
            TextButton(onPressed: conterLinear, child: Text("Öğren")),

            if (startValue >= 1)
              GestureDetector(
                onTap: () {
                  setState(() {
                    startValue = 0;
                  });
                },
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9kAyJQPN0OOswMpbN-7xbVzXE8kR4FxsWhQ&s",
                  height: 200,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
