import 'package:flutter/material.dart';

class Listviews extends StatefulWidget {
  const Listviews({super.key, required this.title});
  final String title;

  @override
  State<Listviews> createState() => _ListviewsState();
}

class _ListviewsState extends State<Listviews> {
  final List<Map<String, Object>> news = [
    {
      "image":
          "https://geoim.bloomberght.com/l/2025/11/03/ver1762154643/3760636/jpg/640x360",
      "title": "Yeniden değerleme oranı yüzde 25,49 oldu",
      "desciription":
          "TÜİK'in açıkladığı enflasyon verisiyle Yeniden Değerleme Oranı da belli oldu...",
    },
    {
      "image":
          "https://geoim.bloomberght.com/l/2025/11/03/ver1762154643/3760636/jpg/640x360",
      "title": "Yeniden değerleme oranı yüzde 25,49 oldu",
      "desciription":
          "TÜİK'in açıkladığı enflasyon verisiyle Yeniden Değerleme Oranı da belli oldu...",
    },
    {
      "image":
          "https://geoim.bloomberght.com/l/2025/11/03/ver1762154643/3760636/jpg/640x360",
      "title": "Yeniden değerleme oranı yüzde 25,49 oldu",
      "desciription":
          "TÜİK'in açıkladığı enflasyon verisiyle Yeniden Değerleme Oranı da belli oldu...",
    },
    {
      "image":
          "https://geoim.bloomberght.com/l/2025/11/03/ver1762154643/3760636/jpg/640x360",
      "title": "Yeniden değerleme oranı yüzde 25,49 oldu",
      "desciription":
          "TÜİK'in açıkladığı enflasyon verisiyle Yeniden Değerleme Oranı da belli oldu...",
    },
    {
      "image":
          "https://geoim.bloomberght.com/l/2025/11/03/ver1762154643/3760636/jpg/640x360",
      "title": "Yeniden değerleme oranı yüzde 25,49 oldu",
      "desciription":
          "TÜİK'in açıkladığı enflasyon verisiyle Yeniden Değerleme Oranı da belli oldu...",
    },
    {
      "image":
          "https://geoim.bloomberght.com/l/2025/11/03/ver1762154643/3760636/jpg/640x360",
      "title": "Yeniden değerleme oranı yüzde 25,49 oldu",
      "desciription":
          "TÜİK'in açıkladığı enflasyon verisiyle Yeniden Değerleme Oranı da belli oldu...",
    },
    {
      "image":
          "https://geoim.bloomberght.com/l/2025/11/03/ver1762154643/3760636/jpg/640x360",
      "title": "Yeniden değerleme oranı yüzde 25,49 oldu",
      "desciription":
          "TÜİK'in açıkladığı enflasyon verisiyle Yeniden Değerleme Oranı da belli oldu...",
    },
    {
      "image":
          "https://geoim.bloomberght.com/l/2025/11/03/ver1762154643/3760636/jpg/640x360",
      "title": "Yeniden değerleme oranı yüzde 25,49 oldu",
      "desciription":
          "TÜİK'in açıkladığı enflasyon verisiyle Yeniden Değerleme Oranı da belli oldu...",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(child: Text("Haberler")),
      ),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(news[index]["image"] as String),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    news[index]["title"] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4,
                  ),
                  child: Text(
                    news[index]["desciription"] as String,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
