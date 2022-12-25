import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ticket_raising_app/model/ticket.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  addTicket(Ticket ticketData) async {
    await _db
        .collection('tickets')
        .doc(ticketData.title)
        .set(ticketData.toMap());
  }

  Future<List<Ticket>> retrieveTickets() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection('tickets').get();
    return snapshot.docs
        .map((docSnapshot) => Ticket.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}
