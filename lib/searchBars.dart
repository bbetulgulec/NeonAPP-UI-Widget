import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: SearchBars(title: 'Arama')));

class SearchBars extends StatefulWidget {
  const SearchBars({super.key, required this.title});
  final String title;

  @override
  State<SearchBars> createState() => _SearchBarsState();
}

class _SearchBarsState extends State<SearchBars> {
  final List<Passenger> passengers = [
    Passenger("Mickey", "Mouse", Teams.flutter, "Amerika", "mickey@disney.com"),
    Passenger("Minnie", "Mouse", Teams.design, "Amerika", "minnie@disney.com"),
    Passenger("Donald", "Duck", Teams.ios, "Hollanda", "donald@disney.com"),
    Passenger("Daisy", "Duck", Teams.android, "Hollanda", "daisy@disney.com"),
  ];

  late List<Passenger> filteredPassengers;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredPassengers = List.from(passengers);
  }

  void filter(String query) {
    final q = query.trim().toLowerCase();
    setState(() {
      if (q.isEmpty) {
        filteredPassengers = List.from(passengers);
      } else {
        filteredPassengers = passengers.where((p) {
          return p.firstName.toLowerCase().contains(q) ||
              p.lastName.toLowerCase().contains(q) ||
              '${p.firstName} ${p.lastName}'.toLowerCase().contains(q);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Arama İşlemleri"))),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(
              controller: searchController,
              hintText: "İsim veya soyisim ara",
              onChanged: filter,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                showCheckboxColumn: false,
                columns: const [
                  DataColumn(label: Text("İsim")),
                  DataColumn(label: Text("Soyisim")),
                  DataColumn(label: Text("Takım")),
                  DataColumn(label: Text("Memleket")),
                  DataColumn(label: Text("E-posta")),
                ],
                rows: filteredPassengers.map((p) {
                  return DataRow(
                    cells: [
                      DataCell(Text(p.firstName)),
                      DataCell(Text(p.lastName)),
                      DataCell(Text(getTeamName(p.team))),
                      DataCell(Text(p.country)),
                      DataCell(Text(p.email)),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
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
