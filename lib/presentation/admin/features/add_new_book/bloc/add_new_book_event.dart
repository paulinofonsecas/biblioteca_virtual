// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_new_book_bloc.dart';

abstract class AddNewBookEvent extends Equatable {
  const AddNewBookEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_add_new_book_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomAddNewBookEvent extends AddNewBookEvent {
  /// {@macro custom_add_new_book_event}
  const CustomAddNewBookEvent();
}

class SaveNewBookEvent extends AddNewBookEvent {
  const SaveNewBookEvent(
    this.context,
  );

  final BuildContext context;

  @override
  List<Object> get props => [context];
}
