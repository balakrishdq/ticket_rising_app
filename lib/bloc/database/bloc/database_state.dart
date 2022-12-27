part of 'database_bloc.dart';

abstract class DatabaseState extends Equatable {
  const DatabaseState();

  @override
  List<Object> get props => [];
}

class DatabaseInitial extends DatabaseState {}

class DatabaseSuccess extends DatabaseState {
  final List<Ticket> listofTickets;

  DatabaseSuccess(
    this.listofTickets,
  );

  @override
  List<Object> get props => [listofTickets];
}

class DatabaseError extends DatabaseState {
  @override
  List<Object> get props => [];
}
