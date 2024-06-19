// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_new_author_bloc.dart';

abstract class AddNewAuthorEvent extends Equatable {
  const AddNewAuthorEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_add_new_book_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomAddNewAuthorEvent extends AddNewAuthorEvent {
  /// {@macro custom_add_new_book_event}
  const CustomAddNewAuthorEvent();
}

class SaveNewAuthorEvent extends AddNewAuthorEvent {
  const SaveNewAuthorEvent({
    required this.name,
    required this.manageMode,
    this.path,
  });

  final String name;
  final String? path;
  final ManageMode manageMode;

  @override
  List<Object> get props => [name, path ?? '', manageMode];
}
