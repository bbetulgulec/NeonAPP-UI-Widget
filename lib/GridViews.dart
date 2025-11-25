import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Gridviews extends StatefulWidget {
  const Gridviews({super.key, required this.title});
  final String title;

  @override
  State<Gridviews> createState() => _GridviewsState();
}

class _GridviewsState extends State<Gridviews> {
  final List<Map<String, String>> apps = [
    {
      "appName": "ChatGPT",
      "appIcon":
          "https://play-lh.googleusercontent.com/lmG9HlI0awHie0cyBieWXeNjpyXvHPwDBb8MNOVIyp0P8VEh95AiBHtUZSDVR3HLe3A=w480-h960-rw",
      "releaseDate": "2024-06-01",
      "appCategory": "Weather",
      "storeURL":
          "https://play.google.com/store/apps/details?id=com.openai.chatgpt&hl=tr",
    },
    {
      "appName": "Google Gemini",
      "appIcon":
          "https://play-lh.googleusercontent.com/bTpNtZ6rYYX2SeI-wC4cnr7MJnOh2hjtgYu3UIrSxE09lM3GPl_Uhf9_Ih2Smje2bc0V=w480-h960-rw",
      "releaseDate": "2024-05-15",
      "appCategory": "Music",
      "storeURL":
          "https://play-lh.googleusercontent.com/bTpNtZ6rYYX2SeI-wC4cnr7MJnOh2hjtgYu3UIrSxE09lM3GPl_Uhf9_Ih2Smje2bc0V=w480-h960-rw",
    },
    {
      "appName": "Linkedln",
      "appIcon":
          "https://play-lh.googleusercontent.com/kMofEFLjobZy_bCuaiDogzBcUT-dz3BBbOrIEjJ-hqOabjK8ieuevGe6wlTD15QzOqw=w480-h960-rw",
      "releaseDate": "2024-06-01",
      "appCategory": "Weather",
      "storeURL":
          "https://play.google.com/store/apps/details?id=com.linkedin.android&hl=tr",
    },
    {
      "appName": "HBO Max",
      "appIcon":
          "https://play-lh.googleusercontent.com/HP5hUJR2u3ipVc6G758om22BTNQhTunxzRI1Rk-yltp85ilb60Ekj46_VYaRL2kiSSA=w480-h960-rw",
      "releaseDate": "2024-05-15",
      "appCategory": "Music",
      "storeURL":
          "https://play.google.com/store/apps/details?id=com.wbd.stream&hl=tr",
    },
    {
      "appName": "Prime Video",
      "appIcon":
          "https://play-lh.googleusercontent.com/mZ6pRo5-NnrO9GMwFNrK5kShF0UrN5UOARVAw64_5aFG6NgEHSlq-BX5I8TEXtTOk9s=w480-h960-rw",
      "releaseDate": "2024-06-01",
      "appCategory": "Weather",
      "storeURL":
          "https://play.google.com/store/apps/details?id=com.amazon.avod.thirdpartyclient&hl=tr",
    },
    {
      "appName": "Amazon",
      "appIcon":
          "https://play-lh.googleusercontent.com/UIYZ9hTFNg-zZUg_uzLS9YdyDpvoo1VHNFb6VlzHy5JqNMq9Uq-p2S1VPwzXCipHTFacfGKhJkyAuKL19VVlcWA=w480-h960-rw",
      "releaseDate": "2024-05-15",
      "appCategory": "Music",
      "storeURL":
          "https://play.google.com/store/apps/details?id=com.amazon.mShop.android.shopping&hl=tr",
    },
    {
      "appName": "ChatGPT",
      "appIcon":
          "https://play-lh.googleusercontent.com/lmG9HlI0awHie0cyBieWXeNjpyXvHPwDBb8MNOVIyp0P8VEh95AiBHtUZSDVR3HLe3A=w480-h960-rw",
      "releaseDate": "2024-06-01",
      "appCategory": "Weather",
      "storeURL":
          "https://play.google.com/store/apps/details?id=com.openai.chatgpt&hl=tr",
    },
    {
      "appName": "Google Gemini",
      "appIcon":
          "https://play-lh.googleusercontent.com/bTpNtZ6rYYX2SeI-wC4cnr7MJnOh2hjtgYu3UIrSxE09lM3GPl_Uhf9_Ih2Smje2bc0V=w480-h960-rw",
      "releaseDate": "2024-05-15",
      "appCategory": "Music",
      "storeURL":
          "https://play-lh.googleusercontent.com/bTpNtZ6rYYX2SeI-wC4cnr7MJnOh2hjtgYu3UIrSxE09lM3GPl_Uhf9_Ih2Smje2bc0V=w480-h960-rw",
    },
    {
      "appName": "Linkedln",
      "appIcon":
          "https://play-lh.googleusercontent.com/kMofEFLjobZy_bCuaiDogzBcUT-dz3BBbOrIEjJ-hqOabjK8ieuevGe6wlTD15QzOqw=w480-h960-rw",
      "releaseDate": "2024-06-01",
      "appCategory": "Weather",
      "storeURL":
          "https://play.google.com/store/apps/details?id=com.linkedin.android&hl=tr",
    },
    {
      "appName": "HBO Max",
      "appIcon":
          "https://play-lh.googleusercontent.com/HP5hUJR2u3ipVc6G758om22BTNQhTunxzRI1Rk-yltp85ilb60Ekj46_VYaRL2kiSSA=w480-h960-rw",
      "releaseDate": "2024-05-15",
      "appCategory": "Music",
      "storeURL":
          "https://play.google.com/store/apps/details?id=com.wbd.stream&hl=tr",
    },
    {
      "appName": "Prime Video",
      "appIcon":
          "https://play-lh.googleusercontent.com/mZ6pRo5-NnrO9GMwFNrK5kShF0UrN5UOARVAw64_5aFG6NgEHSlq-BX5I8TEXtTOk9s=w480-h960-rw",
      "releaseDate": "2024-06-01",
      "appCategory": "Weather",
      "storeURL":
          "https://play.google.com/store/apps/details?id=com.amazon.avod.thirdpartyclient&hl=tr",
    },
    {
      "appName": "Amazon",
      "appIcon":
          "https://play-lh.googleusercontent.com/UIYZ9hTFNg-zZUg_uzLS9YdyDpvoo1VHNFb6VlzHy5JqNMq9Uq-p2S1VPwzXCipHTFacfGKhJkyAuKL19VVlcWA=w480-h960-rw",
      "releaseDate": "2024-05-15",
      "appCategory": "Music",
      "storeURL":
          "https://play.google.com/store/apps/details?id=com.amazon.mShop.android.shopping&hl=tr",
    },
  ];

  int? selectedIndex;

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text(" GridView Kullanımı"))),

      body: RefreshIndicator(
        onRefresh: _refresh,
        child: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemCount: apps.length,
          itemBuilder: (context, index) {
            final app = apps[index];

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });

                // Detay sayfasına git
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailPage(app: app)),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey, width: 3),
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        app["appIcon"]!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      app["appName"]!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Map<String, String> app;
  const DetailPage({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(app["appName"]!))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(app["appIcon"]!, height: 200, fit: BoxFit.cover),
              const SizedBox(height: 20),
              Text(
                "App Name: ${app["appName"]!}",
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                "Category: ${app["appCategory"]!}",
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                "Release Date: ${app["releaseDate"]!}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.play_arrow),
                label: const Text("Open in Play Store"),
                onPressed: () async {
                  final url = Uri.parse(app["storeURL"]!);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Play Store linki açılamadı"),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
