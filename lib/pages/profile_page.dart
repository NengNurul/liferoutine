import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, size: 80, color: Colors.red),
            SizedBox(height: 10),
            Text("Hallo Nurul!", style: TextStyle(fontSize: 22)),
            Text("Ayo jalani hidup yang lebih seimbang"),
          ],
        ),
      ),
    );
  }
}

