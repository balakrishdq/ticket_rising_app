import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Ticket {
  final String title;
  final String description;
  final String location;
  final String date;
  Ticket({
    required this.title,
    required this.description,
    required this.location,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'location': location,
      'date': date,
    };
  }

  Ticket.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : title = doc.data()!['title'],
        description = doc.data()!['description'],
        location = doc.data()!['location'],
        date = doc.data()!['date'];

  Ticket copyWith({
    String? title,
    String? description,
    String? location,
    String? date,
  }) {
    return Ticket(
      title: title ?? this.title,
      description: description ?? this.description,
      location: location ?? this.location,
      date: date ?? this.date,
    );
  }
}
