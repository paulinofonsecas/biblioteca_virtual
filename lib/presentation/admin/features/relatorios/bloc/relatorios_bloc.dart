import 'dart:async';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/core/util/messages.dart';
import 'package:bilioteca_virtual/data/repositories/relatorio_repository.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_books_use_cases.dart';
import 'package:bilioteca_virtual/domain/use_cases/relatorios_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:printing/printing.dart';
part 'relatorios_event.dart';
part 'relatorios_state.dart';

class RelatoriosBloc extends Bloc<RelatoriosEvent, RelatoriosState> {
  late IGestaoRelatorioUseCase _useCase;
  RelatoriosBloc() : super(const RelatoriosInitial()) {
    _useCase = GestaoRelatorioUseCase(
        repository: GestaoRelatorioRepository(),
        booksUseCases: getIt<IBooksUseCases>());
    on<GerarRelatorioUsuarioEvent>(_onGerarRelatorioUsuarioEvent);
    on<GerarRelatorioObrasEvent>(_onGerarRelatorioObrasEvent);
  }

  FutureOr<void> _onGerarRelatorioUsuarioEvent(
    GerarRelatorioUsuarioEvent event,
    Emitter<RelatoriosState> emit,
  ) async {
    emit(const GerandoRalatorio());
    final dados = await _useCase.gerarRelatorioUsuario();
    emit(const RalatorioGerado());
    await Printing.layoutPdf(onLayout: (format) async => dados);
  }
  
  FutureOr<void> _onGerarRelatorioObrasEvent(
    GerarRelatorioObrasEvent event,
    Emitter<RelatoriosState> emit,
  ) async {
    emit(const GerandoRalatorio());
    final dados = await _useCase.gerarRelatorioObras();
    emit(const RalatorioGerado());
    await Printing.layoutPdf(onLayout: (format) async => dados);
  }
}
