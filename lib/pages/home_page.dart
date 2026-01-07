import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/routine.dart';
import 'detail_page.dart';
import 'profile_page.dart';
import 'add_page.dart';   // ← jangan lupa import AddPage

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Routine>> routines;

  @override
  void initState() {
    super.initState();
    routines = ApiService.getRoutines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LifeRoutine")),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF3F7CC0)),
              child: Text(
                "LifeRoutine",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Beranda"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProfilePage()),
                );
              },
            ),
          ],
        ),
      ),

      body: FutureBuilder<List<Routine>>(
        future: routines,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Gagal memuat data"));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Belum ada aktivitas"));
          }

          return ListView(
            padding: EdgeInsets.all(10),
            children: snapshot.data!.map((r) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: Icon(Icons.favorite, color: Colors.red),
                  title: Text(r.title),
                  subtitle: Text(r.category),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DetailPage(routine: r)),
                    );
                  },
                ),
              );
            }).toList(),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddPage()),
          );

          if (result == true) {
            setState(() {
              routines = ApiService.getRoutines();
            });
          }
        },
      ),
    );
  }
}
