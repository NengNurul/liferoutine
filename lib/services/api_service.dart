import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/routine.dart';

class ApiService {
  static const String baseUrl = "http://10.0.2.2/liferoutine_api";

  static Future<List<Routine>> getRoutines() async {
    final response =
        await http.get(Uri.parse("$baseUrl/get_routines.php"));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => Routine.fromJson(e)).toList();
    } else {
      throw Exception("Gagal mengambil data");
    }
  }

  static Future<bool> addRoutine(
      String title, String category, String note) async {
    final res = await http.post(
      Uri.parse("$baseUrl/add_routine.php"),
      body: {
        "title": title,
        "category": category,
        "note": note,
      },
    );
    return res.statusCode == 200;
  }
}
