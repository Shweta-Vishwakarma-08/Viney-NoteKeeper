class Note {
  String title;
  String description;
  List<String> categories;

  Note({
    required this.title,
    required this.description,
    required this.categories,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'categories': categories,
      };

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      title: json['title'],
      description: json['description'],
      categories: List<String>.from(json['categories']),
    );
  }
}
