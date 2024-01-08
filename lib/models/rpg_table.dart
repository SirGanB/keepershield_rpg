class RpgTable {
  final String title;
  final String subtitle;

  RpgTable({required this.title, required this.subtitle});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
    };
  }

  factory RpgTable.fromJson(Map<String, dynamic> json) {
    return RpgTable(
      title: json['title'],
      subtitle: json['subtitle'],
    );
  }
}
