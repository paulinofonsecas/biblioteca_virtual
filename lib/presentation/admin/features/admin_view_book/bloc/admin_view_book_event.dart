part of 'admin_view_book_bloc.dart';

abstract class AdminViewBookEvent  extends Equatable {
  const AdminViewBookEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_admin_view_book_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomAdminViewBookEvent extends AdminViewBookEvent {
  /// {@macro custom_admin_view_book_event}
  const CustomAdminViewBookEvent();
}
