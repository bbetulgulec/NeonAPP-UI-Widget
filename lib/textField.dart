import 'package:flutter/material.dart';

class Textfield extends StatefulWidget {
  const Textfield({super.key, required this.title});
  final String title;

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  final TextEditingController emailController = TextEditingController();
  String? errorMessage;

  bool isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEB853D),
      body: Expanded(
        child: Stack(
          children: [
            // Sağ üst köşedeki sabit örümcek ağı
            Positioned(
              top: 0,
              left: 0,
              child: IgnorePointer(
                child: Opacity(
                  opacity: 0.8,
                  child: Image.asset(
                    'assets/images/orumcek.png',
                    width: 200,
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 180.0, left: 80.0),
                    child: Positioned(
                      child: IgnorePointer(
                        child: Opacity(
                          opacity: 0.8,
                          child: Text(
                            "Cadı Akademisi",
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: "PairPlay",
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) {
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),

                      labelText: 'Ad-Soyad Girin',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.blue,
                      fontStyle: FontStyle.italic,
                      fontSize: 15,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      errorText: errorMessage,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),

                      labelText: 'E-posta Adresini girin',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          errorMessage = null;
                        } else if (!isValidEmail(value)) {
                          errorMessage = "Geçerli email girin";
                        } else {
                          errorMessage = null;
                        }
                      });
                    },
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                    ),
                    keyboardType: TextInputType.phone,
                    maxLines: 1,
                    maxLength: 10,

                    decoration: InputDecoration(
                      prefixText: '+90 ',
                      prefixStyle: TextStyle(color: Colors.green),
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),

                      labelText: 'Telefon Numaras girin',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
