import 'package:flutter/material.dart';

class Datatables extends StatefulWidget {
  const Datatables({super.key, required this.title});
  final String title;

  @override
  State<Datatables> createState() => _DatatablesState();
}

class _DatatablesState extends State<Datatables> {
  final List<Passenger> passengers = [
    Passenger("Betül", "Güleç", Teams.flutter, "Türkiye", "betul@example.com"),
    Passenger("Ali", "Yılmaz", Teams.ios, "Almanya", "ali@example.com"),
    Passenger("Ayşe", "Demir", Teams.android, "Fransa", "ayse@example.com"),
    Passenger("Mehmet", "Kaya", Teams.design, "İtalya", "mehmet@example.com"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tablo İşlemleri")),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          showCheckboxColumn: false,
          columns: const <DataColumn>[
            DataColumn(label: Text("İsim")),
            DataColumn(label: Text("Soyisim")),
            DataColumn(label: Text("Takım")),
            DataColumn(label: Text("Memleket")),
            DataColumn(label: Text("E-posta")),
          ],

          rows: passengers
              .map(
                (p) => DataRow(
                  onSelectChanged: (selected) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PassengerDetailPage(passenger: p),
                      ),
                    );
                  },
                  cells: [
                    DataCell(Text(p.firstName)),
                    DataCell(Text(p.lastName)),
                    DataCell(Text(getTeamName(p.team))),
                    DataCell(Text(p.country)),
                    DataCell(Text(p.email)),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  String getTeamName(Teams team) {
    switch (team) {
      case Teams.flutter:
        return "Flutter Ekibi";
      case Teams.ios:
        return "iOS Ekibi";
      case Teams.android:
        return "Android Ekibi";
      case Teams.design:
        return "Tasarım Ekibi";
    }
  }
}

class Passenger {
  String firstName;
  String lastName;
  Teams team;
  String country;
  String email;

  Passenger(this.firstName, this.lastName, this.team, this.country, this.email);
}

enum Teams { flutter, ios, android, design }

class PassengerDetailPage extends StatelessWidget {
  final Passenger passenger;

  const PassengerDetailPage({super.key, required this.passenger});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${passenger.firstName} ${passenger.lastName}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ad Soyad: ${passenger.firstName} ${passenger.lastName}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                "Takım: ${getTeamName(passenger.team)}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                "Memleket: ${passenger.country}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                "E-posta: ${passenger.email}",
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getTeamName(Teams team) {
    switch (team) {
      case Teams.flutter:
        return "Flutter Ekibi";
      case Teams.ios:
        return "iOS Ekibi";
      case Teams.android:
        return "Android Ekibi";
      case Teams.design:
        return "Tasarım Ekibi";
    }
  }
}
