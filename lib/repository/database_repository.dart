import 'package:ticket_raising_app/service/database_service.dart';

import '../model/ticket.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  DatabaseService service = DatabaseService();

  @override
  Future<void> SaveTicketData(Ticket ticket) {
    return service.addTicket(ticket);
  }

  @override
  Future<List<Ticket>> retrieveTicket() {
    return service.retrieveTickets();
  }
}

abstract class DatabaseRepository {
  Future<void> SaveTicketData(Ticket ticket);
  Future<List<Ticket>> retrieveTicket();
}
