part of 'database_bloc.dart';

abstract class DatabaseEvent extends Equatable {
  const DatabaseEvent();

  @override
  List<Object> get props => [];
}

class DatabaseFetched extends DatabaseEvent {
  @override
  List<Ticket> get props => [];
}
