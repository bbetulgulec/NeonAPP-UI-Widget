import 'package:flutter/material.dart';

class Pagecontrollers extends StatefulWidget {
  const Pagecontrollers({super.key, required this.title});
  final String title;

  @override
  State<Pagecontrollers> createState() => _PagecontrollersState();
}

class _PagecontrollersState extends State<Pagecontrollers> {
  final PageController pageController = PageController();

  int currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      'title': 'The Royal Gardens',
      'subtitle': 'A peaceful place full of colors and beauty.',
      'image': 'https://picsum.photos/id/1025/400/300',
    },
    {
      'title': 'The Great Library',
      'subtitle': 'Where wisdom and technology meet.',
      'image': 'https://picsum.photos/id/1003/400/300',
    },
    {
      'title': 'The Castle of Light',
      'subtitle': 'A symbol of hope and innovation.',
      'image': 'https://picsum.photos/id/1018/400/300',
    },
  ];

  final List<Color> _bgColors = [
    Colors.blueAccent,
    Colors.deepPurpleAccent,
    Colors.teal,
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColors[currentPage],
      appBar: AppBar(
        backgroundColor: Colors.transparent,

        centerTitle: true,
        title: Text(
          "Page View Kontrol",
          style: const TextStyle(
            fontFamily: "PairPlay",
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = pages[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(page['image']!, height: 200),
                      const SizedBox(height: 20),
                      Text(
                        page['title']!,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          page['subtitle']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 12,
                  width: currentPage == index ? 24 : 12,
                  decoration: BoxDecoration(
                    color: currentPage == index ? Colors.white : Colors.white54,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
