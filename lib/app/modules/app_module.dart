import 'package:bilioteca_virtual/core/util/enums.dart';
import 'package:bilioteca_virtual/presentation/admin/admin_page.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_author/view/add_new_author_page.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/view/add_new_book_page.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/view/admin_view_book_page.dart';
import 'package:bilioteca_virtual/presentation/admin/features/categorias_livro/view/categorias_livro_page.dart';
import 'package:bilioteca_virtual/presentation/authentication/presentation/pages/auth/sign_in_page.dart';
import 'package:bilioteca_virtual/presentation/authentication/presentation/pages/auth/sign_up_page.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/view/home_page.dart';
import 'package:bilioteca_virtual/presentation/client/features/lista_leituras/lista_leituras.dart';
import 'package:bilioteca_virtual/presentation/features/p_d_f_reader/view/p_d_f_reader_page.dart';
import 'package:bilioteca_virtual/presentation/splash/view/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    Modular.setInitialRoute('/splash');

    r
      ..child(
        '/splash',
        child: (context) => const SplashPage(),
      )
      ..child(
        '/admin',
        child: (context) => const AdminPage(),
      )
      ..child(
        '/sign-in',
        child: (context) => const SignIn(),
      )
      ..child(
        '/sign-up',
        child: (context) => const SignUp(),
      )
      ..child(
        '/admin/add-new-book',
        child: (context) => const AddNewBookPage(),
      )
      ..child(
        '/admin/add-new-book',
        child: (context) => const AddNewBookPage(),
      )
      ..child(
        '/admin/categorias-livro',
        child: (context) => const CategoriasLivroPage(),
      )
      ..child(
        '/admin/add-new-author',
        child: (context) => const AddNewAuthorPage(
          manageMode: ManageMode.add,
        ),
      )
      ..child(
        '/admin/edit-author',
        child: (context) => const AddNewAuthorPage(
          manageMode: ManageMode.edit,
        ),
      )
      ..child(
        '/admin/edit-book',
        child: (context) => const AddNewBookPage(),
      )
      ..child(
        '/view-book/:bookId',
        child: (context) {
          return AdminViewBookPage(
            bookId: r.args.params['bookId'] as String,
            parent: 'parent',
          );
        },
      )
      ..child(
        '/admin/read_pdf/:bookId',
        child: (context) {
          return PDFReaderPage(
            bookId: r.args.params['bookId'] as String,
            parent: 'parent',
          );
        },
      )
      ..child('/client', child: (c) => const HomePage())
      ..child('/lista-leitura', child: (c) => const ListaLeiturasPage());
  }
}
