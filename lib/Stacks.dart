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
      "alignment": const Alignment(-0.8, -0.1),
    },
    {
      "name": "Accio",
      "path": "assets/images/Accio.png",
      "alignment": const Alignment(0.1, -0.8),
    },
    {
      "name": "Lumos",
      "path": "assets/images/Lumos.png",
      "alignment": const Alignment(-0.8, 0.8),
    },
    {
      "name": "Stupefy",
      "path": "assets/images/Stupefy.png",
      "alignment": const Alignment(0.8, 0.8),
    },
  ];
  final offsets = [
    const Offset(0, -40), // ÜSTTE – net yukarı oynar
    const Offset(40, 0), // SAĞDA – net sağa oynar
    const Offset(0, 40), // ALTA – net aşağı oynar
    const Offset(-40, 0), // SOLDa – net sola oynar
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

          Center(
            child: Stack(
              children: List.generate(spells.length, (index) {
                final spell = spells[index];

                final double dy = index * 35;

                return Transform.translate(
                  offset: offsets[index],

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(spell["path"], height: 100),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
