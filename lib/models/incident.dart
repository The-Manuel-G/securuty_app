class Incident {
  final int? id;
  final String title;
  final String description;
  final String photoPath;
  final String audioPath;
  final DateTime date;
  final String officerName;
  final String badgeNumber;

  Incident({
    this.id,
    required this.title,
    required this.description,
    required this.photoPath,
    required this.audioPath,
    required this.date,
    required this.officerName,
    required this.badgeNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'photoPath': photoPath,
      'audioPath': audioPath,
      'date': date.toIso8601String(),
      'officerName': officerName,
      'badgeNumber': badgeNumber,
    };
  }

  static Incident fromMap(Map<String, dynamic> map) {
    return Incident(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      photoPath: map['photoPath'],
      audioPath: map['audioPath'],
      date: DateTime.parse(map['date']),
      officerName: map['officerName'],
      badgeNumber: map['badgeNumber'],
    );
  }
}
