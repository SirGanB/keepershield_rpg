class TableModel {
  final String id;
  final String title;
  final String subtitle;

  TableModel({required this.id, required this.title, required this.subtitle});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
    };
  }

  factory TableModel.fromJson(Map<String, dynamic> json) {
    return TableModel(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
    );
  }
}
