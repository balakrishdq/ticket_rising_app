import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticket_raising_app/model/ticket.dart';

import '../../../repository/database_repository.dart';

part 'database_event.dart';
part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  final DatabaseRepository _databaseRepository;
  DatabaseBloc(this._databaseRepository) : super(DatabaseInitial()) {
    on<DatabaseFetched>(_fetchTickets);
  }

  _fetchTickets(DatabaseFetched event, Emitter<DatabaseState> emit) async {
    List<Ticket> listofTickets = await _databaseRepository.retrieveTicket();
    emit(DatabaseSuccess(listofTickets));
  }
}
