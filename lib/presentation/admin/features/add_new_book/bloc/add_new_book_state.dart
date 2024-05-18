// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_new_book_bloc.dart';

class AddNewBookState extends Equatable {
  const AddNewBookState({
    this.customProperty = 'Default Value',
  });

  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  AddNewBookState copyWith({
    String? customProperty,
  }) {
    return AddNewBookState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

class AddNewBookInitial extends AddNewBookState {
  const AddNewBookInitial() : super();
}

class SaveNewBookLoading extends AddNewBookState {
  const SaveNewBookLoading() : super();
}

class SaveNewBookSuccess extends AddNewBookState {
  const SaveNewBookSuccess() : super();
}

class SaveNewBookError extends AddNewBookState {
  const SaveNewBookError(
    this.message,
  ) : super();

  final String message;

  @override
  List<Object> get props => [message];
}
