// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'form_bloc.dart';

abstract class FormEvent extends Equatable {
  const FormEvent();

  @override
  List<Object> get props => [];
}

class TitleChanged extends FormEvent {
  final String title;

  TitleChanged(this.title);

  @override
  List<Object> get props => [];
}

class DescriptionChanged extends FormEvent {
  final String description;

  DescriptionChanged(this.description);

  @override
  List<Object> get props => [];
}

class LocationChanged extends FormEvent {
  final String location;

  LocationChanged(this.location);

  @override
  List<Object> get props => [];
}

class DateChanged extends FormEvent {
  final String date;

  DateChanged(this.date);

  @override
  List<Object> get props => [];
}

class SaveTicket extends FormEvent {
  const SaveTicket();
  @override
  List<Object> get props => [];
}

class SubmitTicket extends FormEvent {
  const SubmitTicket();

  @override
  List<Object> get props => [];
}
