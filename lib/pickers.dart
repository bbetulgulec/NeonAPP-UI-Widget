import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_font_picker/flutter_font_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Pickers extends StatefulWidget {
  const Pickers({super.key, required this.title});
  final String title;

  @override
  State<Pickers> createState() => _PickersState();
}

class _PickersState extends State<Pickers> {
  String name = "Ali Veli";
  int age = 23;

  File? pickedImage;
  final String defaultImage =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdcqA1nVlucPg6b1tBBjcABTi7FC4LWU7xQw&s";
  PickerFont? selectedFont;
  Color backgroundColor = Colors.white;

  final ImagePicker picker = ImagePicker();
  final PageController pageController = PageController();
  int currentPage = 0;

  // resim seçme
  Future<void> pickImageFromGallery() async {
    var status = await Permission.photos.request();
    if (status.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Lütfen galeri erişimine izin verin.")),
      );
      return;
    }

    try {
      final XFile? xfile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );
      if (xfile == null) return;

      setState(() {
        pickedImage = File(xfile.path);
      });
    } catch (e) {
      print(e);
    }
  }

  // 🎂 Yaş seçme
  Future<void> pickBirthDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      int newAge = DateTime.now().year - date.year;
      setState(() {
        age = newAge;
      });
    }
  }

  // 🎨 Renk seçme
  void pickColor() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Arka plan rengini seç"),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: backgroundColor,
            onColorChanged: (color) {
              setState(() {
                backgroundColor = color;
              });
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Tamam"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 26,
                              fontFamily: selectedFont?.fontFamily ?? 'Roboto',
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ClipOval(
                            child: pickedImage != null
                                ? Image.file(
                                    pickedImage!,
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    defaultImage,
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Yaş: $age",
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: selectedFont?.fontFamily ?? 'Roboto',
                            ),
                          ),
                        ],
                      );

                    case 1:
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: pickImageFromGallery,
                            child: pickedImage != null
                                ? Image.file(
                                    pickedImage!,
                                    height: 200,
                                    width: 200,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    defaultImage,
                                    height: 200,
                                    width: 200,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          const SizedBox(height: 10),
                          const Text("Resme tıklayarak değiştirin"),
                        ],
                      );

                    case 2:
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Yazı Tipi Seç",
                            style: TextStyle(fontSize: 22),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () async {
                              await showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: SizedBox(
                                      height: 500,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: FontPicker(
                                              onFontChanged: (PickerFont font) {
                                                setState(() {
                                                  selectedFont = font;
                                                });
                                              },
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text("Kapat"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: const Text("Yazı tipi seç"),
                          ),

                          const SizedBox(height: 20),
                          if (selectedFont != null)
                            Text(
                              "Seçilen font: ${selectedFont!.fontFamily}",
                              style: TextStyle(
                                fontFamily: selectedFont!.fontFamily,
                                fontSize: 20,
                              ),
                            ),
                        ],
                      );

                    case 3:
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Yaşınızı seçmek için doğum tarihinizi girin",
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: pickBirthDate,
                            child: const Text("Doğum Tarihi Seç"),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Yaşınız: $age",
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      );

                    case 4:
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Arka plan rengini değiştir",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: pickColor,
                            child: const Text("Renk Seç"),
                          ),
                        ],
                      );
                  }
                  return const SizedBox();
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 10,
                  width: currentPage == index ? 24 : 10,
                  decoration: BoxDecoration(
                    color: currentPage == index ? Colors.black : Colors.black26,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
