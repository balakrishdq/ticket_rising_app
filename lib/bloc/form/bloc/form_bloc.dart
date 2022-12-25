import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticket_raising_app/repository/database_repository.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormValidate> {
  final DatabaseRepository _databaseRepository;
  FormBloc(this._databaseRepository)
      : super(FormValidate(
          title: 'Dhanush',
          description: 'He is an engineer',
          location: 'Thirubuvanam',
          date: '25/12/2022',
        )) {
    on<TitleChanged>(_onTitleChanged);
    on<DescriptionChanged>(_onDescriptionChanged);
    on<LocationChanged>(_onLocationChanged);
    on<DateChanged>(_onDateChanged);
  }

  void _onTitleChanged(TitleChanged event, Emitter<FormValidate> emit) {
    emit(state.copyWith(
      title: event.title,
    ));
  }

  void _onDescriptionChanged(
      DescriptionChanged event, Emitter<FormValidate> emit) {
    emit(state.copyWith(
      description: event.description,
    ));
  }

  void _onLocationChanged(LocationChanged event, Emitter<FormValidate> emit) {
    emit(state.copyWith(
      location: event.location,
    ));
  }

  void _onDateChanged(DateChanged event, Emitter<FormValidate> emit) {
    emit(state.copyWith(
      date: event.date,
    ));
  }
}
