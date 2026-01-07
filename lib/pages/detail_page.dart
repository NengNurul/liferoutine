import 'package:flutter/material.dart';
import '../models/routine.dart';

class DetailPage extends StatelessWidget {
  final Routine routine;

  DetailPage({required this.routine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Aktivitas")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(routine.title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Chip(label: Text(routine.category)),
            SizedBox(height: 10),
            Text(routine.note),
          ],
        ),
      ),
    );
  }
}
