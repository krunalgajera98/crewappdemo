class NotesModel {
  final int id;
  final String title;
  final String message;

  NotesModel({
    required this.id,
    required this.title,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
    };
  }

  factory NotesModel.fromJson(Map<String, dynamic> json) {
    return NotesModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      message: json['message'] ?? '',
    );
  }
}
