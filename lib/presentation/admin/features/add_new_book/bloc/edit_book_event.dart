part of 'edit_book_bloc.dart';

sealed class EditBookEvent extends Equatable {
  const EditBookEvent();

  @override
  List<Object> get props => [];
}

final class UpdateNewBookEvent extends EditBookEvent {
  const UpdateNewBookEvent(this.context);

  final BuildContext context;

  @override
  List<Object> get props => [context];
}
