import 'package:flutter/material.dart';

class Alertdialogs extends StatefulWidget {
  const Alertdialogs({super.key, required this.title});
  final String title;

  @override
  State<Alertdialogs> createState() => _AlertdialogsState();
}

class _AlertdialogsState extends State<Alertdialogs> {
  final TextEditingController _yorumController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "Alert Dialog",
            style: TextStyle(
              fontFamily: "PairPlay",
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(color: Colors.white),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCygCVNc0XYAzTdAMn6d-5WMTfHhjRoCzlCQ&s",
              fit: BoxFit.cover,
              height: 200,
            ),
          ),

          // 1. Buton: Sadece bilgi
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => const AlertDialog(
                    title: Text("Bu bir uyarı başlığıdır"),
                    content: Text("Bu bir uyarı açıklamasıdır"),
                    // Hiç buton yok → sadece bilgi
                  ),
                );
              },
              child: const Text("Etkileşimsiz Buton"),
            ),
          ),

          // 2. Buton: Etkileşimli
          Positioned(
            top: 120,
            left: 20,
            right: 20,
            child: TextButton(
              onPressed: () async {
                final String? result = await showDialog<String>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Onaylıyor musun?"),
                    content: const Text("Bu işlem geri alınamaz."),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, "Sil"),
                        child: const Text("Sil"),
                      ),
                    ],
                  ),
                );

                if (result != null) {
                  print(result);
                }
              },
              child: const Text("Etkileşimli Buton"),
            ),
          ),

          // 3. Buton: Etkileşimli 2 uyarı
          Positioned(
            top: 190,
            left: 20,
            right: 20,
            child: TextButton(
              onPressed: () async {
                final String? result = await showDialog<String>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Onaylıyor musun ?"),
                    content: const Text("Bu işlem geri alınamaz."),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, "Tamam"),
                        child: const Text("Tamam"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, "Sil"),
                        child: const Text("Sil"),
                      ),
                    ],
                  ),
                );

                if (result != null) {
                  print(result);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$result di'),
                      backgroundColor: result == "Sil"
                          ? Colors.red
                          : Colors.green,
                      duration: const Duration(seconds: 2),
                      action: SnackBarAction(
                        label: "Geri Al",
                        textColor: Colors.white,
                        onPressed: () {
                          // Geri alma işlemi buraya
                          print("Geri alındı: $result");
                        },
                      ),
                    ),
                  );
                }
              },
              child: const Text("2 Uyarılı Buton"),
            ),
          ),

          // 4. Buton: Textfield ile
          Positioned(
            top: 260,
            left: 20,
            right: 20,
            child: TextButton(
              onPressed: () async {
                final String? result = await showDialog<String>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text(
                      "Uygulama hakkında fikir belirt",
                      style: TextStyle(fontSize: 20),
                    ),
                    actions: <Widget>[
                      TextField(
                        controller: _yorumController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 2.0,
                            ),
                          ),
                          labelText: 'Açıklama',
                          labelStyle: TextStyle(fontSize: 10),
                        ),
                      ),

                      TextButton(
                        onPressed: () {
                          final String yazilanMetin = _yorumController.text
                              .trim(); // Kullanıcının yazdığı

                          if (yazilanMetin.isNotEmpty) {
                            print(yazilanMetin); // TAM OLARAK YAZDIĞI ŞEY!
                            Navigator.pop(context, yazilanMetin);
                          } else {
                            print("Boş yorum gönderilemez.");
                            Navigator.pop(context, null);
                          }
                        },
                        child: const Text("Gönder"),
                      ),
                    ],
                  ),
                );
                if (result != null && result.isNotEmpty) {
                  print("Kullanıcı yorumu: $result");
                } else {
                  print("Yorum boş veya iptal edildi.");
                }
              },
              child: const Text("Yorum belirt"),
            ),
          ),

          // 5. Buton: Action Sheet ile
          Positioned(
            top: 330,
            left: 20,
            right: 20,
            child: TextButton(
              onPressed: () async {
                await showDialog<String>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text(
                      "Seçenekler",
                      style: TextStyle(fontSize: 20),
                    ),
                    actions: <Widget>[
                      Center(
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                print("Kamera");
                                Navigator.pop(context);
                              },
                              child: Text("Kamera"),
                            ),
                            TextButton(
                              onPressed: () {
                                print("Galeri");
                                Navigator.pop(context);
                              },
                              child: Text("Galeri"),
                            ),
                            TextButton(
                              onPressed: () {
                                print("Dosya");
                                Navigator.pop(context);
                              },
                              child: Text("Dosya"),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("İptal"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Seçenekler"),
            ),
          ),
        ],
      ),
    );
  }
}
