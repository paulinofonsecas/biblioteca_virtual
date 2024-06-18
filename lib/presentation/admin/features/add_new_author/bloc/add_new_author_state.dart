// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_new_author_bloc.dart';

class AddNewAuthorState extends Equatable {
  const AddNewAuthorState({
    this.customProperty = 'Default Value',
  });

  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  AddNewAuthorState copyWith({
    String? customProperty,
  }) {
    return AddNewAuthorState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

class EditAuthorState extends Equatable {
  const EditAuthorState({
    this.customProperty = 'Default Value',
  });

  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  EditAuthorState copyWith({
    String? customProperty,
  }) {
    return EditAuthorState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

class AddNewAuthorInitial extends AddNewAuthorState {
  const AddNewAuthorInitial() : super();
}

class SaveNewAuthorLoading extends AddNewAuthorState {
  const SaveNewAuthorLoading() : super();
}

class EditAuthorLoading extends EditAuthorState {
  const EditAuthorLoading() : super();
}

class SaveNewAuthorSuccess extends AddNewAuthorState {
  const SaveNewAuthorSuccess() : super();
}

class SaveNewAuthorError extends AddNewAuthorState {
  const SaveNewAuthorError(
    this.message,
  ) : super();

  final String message;

  @override
  List<Object> get props => [message];
}