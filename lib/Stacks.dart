import 'package:flutter/material.dart';

class Stacks extends StatefulWidget {
  const Stacks({super.key, required this.title});
  final String title;

  @override
  State<Stacks> createState() => _StacksState();
}

class _StacksState extends State<Stacks> {
  final List<Map<String, dynamic>> spells = [
    {
      "name": "Expelliarmus",
      "path": "assets/images/Expelliarmus.png",
      "alignment": const Alignment(-0.9, -0.9),
    },
    {
      "name": "Accio",
      "path": "assets/images/Accio.png",
      "alignment": const Alignment(0.9, -0.9),
    },
    {
      "name": "Lumos",
      "path": "assets/images/Lumos.png",
      "alignment": const Alignment(-0.9, 0.9),
    },
    {
      "name": "Stupefy",
      "path": "assets/images/Stupefy.png",
      "alignment": const Alignment(0.9, 0.9),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            "Harry Potter Spells",
            style: TextStyle(fontFamily: "PairPlay", color: Colors.white),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          for (var spell in spells)
            Padding(
              padding: const EdgeInsets.only(
                right: 60.0,
                left: 60.0,
                top: 10.0,
              ),
              child: Align(
                alignment: spell["alignment"],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(spell["path"], height: 100),
                    const SizedBox(height: 8),
                    Text(
                      spell["name"],
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "PairPlay",
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
