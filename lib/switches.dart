import 'package:flutter/material.dart';

class Switches extends StatefulWidget {
  const Switches({super.key, required this.title});
  final String title;

  @override
  State<Switches> createState() => _SwitchesState();
}

class _SwitchesState extends State<Switches> {
  bool switches = true;

  List<Color> colorbackGround = [
    const Color.fromARGB(255, 255, 1, 1),
    const Color.fromARGB(255, 44, 253, 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: switches ? colorbackGround[1] : colorbackGround[0],
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "assets/images/dev_cüce.png",
              height: 300,
              width: 300,
            ),
          ),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  switches ? "Açık" : "Kapalı",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SwitchTheme(
                  data: SwitchThemeData(
                    thumbColor: WidgetStateProperty.all(Colors.black),
                    trackColor: WidgetStateProperty.resolveWith<Color?>((
                      Set<WidgetState> states,
                    ) {
                      if (states.contains(WidgetState.selected)) {
                        return Colors.red;
                      }
                      return Colors.green;
                    }),
                  ),
                  child: Switch(
                    value: switches,
                    onChanged: (bool value) {
                      setState(() {
                        switches = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
