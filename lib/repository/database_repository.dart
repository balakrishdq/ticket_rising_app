import 'package:ticket_raising_app/service/database_service.dart';

import '../model/ticket.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  DatabaseService service = DatabaseService();

  @override
  Future<void> SaveTicketData(Ticket ticketData) {
    return service.addTicket(ticketData);
  }

  @override
  Future<List<Ticket>> retrieveTicket() {
    return service.retrieveTickets();
  }
}

abstract class DatabaseRepository {
  Future<void> SaveTicketData(Ticket ticketData);
  Future<List<Ticket>> retrieveTicket();
}
