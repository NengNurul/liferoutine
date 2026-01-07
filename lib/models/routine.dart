class Routine {
  final String title;
  final String category;
  final String note;

  Routine({required this.title, required this.category, required this.note});

  factory Routine.fromJson(Map<String, dynamic> json) {
    return Routine(
      title: json['title'],
      category: json['category'],
      note: json['note'],
    );
  }
}
