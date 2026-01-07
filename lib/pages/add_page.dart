import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final titleCtrl = TextEditingController();
  final categoryCtrl = TextEditingController();
  final noteCtrl = TextEditingController();

  bool loading = false;

  void saveRoutine() async {
    setState(() { loading = true; });

    final success = await ApiService.addRoutine(
      titleCtrl.text.trim(),
      categoryCtrl.text.trim(),
      noteCtrl.text.trim(),
    );

    setState(() { loading = false; });

    if (success) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Rutinitas berhasil ditambahkan")));
      Navigator.pop(context, true); // balik ke Home
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Gagal menambah data")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Aktivitas")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleCtrl,
              decoration: InputDecoration(labelText: "Judul Aktivitas"),
            ),
            TextField(
              controller: categoryCtrl,
              decoration: InputDecoration(labelText: "Kategori"),
            ),
            TextField(
              controller: noteCtrl,
              decoration: InputDecoration(labelText: "Catatan"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: loading ? null : saveRoutine,
              child: loading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
