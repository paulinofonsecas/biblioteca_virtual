import 'package:equatable/equatable.dart';

class FirstPageEntity extends Equatable {
  const FirstPageEntity({
    required this.isLoggedIn,
    required this.isVerifyingEmail,
  });
  final bool isLoggedIn;
  final bool isVerifyingEmail;

  @override
  List<Object?> get props => [isLoggedIn, isVerifyingEmail];
}
