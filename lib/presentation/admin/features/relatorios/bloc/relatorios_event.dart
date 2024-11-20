part of 'relatorios_bloc.dart';

abstract class RelatoriosEvent  extends Equatable {
  const RelatoriosEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_relatorios_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomRelatoriosEvent extends RelatoriosEvent {
  /// {@macro custom_relatorios_event}
  const CustomRelatoriosEvent();
}

class GerarRelatorioUsuarioEvent extends RelatoriosEvent {
  /// {@macro custom_relatorios_event}
  const GerarRelatorioUsuarioEvent();
}class GerarRelatorioObrasEvent extends RelatoriosEvent {
  /// {@macro custom_relatorios_event}
  const GerarRelatorioObrasEvent();
}class GerarRelatorioConsultasEvent extends RelatoriosEvent {
  /// {@macro custom_relatorios_event}
  const GerarRelatorioConsultasEvent();
}class GerarRelatorioSistemaEvent extends RelatoriosEvent {
  /// {@macro custom_relatorios_event}
  const GerarRelatorioSistemaEvent();
}
