// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'form_bloc.dart';

abstract class FormState extends Equatable {
  const FormState();

  @override
  List<Object> get props => [];
}

class FormInitial extends FormState {
  @override
  List<Object> get props => [];
}

class FormValidate extends FormState {
  final String title;
  final String description;
  final String location;
  final String date;
  FormValidate({
    required this.title,
    required this.description,
    required this.location,
    required this.date,
  });

  FormValidate copyWith({
    String? title,
    String? description,
    String? location,
    String? date,
  }) {
    return FormValidate(
      title: title ?? this.title,
      description: description ?? this.description,
      location: location ?? this.location,
      date: date ?? this.date,
    );
  }

  @override
  List<Object> get props => [title, description, location, date];
}
