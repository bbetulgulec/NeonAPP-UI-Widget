import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class Button extends StatefulWidget {
  const Button({super.key, required this.title});

  final String title;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> with SingleTickerProviderStateMixin {
  bool keydoor = false;

  bool _isPressed = false;
  final AudioPlayer _audioPlayer = AudioPlayer();
  late AnimationController _controller;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _shakeAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -8.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -8.0, end: 8.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 8.0, end: -8.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -8.0, end: 0.0), weight: 1),
    ]).animate(_controller);
  }

  void _playAlarm() async {
    await _audioPlayer.play(AssetSource('sounds/shake.mp3'));
  }

  void _onPress() {
    setState(() {
      _isPressed = true;
    });

    _controller.forward(from: 0);
    _playAlarm();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isPressed = false;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Buton Çeşitleri",
          style: const TextStyle(fontFamily: "PairPlay"),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Görev 1
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Açilir menü Butonu:"),
              Builder(
                builder: (buttonContext) => ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.orange),
                  ),
                  onPressed: () async {
                    final RenderBox button =
                        buttonContext.findRenderObject() as RenderBox;
                    final overlay =
                        Overlay.of(buttonContext).context.findRenderObject()
                            as RenderBox;

                    final position = RelativeRect.fromRect(
                      Rect.fromLTWH(
                        button.localToGlobal(Offset.zero, ancestor: overlay).dx,
                        button
                                .localToGlobal(Offset.zero, ancestor: overlay)
                                .dy +
                            button.size.height,
                        button.size.width,
                        button.size.height,
                      ),
                      Offset.zero & overlay.size,
                    );

                    final selected = await showMenu<String>(
                      context: buttonContext,
                      position: position,
                      items: const [
                        PopupMenuItem(
                          value: "CallSupport",
                          child: Text("Destek Çağır"),
                        ),
                        PopupMenuItem(
                          value: "WarnTownspeople",
                          child: Text("Kasaba halkını uyar"),
                        ),
                      ],
                    );

                    if (selected != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Seçildi: $selected")),
                      );
                    }
                  },
                  child: const Text(
                    "Menüyü Aç",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),

          //Görev 2 Resimli buton
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Resimli Buton:"),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text("Günün menüsü"),
                            SizedBox(height: 8),
                            Text("Çorba, salata, yoğurt vs."),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 1,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 1,
                        offset: Offset(2, 2),
                      ),
                    ],

                    image: const DecorationImage(
                      image: AssetImage("assets/images/menu.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Görev 3: Renk değiştiren buton
          Row(
            children: [
              const Text("Renk değiştiren Buton:"),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>((
                      states,
                    ) {
                      if (states.contains(WidgetState.pressed)) {
                        return Colors.yellow; // basınca
                      } else if (states.contains(WidgetState.hovered)) {
                        return Colors.orange; // üstüne gelince
                      }
                      return Colors.orange; // normal durum
                    }),
                    elevation: WidgetStateProperty.resolveWith<double>((
                      states,
                    ) {
                      if (states.contains(WidgetState.pressed)) {
                        return 12;
                      }
                      return 4;
                    }),
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("ElevatedButton tıklandı!")),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star_outlined, color: Colors.purple),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          "Kasabanın Kanunsuzlar lideri",
                          style: const TextStyle(color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          //Görev 4 : Switch butonu
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Ek düğme etkinleştiren :"),
              Switch(
                value: keydoor,
                onChanged: (bool value) {
                  setState(() {
                    keydoor = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: keydoor
                    ? () {}
                    : null, // keydoor false ise buton devre dışı
                child: const Text("Ek Buton"),
              ),
            ],
          ),

          //Görev 5: Animasyonlu Buton
          Row(
            children: [
              const Text("Animasyonlu buton :"),
              const SizedBox(width: 5),
              Expanded(
                child: AnimatedBuilder(
                  animation: _shakeAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(_shakeAnimation.value, 0),
                      child: AnimatedButton(
                        width: double.infinity,
                        text: "Hırsız Alarmı",
                        backgroundColor: _isPressed
                            ? Colors.redAccent
                            : Colors.orange,
                        selectedTextColor: Colors.black,
                        transitionType: TransitionType.BOTTOM_TO_TOP,
                        onPress: _onPress,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
