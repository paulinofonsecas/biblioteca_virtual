import 'package:bilioteca_virtual/presentation/authentication/domain/entities/first_page_entity.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/repositories/authentication_repository.dart';

class FirstPageUseCase {
  FirstPageUseCase(this.repository);
  final AuthenticationRepository repository;

  FirstPageEntity call() {
    return repository.firstPage();
  }
}
